/*
	Filename: 	RRPServer_inventory_save
*/

private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {[]};
if ((uniform _unit) isEqualTo "mgsr_robe") exitWith {[]};

private _primaryWeaponMagazine = "";
private _secondaryWeaponMagazine = "";
private _handgunMagazine = "";
{
	if (count _x > 4 && {(_x select 4) isEqualType []}) then {
		private _weapon = _x select 0;
		private _magazine = (_x select 4) select 0;
		if !(isNil "_magazine") then {
			switch _weapon do {
				case (primaryWeapon _unit): {_primaryWeaponMagazine = _magazine};
				case (secondaryWeapon _unit): {_secondaryWeaponMagazine = _magazine};
				case (handgunWeapon _unit): {_handgunMagazine = _magazine};
			};
		};
	};
} forEach (weaponsItems _unit);

_radioParent = 
{
	private _item = param [0,"",[""]];
	if (_item isEqualTo "") exitWith {""};

	private _return = _item;

	if (getText (configFile >> "CfgWeapons" >> _item >> "simulation") isEqualTo "ItemRadio") then {
		if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
			private _radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
			if !(_radio isEqualTo "") then {_return = _radio};
		};
	};
	_return
};

private _assigned = [];
{
	_assigned pushBack ([_x] call _radioParent);
} forEach (assignedItems _unit);

private _return = [
	/* 00 */	[uniform _unit,uniformItems _unit],
	/* 01 */	[vest _unit,vestItems _unit],
	/* 02 */	[backpack _unit,backpackItems _unit],
	/* 03 */	headgear _unit,
	/* 04 */	goggles _unit,
	/* 05 */	binocular _unit,
	/* 06 */	[primaryWeapon _unit,primaryWeaponItems _unit,_primaryWeaponMagazine],
	/* 07 */	[secondaryWeapon _unit,secondaryWeaponItems _unit,_secondaryWeaponMagazine],
	/* 08 */	[handgunWeapon _unit,handgunItems _unit,_handgunMagazine],
	/* 09 */	_assigned - [binocular _unit]
];

_return