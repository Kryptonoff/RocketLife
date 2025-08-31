private _item = param [0,"",[""]];
if (_item isEqualTo "") exitWith {[]};

if !(isNil {missionNamespace getVariable format ["EIDC_%1",_item]}) exitWith {missionNamespace getVariable format ["EIDC_%1",_item]};

private _cfg = switch (true) do {
		case (isClass (configFile >> "CfgMagazines" >> _item)) : {"CfgMagazines"};
		case (isClass (configFile >> "CfgWeapons" >> _item)) : {"CfgWeapons"};
		case (isClass (configFile >> "CfgVehicles" >> _item)) : {"CfgVehicles"};
		case (isClass (configFile >> "CfgGlasses" >> _item)) : {"CfgGlasses"};
		default {""};
};

if (_cfg isEqualTo "") exitWith {[]};
if !(_cfg isEqualType "") exitWith {[]};
if !(isClass (configFile >> _cfg >> _item)) exitWith {[]};

private _config = configFile >> _cfg >> _item;
private _displayName = getText (_config >> "displayName");
private _picture = getText (_config >> "picture");
private _desc = getText (_config >> "descriptionshort");
private _model = getText(_config >> "model");

private _bis_ItemType = [_item] call BIS_fnc_itemType;
private _category = _bis_ItemType select 0;
private _type = _bis_ItemType select 1;

private _weight = switch (_category) do {
	case "Weapon" : {
		switch (_type) do {
			case "AssaultRifle";
			case "Shotgun";
			case "Rifle";
			case "SniperRifle" : {10};
			case "BombLauncher";
			case "Cannon";
			case "GrenadeLauncher";
			case "Launcher";
			case "Mortar";
			case "RocketLauncher" : {20};
			case "MachineGun";
			case "SubmachineGun" : {15};
			case "Handgun" : {5};
			default {5};
		};
	};
	case "Equipment" : {
		switch (_type) do {
			case "Glasses": {1};
			case "Headgear": {2};
			case "Vest";
			case "Uniform": {3};
			case "Backpack": {4};
			default {1};
		};
	};
	case "Magazine": {1};
	case "Item": {1};
	default {1};
};

private ["_magazines","_muzzles","_optics","_pointers","_bipods","_underBarrels"];
if (_cfg isEqualTo "CfgWeapons") then {
	_muzzles = [_item, "muzzle"] call BIS_fnc_compatibleItems;
	_optics = [_item, "optic"] call BIS_fnc_compatibleItems;
	_pointers = [_item, "pointer"] call BIS_fnc_compatibleItems;
	_bipods = [_item, "bipod"] call BIS_fnc_compatibleItems;

	_magazines = getArray (_config >> "magazines");
	private _muzzlesCfg = getArray (_config >> "muzzles");
	if !(_muzzlesCfg isEqualTo []) then {
		private _base = inheritsFrom _config;
		private _tmp = [];
		{
			if !(_x isEqualTo "this") then {
				_tmp = getArray (_base >> _x >> "magazines");
				{
					_magazines set[count _magazines, _x];
				} foreach (_tmp);
			};
		} foreach _muzzlesCfg;
	};
} else {
	_magazines = [];
	_muzzles = [];
	_optics = [];
	_pointers = [];
	_bipods = [];
};


private _price = -1;
if (_category isEqualTo "Equipment") then {
	private _assortLIst = ('true' configClasses (missionConfigFile >>  "LifeCfgClothShops"));
	_assortLIst  pushBack "exclusive_clothing";
	{
		private _curConfig = _x;
		{
			{
				if ((_x # 0) isEqualTo _item) then {_price = _x # 2;};
			} forEach (if !(_curConfig isEqualTo "exclusive_clothing") then {(getArray(_curConfig >> _x))} else {(getArray(missionConfigFile >>  "ptw" >> "exclusive_clothing" >> _x))})
		} forEach ["uniforms","headgear","goggles","vests","backpacks"];
	} forEach _assortLIst
} else {
	_price = if (isClass (missionConfigFile >> "LifeCfgItems" >> _item)) then {getNumber(missionConfigFile >> "LifeCfgItems" >> _item >> "price")} else {-1};
};

private _return = [_item,_displayName,_picture,_desc,_category,_type,_weight,_magazines,_muzzles,_optics,_pointers,_bipods,_price,_model];

missionNamespace setVariable [format ["EIDC_%1",_item],_return];

_return
