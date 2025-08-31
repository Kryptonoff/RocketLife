/*

	Filename: 	RRPClient_evh_onPlayerRespawn.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
life_corpse = param [1,ObjNull,[ObjNull]];
if (!isNull life_corpse) then
{
	if !(life_corpse call RRPClient_util_isInStratis) then
	{
		private _markerID = format ["%1_%2",round(random 9999),(call RRPClientPlayerID)];
		life_death_markers pushBack [_markerID,(getPos life_corpse),(time + 1800),RRPPublicSessionID];
		[["life_death_markers",life_death_markers,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
	};
};
if (count life_death_markers > 0) then {
	[] spawn RRPClient_dz_deathTimer;
	call RRPClient_dz_createMarker;
};

[life_corpse] spawn RRPClient_system_dropItems;
// [[name _unit,getPlayerUID _unit],"system_loadPlayerLoot"] call RRPClient_system_hcExec;

_unit remoteExecCall ["RRPServer_system_loadPlayerLoot",2];

["updateSessionRequest",[netId player]] call RRPClient_system_send;
[_unit] call RRPClient_system_clearAllLifeVars;
["all"] call RRPClient_system_removeBuff;

call RRPClient_system_setTag;
call RRPClient_system_setTitle;
call RRPClient_tags_setTags;

_unit addRating 9999999999999999;

[_unit,"lifeState","RESPAWN"] call CBA_fnc_setVarNet;
[_unit,"karma",life_karma] call CBA_fnc_setVarNet;
switch (player call getSide) do {
	case "civ": {
		[_unit,"lvl",RRPClientGroupLevel] call CBA_fnc_setVarNet;
		call RRPClient_loadout_civ;
	};
	case "reb": {
		[_unit,"lvl",RRPClientGroupLevel] call CBA_fnc_setVarNet;
		call RRPClient_loadout_reb;
	};
	case "cop": {
		[_unit,"copLevel",RRPClientGroupLevel] call CBA_fnc_setVarNet;
		call RRPClient_loadout_cop;
	};
	case "med": {
		[_unit,"medrank",RRPClientGroupLevel] call CBA_fnc_setVarNet;
		call RRPClient_loadout_medic;
	};
};

life_use_atm = true;
RRPClientHunger = 100;
RRPClientThirst = 100;
life_carryWeight = 0;
life_prisonkey = false;
life_respawned = false;
life_slave = false;
life_pvp = false;
life_inwarzone = false;
life_newLife = true;
life_ids = [];
life_tempHouses = [];

_unit playMoveNow "AinjPpneMstpSnonWnonDnon";
removeBackpack _unit;
removeAllWeapons _unit;

if !(EQUAL((goggles _unit),"")) then {removeGoggles _unit};
if !(EQUAL((goggles life_corpse),"")) then {removeGoggles life_corpse};

call RRPClient_surgery_Init;
if (LIFE_SETTINGS(getNumber,"life_enableFatigue") isEqualTo 0) then {_unit enableFatigue false};

call RRPClient_system_saveGear;
call RRPClient_session_updateRequest;
