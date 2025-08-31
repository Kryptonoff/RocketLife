#include "..\..\script_macros.hpp"
private _itemClass = "";
private _itemAmmo = "";
private _source = "";
private _allowed = ["external", "backpack_list"];
private _errorTextPlayer = "";
private _errorTextExternal = "";

if !(isNil "fl_inv_slotDragInfo") then {
	_itemClass = uiNamespace getVariable [format["%1_class", fl_inv_slotDragInfo], ""];
	_itemAmount = 1;
	_itemAmmo = uiNamespace getVariable [format["%1Ammo_class", fl_inv_slotDragInfo], -1];

	_source = "slot";
};
if !(isNil "fl_inv_externalDragInfo") then {
	_itemClass = fl_inv_externalDragInfo select 0;
	_itemAmount = fl_inv_externalDragInfo select 1;
	_itemAmmo = fl_inv_externalDragInfo select 2;

	_source = "external";
};
if !(isNil "fl_inv_backpackDragInfo") then {
	_itemClass = fl_inv_backpackDragInfo select 0;
	_itemAmount = fl_inv_backpackDragInfo select 1;
	_itemAmmo = fl_inv_backpackDragInfo select 2;
	
	_source = "backpack_list";
};

private _itemType = [_itemClass] call RRPClient_inventory_itemType;
private _category = _itemType select 0;
private _type = _itemType select 1;

