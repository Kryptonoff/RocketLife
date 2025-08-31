/*

	Filename: 	RRPClient_inventory_update.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _fnc_initSlot = {
	params [["_itemClass", ""], "_control", "_type"];

	if (_itemClass isEqualTo "") then {
		_picture = switch (_type) do { 
			case "uniform": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa"};
			case "vest": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa"};
			case "backpack": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa"};
			case "headgear": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa"};
			case "goggles": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa"};
			case "hmd": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa"};
			case "compass": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa"};
			case "gps": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa"};
			case "map": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa"};
			case "radio": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa"};
			case "watch": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa"};
			case "binocular": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa"};
			case "primWepPl": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa"};
			case "primWepMuzzle": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa"};
			case "primWepFlash": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"};
			case "primWepOptics": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"};
			case "primWepMuzzleMag1": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa"};
			case "primWepMuzzleMag2": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazineGL_gs.paa"};
			case "primWepBipod": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"};
			case "secWepPl": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa"};
			case "secWepMuzzle": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa"};
			case "secWepFlash": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"};
			case "secWepOptics": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"};
			case "secWepMuzzleMag1": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa"};
			case "secWepBipod": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"};
			case "hgWepPl": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa"};
			case "hgWepMuzzle": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa"};
			case "hgWepFlash": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"};
			case "hgWepOptics": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"};
			case "hgWepMuzzleMag1": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa"};
			case "hgWepBipod": {"\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"};

			default {"\fatum_config\new2310\aye.paa"}; 
		};
		_control ctrlSetText _picture;
	} else {
		private _itemDS = _itemClass call RRPClient_inventory_itemDetailsShort;
		_control ctrlSetText (_itemDS select 2);
		/*_control ctrlSetEventHandler ["MouseButtonDblClick", '
			_slotDragInfo = "' + _type + '";
			_itemClass = uiNamespace getVariable [format["%1_class",_slotDragInfo], ""];
			_itemAmmo = uiNamespace getVariable [format["%1Ammo_class",_slotDragInfo], -1];
			_success = [_slotDragInfo, _itemClass, fl_inv_currentContainer] call RRPClient_inventory_removeFromSlot;
			if (_success) then {[_itemClass, 1, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_addToBox};

			[] spawn RRPClient_inventory_update;
		'];*/
		/*_tooltipText = _itemDS select 3;
		if (_tooltipText isEqualTo "") then {
			_tooltipText = _itemDS select 1;
		} else {
			_tooltipText = (_itemDS select 1) + "\n" + ([_tooltipText, ["<br />", "<br/>"], "\n"] call RRPClient_inventory_replaceArray);
		};
		_control ctrlSetTooltip _tooltipText;*/
	};
	uiNamespace setVariable [format["%1_class",_type], _itemClass];
};

disableSerialization;
if (isNull (findDisplay 1000)) exitWith {};
private _display = findDisplay 1000;

private _PrimWepPl = primaryweapon player;
private _SecWepPl = secondaryweapon player;
private _HgWepPl = handgunweapon player;

private _PrimWepMuzzle = "";
private _PrimWepFlash = "";
private _PrimWepOptics = "";
private _PrimWepMuzzleMag1 = "";
private _PrimWepMuzzleMag1Ammo = -1;
private _PrimWepMuzzleMag2 = "";
private _PrimWepMuzzleMag2Ammo = -1;
private _PrimWepBipod = "";

private _SecWepMuzzle = "";
private _SecWepFlash = "";
private _SecWepOptics = "";
private _SecWepMuzzleMag1 = "";
private _SecWepMuzzleMag1Ammo = -1;
private _SecWepMuzzleMag2 = "";
private _SecWepMuzzleMag2Ammo = -1;
private _SecWepBipod = "";

