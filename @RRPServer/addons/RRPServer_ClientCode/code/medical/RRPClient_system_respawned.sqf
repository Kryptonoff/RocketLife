/*

	Filename: 	RRPClient_system_respawned.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
player setVariable ["tf_unable_to_use_radio",false];
["all"] call RRPClient_system_removeBuff;

if (!isNull life_corpse) then
{
	// private _containers = nearestObjects [life_corpse,["WeaponHolderSimulated","Box_Wps_F"],5];
	// {deleteVehicle _x} forEach _containers;

	if ((EQUAL(player call getSide,"cop") && (["cop"] call RRPClient_system_playerCount) > LIFE_SETTINGS(getNumber,"life_cop_min")) OR (player call getSide in ["civ","reb"])) then
	{
		if (life_is_arrested) exitWith {};
		if ([life_corpse,"players_spawn_zone"] call CBA_fnc_getDistance < 300) exitWith {};
	};
	deleteVehicle life_corpse;
};

2 fadeSound 1;
cutText ["", "BLACK IN", 1];

if (BANK > 10000 && {player call getSide in ["civ","reb"]}) then
{
	private _newlifep = switch (player call getSide) do
	{
		case "civ": {5};
		case "reb": {4};
	};

	private _price = (BANK * _newlifep) / 100;
	if (FETCH_CONST(life_donator) > 0) then {_price = ['priceSell',_price] call RRPClient_system_VIP};
	_priceC = 0;
	if !(RRPClientLTDsData isEqualTo []) then
	{
		RRPClientLTDsData params ["_id","_name"];
		_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
		_dataCompany params ["_owner","_name","_bank","_members"];
		if (_bank > 10000) then
		{
			_priceC = (_bank * _newlifep) / 100;
			[player,_id,_priceC] remoteExecCall ["RRPServer_ltd_takeCash",2];
		};
	};
	if !(getPlayerUID player in getArray(missionConfigFile >> "ptw" >> "disableRespawnMoney")) then {
		[player,"atm","take",_price] remoteExecCall ["RRPServer_system_moneyChange",2];
	};
	if (_priceC isEqualTo 0) then {
		[format[" <t size='2.2'><t color='#1dae0e'>Новая жизнь</t></t><br /><br /> Ваше возрождение обошлось вам в $%1 (%2%3 от вашего банковского счета и счета вашей компании). Цените свою жизнь!", [_price + _priceC] call RRPClient_util_numberText, _newlifep,"%"]] call hints;
	}else{
		[format["<t size='2.2'><t color='#1dae0e'>Новая жизнь</t></t><br /><br /> Ваше возрождение обошлось вам в $%1 (%2%3 от вашего банковского счета и $%4 c счета вашей компании). Цените свою жизнь!", [_price + _priceC] call RRPClient_util_numberText, _newlifep,"%",[_priceC] call RRPClient_util_numberText]] call hints;
	};
};

call RRPClient_system_updateViewDistance;
call RRPClient_session_updateRequest;

if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn RRPClient_hud_init;
	enableHUD call RRPClient_hud_show;
};
if (isNull LIFE_HANDLE_EFFECTS) then {LIFE_HANDLE_EFFECTS = [] spawn RRPClient_effects_Init};

player enableStamina true;
player switchMove "amovpercmstpsnonwnondnon";
life_logout_position = [];
ADD(life_deaths,1);
[["life_deaths",life_deaths,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;


if (life_deaths >= life_deaths_max) then
{
	[true] spawn RRPClient_system_logout;
} else {
	[] spawn {
		waitUntil {isnull (findDisplay 38500)};
		[parseText format ["<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Внимание!<br/><br/></t>Вы умерли <t color='#ffd800'>%1</t> раз(а) из <t color='#ffd800'>%2</t> допустимых.<br/>После достижения лимита вы не сможете зайти до следующей бури.<br/><br/> <t color='#9cff00'>Цените свою жизнь!</t></t>", life_deaths, life_deaths_max],[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
	};
};

//Bad boy
if (life_is_arrested) exitWith
{
	life_is_arrested = false;
	life_death_markers = [];
	[player,"isArrested"] call RRPClient_system_clearGlobalVar;
	[player,true,life_jail_time] call RRPClient_system_jail;
	call RRPClient_session_updateRequest;
	[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
};


[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
if (!(isNil "ClientEventInfo")) then {[] spawn RRPClient_events_effetcEventZone};