switch (_category) do {
	case "Equipment": {
		switch (_type) do { 
			case "Uniform": {_allowed pushBack "uniform"};
			case "Vest": {_allowed pushBack "vest"};
			case "Backpack": {
				if ((items player + magazines player + backpackCargo (backpackContainer player)) isEqualTo [] OR _source isEqualTo "slot") then {_allowed pushBack "backpack"} else {_errorTextPlayer = "Вам необходимо вытащить всё из рюкзака!"};
			};

			case "Headgear": {
				_itemSubItems = getArray(configFile >> "CfgWeapons" >> _itemClass >> "subItems");
				if (_itemSubItems isNotEqualTo []) then {
					{
						switch (([_x] call RRPClient_inventory_itemType) select 1) do {
							case "NVGoggles": {
								if (hmd player isEqualTo "") then {_allowed pushBack "headgear"} else {_errorTextPlayer = "Снимите ПНВ чтобы надеть этот шлем"};
							}; 
							case "Radio": {
								if ((uiNamespace getVariable ["radio_class", ""]) isEqualTo "") then {_allowed pushBack "headgear"} else {_errorTextPlayer = "Снимите рацию чтобы надеть этот шлем"};
							}; 
							default {}; 
						};
					} forEach _itemSubItems;
				} else {
					_allowed pushBack "headgear";
				};
			};
			case "Glasses": {_allowed pushBack "goggles"};
			default {}; 
		};

	};
	case "Weapon": {
		_weaponType = getNumber(configFile >> "CfgWeapons" >> _itemClass >> "type");
		private _weaponsItemsPl = weaponsItems player;
		private _allItemsMass = _itemClass call RRPClient_inventory_getItemMass;

		{
			if (_itemClass == _x select 0) exitWith {
				_Muzzle = _x select 1;
				if (_Muzzle != "") then {_allItemsMass = _allItemsMass + (_Muzzle call RRPClient_inventory_getItemMass)};
				_Flash = _x select 2;
				if (_Flash != "") then {_allItemsMass = _allItemsMass + (_Flash call RRPClient_inventory_getItemMass)};
				_Optics = _x select 3;
				if (_Optics != "") then {_allItemsMass = _allItemsMass + (_Optics call RRPClient_inventory_getItemMass)};
				_Mag1Array = _x select 4;
				if (_Mag1Array isNotEqualTo []) then {_allItemsMass = _allItemsMass + ((_Mag1Array select 0) call RRPClient_inventory_getItemMass)};
				_Mag2Array = _x select 5;
				if (_Mag2Array isNotEqualTo []) then {_allItemsMass = _allItemsMass + ((_Mag2Array select 0) call RRPClient_inventory_getItemMass)};
				_PrimWepBipod = _x select 6;
				if (_PrimWepBipod != "") then {_allItemsMass = _allItemsMass + (_PrimWepBipod call RRPClient_inventory_getItemMass)};
			};
		} foreach _weaponsItemsPl;

		if !(isNull (backpackContainer player)) then {
			_currentWeight = (backpackContainer player) call RRPClient_inventory_getContainerLoadAbs;
			_maxWeight = backpackContainer player call RRPClient_inventory_getContainerMaxMass;
			if ((_currentWeight + _allItemsMass) > _maxWeight) then {_allowed = _allowed - ["backpack_list"]; _errorTextPlayer = "В рюкзаке нет места!"};		
		};

		if !(isNull fl_inv_currentContainer) then {
			_currentWeight = fl_inv_currentContainer call RRPClient_inventory_getContainerLoadAbs;
			_maxWeight = fl_inv_currentContainer call RRPClient_inventory_getContainerMaxMass;
			if ((_currentWeight + _allItemsMass) > _maxWeight) then {_allowed = _allowed - ["external"]; _errorTextExternal = "В контейнере нет места!"};	
		};

		switch (_weaponType) do { 
			case 1 : {_allowed pushBack "primWepPl"}; 
			case 2 : {_allowed pushBack "hgWepPl";}; 
			case 4 : {_allowed pushBack "secWepPl"}; 
			default {}; 
		};
	};
	case "Magazine": {
		if (_source isEqualTo "external") exitWith {_errorTextPlayer = "Магазины можно заряжать только из рюкзака!"};
		private _PrimWepPl = primaryweapon player;
		private _SecWepPl = secondaryweapon player;
		private _HgWepPl = handgunweapon player;
	
		private _PrimWepPlMagazines = [[], []];
		private _SecWepPlMagazines = [];
		private _HgWepPlMagazines = [];
		if (_PrimWepPl != "") then {
			_PrimWepPlMagazines = _PrimWepPl call RRPClient_inventory_getMuzzleMagazines;
			if ([_itemClass, _PrimWepPlMagazines#0#1] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "primWepMuzzleMag1"};
			if (!isNil {_PrimWepPlMagazines#1#1} AND {[_itemClass, _PrimWepPlMagazines#1#1] call RRPClient_inventory_inArray != -1}) then {_allowed pushBack "primWepMuzzleMag2"};
		};
		if (_SecWepPl != "") then {
			_SecWepPlMagazines = [_SecWepPl, true] call bis_fnc_compatibleMagazines;
			if ([_itemClass, _SecWepPlMagazines] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "secWepMuzzleMag1"};
		};
		if (_HgWepPl != "") then {
			_HgWepPlMagazines = [_HgWepPl, true] call bis_fnc_compatibleMagazines;
			if ([_itemClass, _HgWepPlMagazines] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "hgWepMuzzleMag1"};
		};
	};
	case "Item": {
		private _PrimWepPl = primaryweapon player;
		private _SecWepPl = secondaryweapon player;
		private _HgWepPl = handgunweapon player;
	
		switch (_type) do { 
			case "Compass": {_allowed pushBack "compass"};
			case "UAVTerminal";
			case "GPS": {_allowed pushBack "gps"};
			case "Map": {_allowed pushBack "map"};
			case "Radio": {
				_headgearClass = headgear player;
				if (_headgearClass isNotEqualTo "") then {
					_itemSubItems = getArray(configFile >> "CfgWeapons" >> _headgearClass >> "subItems");
					if (_itemSubItems isNotEqualTo []) then {
						if ((_itemSubItems findIf {(([_x] call RRPClient_inventory_itemType) select 1) isEqualTo "Radio"}) isNotEqualTo -1) then {_errorTextPlayer = "Снимите шлем чтобы надеть рацию"} else {_allowed pushBack "radio"};
					} else {
						_allowed pushBack "radio";
					};
				} else {
					_allowed pushBack "radio";
				};
			};
			case "Watch": {_allowed pushBack "watch"};
			case "NVGoggles": {
				_headgearClass = headgear player;
				if (_headgearClass isNotEqualTo "") then {
					_itemSubItems = getArray(configFile >> "CfgWeapons" >> _headgearClass >> "subItems");
					if (_itemSubItems isNotEqualTo []) then {
						if ((_itemSubItems findIf {(([_x] call RRPClient_inventory_itemType) select 1) isEqualTo "NVGoggles"}) isNotEqualTo -1) then {_errorTextPlayer = "Снимите шлем чтобы надеть ПНВ"} else {_allowed pushBack "hmd"};
					} else {
						_allowed pushBack "hmd";
					};
				} else {
					_allowed pushBack "hmd";
				};
			};
			case "LaserDesignator";
			case "Binocular": {_allowed pushBack "binocular"};

			case "AccessoryMuzzle": {
				if (_source isEqualTo "slot") exitWith {_errorTextPlayer = "Аксессуары можно устанавливать только из рюкзака или контейнера!"; _allowed pushBack fl_inv_slotDragInfo};

				if (_PrimWepPl != "") then {
					_PrimWepPlmuzzles = [_PrimWepPl, "muzzle"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _PrimWepPlmuzzles] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "primWepMuzzle"};
				};
				if (_SecWepPl != "") then {
					_SecWepPlmuzzles = [_SecWepPl, "muzzle"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _SecWepPlmuzzles] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "secWepMuzzle"};
				};
				if (_HgWepPl != "") then {
					_HgWepPlmuzzles = [_HgWepPl, "muzzle"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _HgWepPlmuzzles] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "hgWepMuzzle"};
				};
			};
			case "AccessorySights": {
				if (_source isEqualTo "slot") exitWith {_errorTextPlayer = "Аксессуары можно устанавливать только из рюкзака или контейнера!"; _allowed pushBack fl_inv_slotDragInfo};

				if (_PrimWepPl != "") then {
					_PrimWepPloptics = [_PrimWepPl, "optic"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _PrimWepPloptics] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "primWepOptics"};
				};
				if (_SecWepPl != "") then {
					_SecWepPloptics = [_SecWepPl, "optic"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _SecWepPloptics] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "secWepOptics"};
				};
				if (_HgWepPl != "") then {
					_HgWepPloptics = [_HgWepPl, "optic"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _HgWepPloptics] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "hgWepOptics"};
				};
			};
			case "AccessoryPointer": {
				if (_source isEqualTo "slot") exitWith {_errorTextPlayer = "Аксессуары можно устанавливать только из рюкзака или контейнера!"; _allowed pushBack fl_inv_slotDragInfo};

				if (_PrimWepPl != "") then {
					_PrimWepPlpointers = [_PrimWepPl, "pointer"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _PrimWepPlpointers] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "primWepFlash"};
				};
				if (_SecWepPl != "") then {
					_SecWepPlpointers = [_SecWepPl, "pointer"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _SecWepPlpointers] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "secWepFlash"};
				};
				if (_HgWepPl != "") then {
					_HgWepPlpointers = [_HgWepPl, "pointer"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _HgWepPlpointers] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "hgWepFlash"};
				};
			};
			case "AccessoryBipod": {
				if (_source isEqualTo "slot") exitWith {_errorTextPlayer = "Аксессуары можно устанавливать только из рюкзака или контейнера!"; _allowed pushBack fl_inv_slotDragInfo};

				if (_PrimWepPl != "") then {
					_PrimWepPlbipods = [_PrimWepPl, "bipod"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _PrimWepPlbipods] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "primWepBipod"};
				};
				if (_SecWepPl != "") then {
					_SecWepPlbipods = [_SecWepPl, "bipod"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _SecWepPlbipods] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "secWepBipod"};
				};
				if (_HgWepPl != "") then {
					_HgWepPlbipods = [_HgWepPl, "bipod"] call BIS_fnc_compatibleItems;
					if ([_itemClass, _HgWepPlbipods] call RRPClient_inventory_inArray != -1) then {_allowed pushBack "hgWepBipod"};
				};
			};
			case "MineDetector": {};
			case "Toolkit": {};
			case "FirstAidKit": {};
			case "Medikit": {};

			default {}; 
		};
	};
	case "Mine": {};
	case "VirtualItem": {
		if ([_itemClass, 1, life_carryWeight, life_maxWeight] call RRPClient_inventory_canAddVirtItem < 1) then {_allowed = _allowed - ["backpack_list"]; _errorTextPlayer = "Места не хватает"};
		if ([_itemClass, 1, ((fl_inv_currentContainer getVariable ["Trunk",[[],0]]) select 1), (fl_inv_currentContainer call RRPClient_inventory_getContainerMaxMassVirt)] call RRPClient_inventory_canAddVirtItem < 1) then {_allowed = _allowed - ["external"]; _errorTextExternal = "Места не хватает"};
		if (LIFE_SETTINGS(getNumber,"life_useFuelTrucks") isEqualTo 1) then {
			private _truck = typeOf fl_inv_currentContainer;
			if (EQUAL(_truck,"Land_LuggageHeap_03_F")) exitWith {};
		
			private _fuelStuff = LIFE_SETTINGS(getArray,"life_fuelStuff");
			private _fuelTrucks = LIFE_SETTINGS(getArray,"life_fuelTrucks");
			
			switch (true) do {
				case (!(_itemClass in _fuelStuff) && (_truck in _fuelTrucks)): {_allowed = _allowed - ["external"]; _errorTextExternal = "Только нефть и уран"};
				case ((_itemClass in _fuelStuff) && !(_truck in _fuelTrucks)): {_allowed = _allowed - ["external"]; _errorTextExternal = "Уран и нефть нельзя"};
			};
		};
	};
	default {}; 
};
if !(_category in ["VirtualItem", "Weapon"]) then {
	if ([_itemClass, 1, backpackContainer player] call RRPClient_inventory_canAddItem < 1) then {_allowed = _allowed - ["backpack_list"]; _errorTextPlayer = "В рюкзаке нет места!"};
	if ([_itemClass, 1, fl_inv_currentContainer] call RRPClient_inventory_canAddItem < 1) then {_allowed = _allowed - ["external"]; _errorTextExternal = "В контейнере нет места!"};

	if (_source isEqualTo "slot" AND _type isEqualTo "Backpack" AND !((items player + magazines player + backpackCargo (backpackContainer player)) isEqualTo [])) then {_allowed = _allowed - ["external", "backpack_list"]; _errorTextPlayer = "Вам необходимо вытащить всё из рюкзака!"};
	if (_source isEqualTo "slot" AND _type isEqualTo "Backpack") then {_allowed = _allowed - ["backpack_list"]};

	if (!([_itemClass] call RRPClient_system_canUseItem) AND _source isEqualTo "external") then {_allowed = []; _errorTextExternal = "Вы не можете использовать этот предмет"};	
};
if (_category isEqualTo "Weapon") then 
{
	if (!([_itemClass] call RRPClient_system_canUseItem) AND _source isEqualTo "external") then {_allowed = []; _errorTextExternal = "Вы не можете использовать этот предмет"};	
};

if (backpack player isEqualTo "") then {_allowed = _allowed - ["backpack_list"]; _errorTextPlayer = "Вам нужен рюкзак!"};

if (_errorTextExternal != "" OR _errorTextPlayer != "") then {[_errorTextExternal, _errorTextPlayer] call RRPClient_inventory_setTitle};
_allowed call RRPClient_inventory_colorSlots;

fl_inv_allowedDragInfo = _allowed;