private _HgWepMuzzle = "";
private _HgWepFlash = "";
private _HgWepOptics = "";
private _HgWepMuzzleMag1 = "";
private _HgWepMuzzleMag1Ammo = -1;
private _HgWepMuzzleMag2 = "";
private _HgWepMuzzleMag2Ammo = -1;
private _HgWepBipod = "";

private _weaponsItemsPl = weaponsitems player;
private _weaponsItemsCargo = weaponsItemsCargo backpackContainer player;
{
	if (_x in _weaponsItemsCargo) then {_weaponsItemsPl set [_forEachIndex, -1]; _weaponsItemsCargo set [_weaponsItemsCargo find _x, -1]};
} forEach _weaponsItemsPl;
_weaponsItemsPl = _weaponsItemsPl - [-1];
{
	switch (_x select 0) do {
		case _PrimWepPl: {
			_PrimWepMuzzle = _x select 1;
			_PrimWepFlash = _x select 2;
			_PrimWepOptics = _x select 3;
			_PrimWepMag1Array = _x select 4;
			_PrimWepMag2Array = _x select 5;
			if !(_PrimWepMag1Array isEqualTo []) then {
				_PrimWepMuzzleMag1 = _PrimWepMag1Array select 0;
				_PrimWepMuzzleMag1Ammo = _PrimWepMag1Array select 1;
			};
			if !(_PrimWepMag2Array isEqualTo []) then {
				_PrimWepMuzzleMag2 = _PrimWepMag2Array select 0;
				_PrimWepMuzzleMag2Ammo = _PrimWepMag2Array select 1;
			};
			if !([_PrimWepMag1Array, _PrimWepMag2Array] isEqualTo [[], []]) then {
				_muzzleMagazines = _PrimWepPl call RRPClient_inventory_getMuzzleMagazines;
				if !(_PrimWepMuzzleMag1 in (_muzzleMagazines select 0 select 1)) then {
					_PrimWepMuzzleMag2 = _PrimWepMuzzleMag1;
					_PrimWepMuzzleMag2Ammo = _PrimWepMuzzleMag1Ammo;

					if !(_PrimWepMag2Array isEqualTo []) then {
						_PrimWepMuzzleMag1 = _PrimWepMag2Array select 0;
						_PrimWepMuzzleMag1Ammo = _PrimWepMag2Array select 1;					
					} else {
						_PrimWepMuzzleMag1 = "";
						_PrimWepMuzzleMag1Ammo = -1;
					};
				};
			};
			_PrimWepBipod = _x select 6;
		};
		case _SecWepPl: {
			_SecWepMuzzle = _x select 1;
			_SecWepFlash = _x select 2;
			_SecWepOptics = _x select 3;
			_SecWepMag1Array = _x select 4;
			_SecWepMag2Array = _x select 5;
			if !(_SecWepMag1Array isEqualTo []) then {
				_SecWepMuzzleMag1 = _SecWepMag1Array select 0;
				_SecWepMuzzleMag1Ammo = _SecWepMag1Array select 1;
			};
			if !(_SecWepMag2Array isEqualTo []) then {
				_SecWepMuzzleMag2 = _SecWepMag2Array select 0;
				_SecWepMuzzleMag2Ammo = _SecWepMag2Array select 1;
			};
			_SecWepBipod = _x select 6;
		};
		case _HgWepPl: {
			_HgWepMuzzle = _x select 1;
			_HgWepFlash = _x select 2;
			_HgWepOptics = _x select 3;
			_HgWepMag1Array = _x select 4;
			_HgWepMag2Array = _x select 5;
			if !(_HgWepMag1Array isEqualTo []) then {
				_HgWepMuzzleMag1 = _HgWepMag1Array select 0;
				_HgWepMuzzleMag1Ammo = _HgWepMag1Array select 1;
			};
			if !(_HgWepMag2Array isEqualTo []) then {
				_HgWepMuzzleMag2 = _HgWepMag2Array select 0;
				_HgWepMuzzleMag2Ammo = _HgWepMag2Array select 1;
			};
			_HgWepBipod = _x select 6;
		};
	};
} foreach _weaponsItemsPl;//чтобы было только назначенное оружие

