_setLoadout = {
	params [
		["_unit",objNull],
		["_loadout",[]]
	];

	if (isNull _unit) exitWith {};
	if (_loadout isEqualTo []) exitWith {};
	_loadout params [
		"_primaryWeapon",
		"_secondaryWeapon",
		"_handgunWeapon",
		"_uniform",
		"_vest",
		"_backpack",
		"_helmet",
		"_glass"
	];
	_unit addWeapon (_primaryWeapon select 0);
	_unit addWeapon (_secondaryWeapon select 0);
	_unit addWeapon (_handgunWeapon select 0);
	_unit forceAddUniform (_uniform select 0);
	_unit addVest (_vest select 0);
	_unit addBackpack (_backpack select 0);
	_unit addHeadgear _helmet;
	_unit addGoggles _glass;
};

_spawnUnit = {
	private _config = _this;
	private _varName = configName _config;
	private _className = getText(_config >> "objectClassName");
	private _positions = getArray(_config >> "objPosition");
	_positions params ["_posWorld","_vectorDir","_vectorUp"];
	private _animations = getArray(_config >> "animations");
	private _face = getText(_config >> "face");
	private _loadout = getArray(_config >> "loadout");
	private _name = getText(_config >> "name");
	private _icon = getText(_config >> "icon");
	private _description = getText(_config >> "description");
	private _condition = getText(_config >> "condition");
	private _dialog = getText(_config >> "startDialog");

	_trader = _className createVehicleLocal [0,0,0];
	_trader setVariable ["BIS_enableRandomization", false];
	_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_trader disableAI "ANIM";
	_trader disableAI "MOVE";
	_trader disableAI "FSM";
	_trader disableAI "AUTOTARGET";
	_trader disableAI "TARGET";
	_trader disableAI "CHECKVISIBLE";
	_trader allowDamage false; 
	_trader removeAllEventHandlers "HandleDamage";
	_trader setFace _face;
	_trader addEventHandler ["Killed", {deleteVehicle (_this select 0)}];

	_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
	_attachToObject setPosWorld _posWorld;
	_posWorld = [0, 0, 0];

	_trader reveal _attachToObject;
	_attachToObject disableCollisionWith _trader;
	_trader disableCollisionWith _attachToObject;
	_trader attachTo [_attachToObject, _posWorld];
	_trader setVectorDirAndUp [_vectorDir,_vectorUp];
	_trader switchMove (_animations select 0);
	_trader setVariable ["RRPSide","NPC"];
	_animationCount = count _animations;
	if (_animationCount > 1) then
	{
		_trader setVariable ["Animations", _animations];
		_trader addEventHandler	["AnimDone", {_this call RRPClient_event_onAnimDone}];
	};

	_trader setVariable ["npcClass",_varName];
	_trader setVariable ["NPC_Condition",_condition];
	_trader setVariable ["NPC_Name",_name];
	_trader setVariable ["NPC_Icon",_icon];
	_trader setVariable ["NPC_InitDialog",_dialog];
	_trader setVariable ["NPC_Description",_description];
	[_trader,_loadout] call _setLoadout;
	
	_trader setVehicleVarName _varName;
	missionNamespace setVariable [_varName,_trader];
	_trader
};

_despawnUnit = {
	deleteVehicle (attachedTo _this);
	deleteVehicle _this;
};

{
	_pos = (getArray(_x >> "objPosition") select 0);
	if (player distance2d _pos < 120) then {
		if (isNull (missionNamespace getVariable [configName _x,objNull])) then 
		{
			_x call _spawnUnit;
		};
	}else{	if !(isNull (missionNamespace getVariable [configName _x,objNull])) then 
		{
			missionNamespace getVariable [configName _x,objNull] call _despawnUnit;
		};
	};
} forEach ("true" configClasses (getMissionConfig "ConfigNpc"));
