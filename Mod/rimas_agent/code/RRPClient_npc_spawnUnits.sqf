private _config = getMissionConfig "ConfigNpc";
{
	private _varName = configName _x;
	private _className = getText(_x >> "objectClassName");
	private _positions = getArray(_x >> "objPosition");
	_positions params ["_posWorld","_vectorDir","_vectorUp"];
	private _animations = getArray(_x >> "animations");
	private _face = getText(_x >> "face");
	private _loadout = getArray(_x >> "loadout");
	private _name = getText(_x >> "name");
	private _icon = getText(_x >> "icon");
	private _description = getText(_x >> "description");
	private _condition = getText(_x >> "condition");
	private _dialog = getText(_x >> "startDialog");

	private _logic = "Logic" createVehicleLocal [0,0,0];
	private _npc = _className createVehicleLocal [0,0,0];
	_logic setPosWorld _posWorld;
	_logic setVectorDirAndUp [_vectorDir, _vectorUp];

	_npc setVariable ["BIS_enableRandomization", false];
    _npc setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _npc setVariable ["Animations", _animations];
    _npc disableAI "ANIM";
    _npc disableAI "MOVE";
    _npc disableAI "FSM";
    _npc disableAI "AUTOTARGET";
    _npc disableAI "TARGET";
    _npc disableAI "CHECKVISIBLE";
	_npc allowDamage false;
	_npc removeAllEventHandlers "HandleDamage";
	_npc removeAllMPEventHandlers "MPHit";
	
	_npc setFace _face;
	_npc setUnitLoadout _loadout;
	_npc setPosWorld _posWorld;
	_npc setVectorDirAndUp [_vectorDir, _vectorUp];
	_npc reveal _logic;
	_npc attachTo [_logic, [0,0,0]];
	_npc switchMove (_animations select 0);
	_npc addEventHandler ["AnimDone",{_this call RRPClient_event_onAnimDone}];

	_npc setVariable ["npcClass",_varName];
	_npc setVariable ["NPC_Condition",_condition];
	_npc setVariable ["NPC_Name",_name];
	_npc setVariable ["NPC_Icon",_icon];
	_npc setVariable ["NPC_InitDialog",_dialog];
	_npc setVariable ["NPC_Description",_description];
	
	_npc setVehicleVarName _varName;
	
}forEach ("true" configClasses _config);