uiNamespace setVariable ["PrimWepMuzzleMag1Ammo_class", _PrimWepMuzzleMag1Ammo];
uiNamespace setVariable ["PrimWepMuzzleMag2Ammo_class", _PrimWepMuzzleMag2Ammo];
uiNamespace setVariable ["SecWepMuzzleMag1Ammo_class", _SecWepMuzzleMag1Ammo];
uiNamespace setVariable ["SecWepMuzzleMag2Ammo_class", _SecWepMuzzleMag2Ammo];
uiNamespace setVariable ["HgWepMuzzleMag1Ammo_class", _HgWepMuzzleMag1Ammo];
uiNamespace setVariable ["HgWepMuzzleMag2Ammo_class", _HgWepMuzzleMag2Ammo];

private _uniformPl = uniform player;
private _vestPl = vest player;
private _backpackPl = backpack player;

private _headgearPl = headgear player;
private _gogglesPl = goggles player;

private _compassPl = "";
private _gpsPl = "";
private _mapPl = "";
private _radioPl = "";
private _watchPl = "";
private _NVGogglesPl = "";
private _BinocularPl = "";
{
	_itemDS = _X call RRPClient_inventory_itemType;
	switch (_itemDS select 1) do { 
		case "Compass": {_compassPl = _x};
		case "UAVTerminal";
		case "GPS": {_gpsPl = _x};
		case "Map": {_mapPl = _x};
		case "Radio": {_radioPl = _x};
		case "Watch": {_watchPl = _x};
		case "NVGoggles": {_NVGogglesPl = _x};
		case "LaserDesignator";
		case "Binocular": {_BinocularPl = _x};

		default {[format ["Ошибка! default inventory open %1", _x]] call hints}; 
	};
} foreach assignedItems player;

[_uniformPl, _display displayCtrl 6331, "uniform"] call _fnc_initSlot;
[_vestPl, _display displayCtrl 6381, "vest"] call _fnc_initSlot;
[_backpackPl, _display displayCtrl 6191, "backpack"] call _fnc_initSlot;

[_headgearPl, _display displayCtrl 6240, "headgear"] call _fnc_initSlot;
[_gogglesPl, _display displayCtrl 6216, "goggles"] call _fnc_initSlot;
[_NVGogglesPl, _display displayCtrl 6217, "hmd"] call _fnc_initSlot;

[_compassPl, _display displayCtrl 6212, "compass"] call _fnc_initSlot;
[_gpsPl, _display displayCtrl 6215, "gps"] call _fnc_initSlot;
[_mapPl, _display displayCtrl 6211, "map"] call _fnc_initSlot;
[_radioPl, _display displayCtrl 6214, "radio"] call _fnc_initSlot;
[_watchPl, _display displayCtrl 6213, "watch"] call _fnc_initSlot;
[_BinocularPl, _display displayCtrl 6238, "binocular"] call _fnc_initSlot;

[_PrimWepPl, _display displayCtrl 610, "primWepPl"] call _fnc_initSlot;
[_PrimWepMuzzle, _display displayCtrl 620, "primWepMuzzle"] call _fnc_initSlot;
[_PrimWepFlash, _display displayCtrl 622, "primWepFlash"] call _fnc_initSlot;
[_PrimWepOptics, _display displayCtrl 621, "primWepOptics"] call _fnc_initSlot;
[_PrimWepMuzzleMag1, _display displayCtrl 623, "primWepMuzzleMag1"] call _fnc_initSlot;
[_PrimWepMuzzleMag2, _display displayCtrl 644, "primWepMuzzleMag2"] call _fnc_initSlot;
[_PrimWepBipod, _display displayCtrl 641, "primWepBipod"] call _fnc_initSlot;

