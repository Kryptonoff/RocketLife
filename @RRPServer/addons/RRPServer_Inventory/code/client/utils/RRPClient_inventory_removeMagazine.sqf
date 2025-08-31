/*

	Filename: 	RRPClient_inventory_removeMagazine.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
params [
	["_item","",[""]],
	["_ammo",-1,[-1]]
];
if (_ammo isEqualTo -1) exitWith {[_item] call RRPClient_system_removeItemFromInventory};

private _oldMagazines = (magazinesAmmo player) select {(_x select 0) isEqualTo _item};
if !([_item, _ammo] in _oldMagazines) exitWith {false};

player removeMagazines _item;

private _deleted = false;
{
	if (_x isEqualTo [_item,_ammo] AND !_deleted) then {
		_deleted = true;	
	} else {
		player addMagazine _x;
	};
} forEach _oldMagazines;

_deleted