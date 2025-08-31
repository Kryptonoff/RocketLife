/*

	Filename: 	RRPClient_dmg_KilledInAgony.sqf
	Project: 	Rimas Altis Life RPG
	Web:		Rimas RP
*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_source",ObjNull,[ObjNull]],
	["_instigator",ObjNull,[ObjNull]],
	["_damage",0,[0]],
	["_projectile","",[""]],
	["_selection","",[""]]
];

if (isNull _source && isNull _instigator) exitWith {"DMG - Kill In Agony - Source and Instigator is NULL" call RRPClient_system_log};

private _killer = switch (true) do {
	case (_instigator isKindOf "CAManBase" && isPlayer _instigator) : {_instigator};
	case (_source isKindOf "CAManBase" && isPlayer _source) : {_source};
	default {objNull};
};

if (isNull _killer) exitWith {"DMG - Kill in Agony - Killer is NULL" call RRPClient_system_log};
if ((_killer getVariable ["lastKillObj",objNull]) isEqualTo _unit) exitWith {"DMG - Its happened again!" call RRPClient_system_log};
if (LSDEAD(_unit)) exitWith {"DMG - Kill in Agony - Already Dead" call RRPClient_system_log};
if !(EQUAL(_selection,"head")) exitWith {"DMG - Kill in Agony - Not in head" call RRPClient_system_log};
if (_damage < 0.89) exitWith {"DMG - Kill in Agony - Need more damage in head" call RRPClient_system_log};
if ((time - life_agonyStartTime) < 5) exitWith {"DMG - Kill in Agony - Too soon" call RRPClient_system_log};
if (EQUAL(_projectile,"")) exitWith {"DMG - Kill in Agony - Bullet is empty" call RRPClient_system_log};
if (_projectile in ["DDOPP_B_Taser","Caseless_blau"]) exitWith {"DMG - Kill in Agony - Taser" call RRPClient_system_log};
if !(NOTINVEH(_killer)) exitWith {"DMG - Kill in Agony - Shooter in Veh" call RRPClient_system_log};
if !(LSINCAP(_unit)) exitWith {"DMG - Kill in Agony - Not in agony" call RRPClient_system_log};
if ([_unit,_killer] call CBA_fnc_getDistance > 5) exitWith {"DMG - Kill in Agony - Distance Must be < 5m" call RRPClient_system_log};
_killer getVariable ["lastKillObj",_unit];
if !(EQUAL(_unit,_killer)) then {
	if !(EQUAL(_killer call getSide,"cop")) then {
		private _type = switch (player call getSide) do {
			case "civ": {"C188C"};
			case "reb": {"188I"};
			case "cop": {"188W"};
			case "med": {"188E"};
			default {"C188C"};
		};

		if !(_killer getVariable ["GroupId",-1] isEqualTo 6) then {
			[getPlayerUID _killer,_type] remoteExecCall ["RRPServer_ws_wantedAdd",2];
		};
	};

	titleText [format["Вас добил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _killer],"PLAIN"];
	[["manyak","manyak_pro"],1] remoteExecCall ["RRPClient_ach_gateway",_killer];
	[getPlayerUID _killer,currentWeapon _killer,"kill"] remoteExecCall ["insertKillLog",2];
	[format ["!!KILL!!: %1 (%2) убил %3 (%4) с растояния %5м с (%6) POSv: %7 POSk: %8",GVAR_RNAME(_killer),getPlayerUID _killer,GVAR_RNAME(_unit),steamid,round(_unit distance _killer),_projectile,mapGridPosition _unit,mapGridPosition _killer],"Kill_Log"] remoteExecCall ["RRPServer_system_logIt",2];
	[
		"УБИЛ!",
		"KillLog",
		"FF4000",
		format ["%1 (%2) убил %3 (%4) %9с расcтояния %5м с %10 (%6) %9POSv: %7 POSk: %8%9 K:%11 V:%12",GVAR_RNAME(_killer),getPlayerUID _killer,GVAR_RNAME(_unit),steamid,round(_unit distance _killer),_projectile,mapGridPosition _unit,mapGridPosition _killer,endl,currentWeapon _killer,getPosWorld _killer,getPosWorld _unit]
	] remoteExecCall ["RRPServer_discord_sendMessage",2];
	[50,"добитие",false] remoteExecCall ["addXP",_killer];
};

["all"] call RRPClient_system_removeBuff;
_unit setDamage 1;
