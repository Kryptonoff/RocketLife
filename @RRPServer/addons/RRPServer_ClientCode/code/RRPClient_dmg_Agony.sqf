
params [
	["_unit",ObjNull,[ObjNull]],
	["_source",ObjNull,[ObjNull]],
	["_instigator",ObjNull,[ObjNull]],
	["_projectile","",[""]]
];

try {
	if (isNull _unit) throw "DMG - Agony - _unit null";
	if (isNull _source && isNull _instigator && isNull objectParent _unit) throw "DMG - Agony - Source and Instigator is NULL";
	if (_unit getVariable ["lifeState",""] isEqualTo "INCAPACITATED") throw "DMG - Agony - Already Incap";
	if (_unit getVariable ["lifeState",""] isEqualTo "DEAD") throw "DMG - Agony - Already Dead";

	format["DMG - Agony - IN - Source:  %1 - Instigator: %2",_source,_instigator] call RRPClient_system_log;
	life_agonyStartTime = time;
	_unit setUnconscious true;
	if (visibleMap) then {
		openMap false
	};
	if (!isNull life_DraggedBody) then {
		call RRPClient_system_dropDeadBody
	};
	if !(isNull objectParent _unit) then {
		private _vehicle = objectParent _unit;
		if ((driver _vehicle) isEqualTo _unit) then {
			_vehicle engineOn false
		};

		if (typeOf _vehicle in (getArray(missionConfigFile >> "LifeCfgSettings" >> "life_med_ejectFrom"))) then {
			_unit action ["Eject",_vehicle];
		};

		if ((gunner _vehicle) isEqualTo _unit) then {
			_unit action ["Eject",_vehicle];
		};

		[_unit] call RRPClient_system_setDeadState;
	};

	if (RRPClientIsPlayingRussianRoulette) then {
		_unit remoteExecCall ["RRPServer_russianRoulette_event_onPlayerDied",2];
	};

	RRPClientIsPlayingRussianRoulette = false;
	RRPClientRussianRouletteChair = false;
	call RRPClient_russianRoulette_hide;
	["all"] call RRPClient_system_removeBuff;
	false call RRPClient_hud_show;
	call RRPClient_effects_Terminate;

	[_unit,"restrained"] call RRPClient_system_clearGlobalVar;
	_unit setVariable ["tf_unable_to_use_radio",true];
	[_unit,"medicStatus",[-1,""]] call CBA_fnc_setVarNet;
	[_unit,"lifeState","INCAPACITATED"] call CBA_fnc_setVarNet;

	disableSerialization;
	if (!isNull (findDisplay 49)) then {(findDisplay 49) closeDisplay 0} else {closeDialog 0};
	[_unit] spawn RRPClient_system_deathScreen;

	_unit spawn {
		while {!isTouchingGround _this && (_this getVariable ["lifeState",""] isEqualTo "INCAPACITATED") && !(_this getVariable ["lifeState",""] isEqualTo "DEAD")} do {
			_this setOxygenRemaining 1;
			uiSleep 1;
		};
	};

	if (_source isEqualTo _unit OR (isNull _source && isNull _instigator)) exitWith {
		[{_this call RRPClient_system_deathScreenSetKiller}, [], 1] call CBA_fnc_waitAndExecute;
		if (player getVariable ["RRPVariablePartyMeatActive",false]) then {
			"death" call RRPClient_partyMeat_updateStats;
			false call RRPClient_partyMeat_hudUpdate;
		};
	};

	private _killer = switch (true) do {
		case (_instigator isKindOf "CAManBase" && isPlayer _instigator) : {_instigator};
		case (_source isKindOf "CAManBase" && isPlayer _source) : {_source};
		default {objNull};
	};

	if (isNull _killer) throw "DMG - Agony - Killer is Null";

	private _killerName = _killer getVariable ["realname",""];
	if (_killerName isEqualTo "") then {_killerName = "БезИмени"};
	private _killerPID = getPlayerUID _killer;

	call TFAR_fnc_onDDTangentReleased;
	call TFAR_fnc_onLRTangentReleased;
	call TFAR_fnc_onSwTangentReleased;

	format["DMG - Agony - Killer: %1 - PID: %2",_killerName,_killerPID] call RRPClient_system_log;

	switch (true) do {
		case (player getVariable ["RRPVariablePartyMeatActive",false]): {
			["death",_killer] call RRPClient_partyMeat_updateStats;
			false call RRPClient_partyMeat_hudUpdate;
			if !(iSNull _killer) then {
			["kill",player] remoteExecCall ["RRPClient_partyMeat_updateStats",_killer]
			};
		};


		case ((_killer call getSide) isEqualTo "cop" && {!(_unit call getSide isEqualTo "cop")} && {alive _killer}): {
			player setVariable ["ATMRobber", false, true];
			life_atm_robCounter = 0;
			profileNamespace setVariable ["PRNS_atm_robCounter", life_atm_robCounter];
			saveProfileNamespace;
			// [_unit,_killer,getPlayerUID player,_unit call getSide] remoteExecCall ["RRPServer_ws_wantedKilledbyCop",2];
		};


		case ((_killer call getSide) in ["civ","reb"] && {alive _killer} && {!(getPlayerUID player isEqualTo _killerPID)}):
		{
			if ((([_unit] call RRPClient_system_isSafeZone) # 0) OR {(([_killer] call RRPClient_system_isSafeZone) # 0)}) then{
				[_killerPID,1440,"Убийство в зеленой зоне!"] remoteExecCall ["RRPServer_DB_addBan",2 ];
			};

			if ((_unit getVariable ["GroupId",-1] isNotEqualTo -1) and {_killer getVariable ["GroupId",-1] isNotEqualTo (_unit getVariable ["GroupId",-1])}) then {
				private _type = switch (_unit call getSide) do {
					case "civ": {"C187C"};
					case "reb": {"I187I"};
					case "cop": {"W187W"};
					case "med": {"E187E"};
					default {"C187C"};
				};

				if !(_killer getVariable ["GroupId",-1] isEqualTo 6) then {
					[_killerPID,_type] remoteExecCall ["RRPServer_ws_wantedAdd",2];
				};
			};
		};
	};


	if (!(_killerPID isEqualTo "") && !(getPlayerUID player isEqualTo _killerPID)) then {
		[format ["TO AGONY: %1 (%2) подстрелил %3 (%4) с растояния %5м с (%6) POSv: %7 POSk: %8",_killerName,_killerPID,_unit getVariable ["realname",""],getPlayerUID player,round(_unit distance _killer),_projectile,mapGridPosition _unit,mapGridPosition _killer],"Kill_Log"] remoteExecCall ["RRPServer_system_logIt",2];
		[_killerPID, currentWeapon _killer, "agony"] remoteExecCall ["insertKillLog",2];

		[
			"Отправил в агонию!",
			"KillLog",
			"F7FE2E",
			format ["%1 (%2) подстрелил %3 (%4) %9с раcстояния %5м с %10 (%6) %9POSv: %7 POSk: %8%9 K:%11 V:%12",_killerName,_killerPID,_unit getVariable ["realname",""],getPlayerUID player,round(_unit distance _killer),_projectile,mapGridPosition _unit,mapGridPosition _killer,endl,currentWeapon _killer,getPosWorld _killer,getPosWorld _unit]
		] remoteExecCall ["RRPServer_discord_sendMessage",2];
		[25,"убийство",false] remoteExecCall ["addXP",_killer];
	};

	[{_this call RRPClient_system_deathScreenSetKiller}, [_killerPID], 1] call CBA_fnc_waitAndExecute;

} catch {
	_exception call RRPClient_system_log;
};
