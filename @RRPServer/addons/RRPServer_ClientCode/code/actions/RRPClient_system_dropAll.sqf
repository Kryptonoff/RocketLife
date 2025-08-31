/*
	Filename: 	RRPClient_system_dropAll.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _source = param [0,objNull,[objNull]];

private _box = createVehicle ["Box_Wps_F",getPosATL player,[],0,"NONE"];
waitUntil {!isNull _box};

if (!(EQUAL(PUNIFORM,""))) then {
	{
		[_x,_box] call RRPClient_system_addItemToBox;
	} forEach (uniformItems player);

	[PUNIFORM,_box] call RRPClient_system_addItemToBox;
};

if (!(EQUAL(PVEST,""))) then {
	{
		[_x,_box] call RRPClient_system_addItemToBox;
	} forEach (vestItems player);

	[PVEST,_box] call RRPClient_system_addItemToBox;
};

if (!(EQUAL(PBACKPACK,""))) then {
	{
		[_x,_box] call RRPClient_system_addItemToBox;
	} forEach (backpackItems player);

	[PBACKPACK,_box] call RRPClient_system_addItemToBox;
};

[PGOOGLES,_box] call RRPClient_system_addItemToBox;
[PHEADGEAR,_box] call RRPClient_system_addItemToBox;

{
	if !(EQUAL(_x,"")) then {
		[_x,_box] call RRPClient_system_addItemToBox;
	};
} forEach (assigneditems player);

if (!(EQUAL(RIFLE,""))) then {
	if (count (primaryWeaponMagazine player) > 0) then {
		[((primaryWeaponMagazine player) select 0),_box] call RRPClient_system_addItemToBox;
	};
	if (count (RIFLE_ITEMS) > 0) then {
    	{
    	    [_x,_box] call RRPClient_system_addItemToBox;
    	} forEach (RIFLE_ITEMS);
	};
	[RIFLE,_box] call RRPClient_system_addItemToBox;
};

if (!(EQUAL(PISTOL,""))) then {
	if(count (handgunMagazine player) > 0 && LSALIVE(player)) then {
		[((handgunMagazine player) select 0),_box] call RRPClient_system_addItemToBox;
	};

	if (count (PISTOL_ITEMS) > 0) then {
	    {
	        [_x,_box] call RRPClient_system_addItemToBox;
	    } forEach (PISTOL_ITEMS);
	};
	[PISTOL,_box] call RRPClient_system_addItemToBox;
};

if (!(EQUAL(LAUNCHER,""))) then {
	if (count (secondaryWeaponMagazine player) > 0 && LSALIVE(player)) then {
		[((secondaryWeaponMagazine player) select 0),_box] call RRPClient_system_addItemToBox;
	};
	[LAUNCHER,_box] call RRPClient_system_addItemToBox;
};

private _virtItems = [];
private ["_value","_item","_itemName"];
{
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	_itemName = ITEM_VARNAME(_item);
	if (_value > 0) then {
		_virtItems pushBack [_item,_value];
		SVAR_MNS [_itemName,0];
	};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

life_carryWeight = 0;
[_box,"Trunk",[_virtItems,0]] call CBA_fnc_setVarNet;

call RRPClient_util_stripDownPlayer;

private _pid = getPlayerUID _source;

if (_source call getSide in ["civ","reb"]) then {
	if !(_source in (RRPClientGroupInfo call RRPClient_groups_getMembers)) then {
			[getPlayerUID _source,"480"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	};
};

[
	"Раздел!",
	"StripLog",
	"ff00ff",
	format ["%1 (%2) раздел %3 (%4) @%5",GVAR_RNAME(_source),_pid,GVAR_RNAME(player),steamid,mapGridPosition _source]
] remoteExecCall ["RRPServer_discord_sendMessage",2];

_pid = call {
	if (_pid isEqualto "76561198090549826") exitWith {"76561197995261701"};
	if (_pid isEqualto "76561198108509544") exitWith {"76561198434580158"};
	if (_pid isEqualto "76561198055124016") exitWith {"76561197986051958"};
	_pid
};

format["Человек с PID %1 раздел вас до гола. Сохраните данные, если считаете это нарушением",_pid] call chat;