[_SecWepPl, _display displayCtrl 611, "secWepPl"] call _fnc_initSlot;
[_SecWepMuzzle, _display displayCtrl 624, "secWepMuzzle"] call _fnc_initSlot;
[_SecWepFlash, _display displayCtrl 626, "secWepFlash"] call _fnc_initSlot;
[_SecWepOptics, _display displayCtrl 625, "secWepOptics"] call _fnc_initSlot;
[_SecWepMuzzleMag1, _display displayCtrl 627, "secWepMuzzleMag1"] call _fnc_initSlot;
[_SecWepBipod, _display displayCtrl 642, "secWepBipod"] call _fnc_initSlot;

[_HgWepPl, _display displayCtrl 612, "hgWepPl"] call _fnc_initSlot;
[_HgWepMuzzle, _display displayCtrl 628, "hgWepMuzzle"] call _fnc_initSlot;
[_HgWepFlash, _display displayCtrl 630, "hgWepFlash"] call _fnc_initSlot;
[_HgWepOptics, _display displayCtrl 629, "hgWepOptics"] call _fnc_initSlot;
[_HgWepMuzzleMag1, _display displayCtrl 631, "hgWepMuzzleMag1"] call _fnc_initSlot;
[_HgWepBipod, _display displayCtrl 643, "hgWepBipod"] call _fnc_initSlot;

//private _groundTab = _display displayCtrl 632;
//private _backpackTab = _display displayCtrl 619;

private _totalLoad = _display displayCtrl 6308;
private _totalLoadVirt = _display displayCtrl 63081;
private _totalLoadVirtText = _display displayCtrl 63082;
_totalLoad progressSetPosition ([backpackContainer player] call RRPClient_inventory_getContainerLoad);
_totalLoadVirt progressSetPosition (life_carryWeight/life_maxWeight);
_totalLoadVirtText ctrlSetText format ["%1/%2", life_carryWeight, life_maxWeight];

private _groundLoad = _display displayCtrl 6307;
private _groundLoadVirt = _display displayCtrl 63071;
private _groundLoadVirtText = _display displayCtrl 63072;
_groundLoad progressSetPosition ([fl_inv_currentContainer] call RRPClient_inventory_getContainerLoad);
private _currentLoadVirt = (fl_inv_currentContainer getVariable ["Trunk",[[],0]]) select 1;
private _maxLoadVirt = [fl_inv_currentContainer] call RRPClient_inventory_getContainerMaxMassVirt;
_groundLoadVirt progressSetPosition (_currentLoadVirt/_maxLoadVirt);
_groundLoadVirtText ctrlSetText format ["%1/%2", _currentLoadVirt, _maxLoadVirt];

private _PrimWepMuzzleMag1Text = _display displayCtrl 6231;
if (_PrimWepMuzzleMag1Ammo >= 0) then {_PrimWepMuzzleMag1Text ctrlSetStructuredText parseText format ["%1 <img size='1' image='\rimas_agent\assets\hud\bullet_icon.paa'/>",_PrimWepMuzzleMag1Ammo]};
private _SecWepMuzzleMag1Text = _display displayCtrl 6271;
if (_SecWepMuzzleMag1Ammo >= 0) then {_SecWepMuzzleMag1Text ctrlSetStructuredText parseText format ["%1 <img size='1' image='\rimas_agent\assets\hud\bullet_icon.paa'/>",_SecWepMuzzleMag1Ammo]};
private _HgWepMuzzleMag1Text = _display displayCtrl 6311;
if (_HgWepMuzzleMag1Ammo >= 0) then {_HgWepMuzzleMag1Text ctrlSetStructuredText parseText format ["%1 <img size='1' image='\rimas_agent\assets\hud\bullet_icon.paa'/>",_HgWepMuzzleMag1Ammo]};

[nil, (GVAR_UINS["BackpackInv_Filter",0])] call RRPClient_inventory_filterBackpack;
[nil, (GVAR_UINS["ExternalInv_Filter",0])] call RRPClient_inventory_filterExternal;