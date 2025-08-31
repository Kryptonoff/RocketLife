/*

	Filename: 	RRPClient_inventory_onTakeItem.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_save", true, [true]]
];
if (_itemClass isEqualTo "") exitWith {};

if (_itemClass in LIFE_SETTINGS(getArray,"life_cheatItems")) exitWith {
	[steamid,GVAR_RNAME(player),-1,"Cheat Item","CheatItem"] remoteExecCall ["fss_bans_add",RSERV];
};

if (_itemClass in LIFE_SETTINGS(getArray,"life_gatherTools")) then {
	if (EQUAL((secondaryWeaponMagazine player),[])) then {
		player addSecondaryWeaponItem "Fatum_Magazine_Swing";
	};
};

if (_itemClass == "Fatum_Tool_MegaStaff") then {
	if (EQUAL((secondaryWeaponMagazine player),[])) then {
		player addSecondaryWeaponItem "Fatum_Magazine_AnubisSwing";
	};
};

if (_itemClass == "ASN_FishingRod") then {
	if (EQUAL((secondaryWeaponMagazine player),[])) then {
		player addSecondaryWeaponItem "sharp_swing";
	};
};

/*private _backpackPlayer = backpackContainer player;
private _vestPlayer = vestContainer player;
private _uniformPlayer = uniformContainer player;
{
	{
		if (_x select 1 in [_backpackPlayer,_vestPlayer,_uniformPlayer]) then {
			[_x select 0] call RRPClient_inventory_removeItem;
			hint format ["Вы не можете дюпать - %1", (_x select 0)];
		};
	} forEach (everyContainer _x);
	
	if (!isNull _backpackPlayer AND (backpackContainer _x) isEqualTo _backpackPlayer) then {
		[typeof _backpackPlayer] call RRPClient_inventory_removeItem;
		hint "Вы не можете дюпать рюкзак";
	};
	if (!isNull _vestPlayer AND (vestContainer _x) isEqualTo _vestPlayer) then {
		[typeof _vestPlayer] call RRPClient_inventory_removeItem;
		hint "Вы не можете дюпать жилет";
	};
	if (!isNull _uniformPlayer AND (uniformContainer _x) isEqualTo _uniformPlayer) then {
		[typeof _uniformPlayer] call RRPClient_inventory_removeItem;
		hint "Вы не можете дюпать форму";
	};
} forEach (nearestObjects [player, ["AllVehicles","Items_base_F"], 10] - [player]);
*/
if (_save) then {
	playSound "click";
	[] call RRPClient_system_saveGear;
};