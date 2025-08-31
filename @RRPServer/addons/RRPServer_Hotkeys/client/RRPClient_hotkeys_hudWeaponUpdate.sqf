/*

	Filename:	RRPClient_hotkeys_hudWeaponUpdate.sqf
	Project:	Fatum Altis Life
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
private _ui = uiNamespace getVariable ["playerHUD",displayNull];
if (isNull _ui) exitWith {};

private _getControl = {
	params ["_key"];
	private _ctrl = controlNull;
	private _index = ((_ui getVariable "map") find _key) + 10000;
	if (_index != -1) then {
		_ctrl = _ui displayCtrl _index;
	};
	_ctrl;
};
_alpha = 0.5;
_defaultcolor = [0,0,0,_alpha];

for "_i" from 0 to 8 do {
	_color = [(_defaultcolor select 0),(_defaultcolor select 1),(_defaultcolor select 2),_alpha];
	_type_name = "";
	_item = "";
	_picture = "";

	_type_name = (bind_number_array select _i) select 0;
	_item = (bind_number_array select _i) select 1;
	if ((currentWeapon player) isEqualTo _item AND _item != "") then {_color = [0.165,0.42,0.18,_alpha]};
	
	if !(_type_name isEqualTo "") then {
		switch (_type_name) do {
			case "inventory": {
				_itemInfo = [_item] call RRPClient_util_itemDetails;
				_picture = format ["%1",_itemInfo select 2];
	
				if !(life_saveBind) then {
					if !(_item in (magazines player)) then {
						_itemGroups = [
							["RRPItem_jivchik_1", "RRPItem_jivchik_1_2", "RRPItem_jivchik_1_3"],
							["RRPItem_perventiPills_1_1", "RRPItem_perventiPills_1_2"],
							["RRPItem_Canteen_Dirty_F", "RRPItem_Canteen_Dirty_C"],
							["RRPItem_Canteen_Clean_F", "RRPItem_Canteen_Clean_C"],
							["RRPItem_Container_Rabbit_Rice", "RRPItem_Container_Rabbit_Rice_L"],
							["RRPItem_Container_Rooster_Potato", "RRPItem_Container_Rooster_Potato_L"],
							["RRPItem_Container_Rooster_Rice", "RRPItem_Container_Rooster_Rice_L"],
							["RRPItem_Container_Goat_Potato", "RRPItem_Container_Goat_Potato_L"],
							["RRPItem_Container_Goat_Rice", "RRPItem_Container_Goat_Rice_L"],
							["RRPItem_Container_Fin_Rice", "RRPItem_Container_Fin_Rice_L"],
							["RRPItem_Container_Chicken_Potato", "RRPItem_Container_Chicken_Potato_L"],
							["RRPItem_Container_Chicken_Rice", "RRPItem_Container_Chicken_Rice_L"],
							["RRPItem_Container_Sheep_Potato", "RRPItem_Container_Sheep_Potato_L"],
							["RRPItem_Container_Sheep_Rice", "RRPItem_Container_Sheep_Rice_L"],
							["RRPItem_Container_Tuna_Potato", "RRPItem_Container_Tuna_Potato_L"],
							["RRPItem_Container_Tuna_Rice", "RRPItem_Container_Tuna_Rice_L"],
							["RRPItem_Container_CatShark_Potat", "RRPItem_Container_CatShark_Potato_L"],
							["RRPItem_Container_CatShark_Rice", "RRPItem_Container_CatShark_Rice_L"],
							["RRPItem_Container_Salema_Potato", "RRPItem_Container_Salema_Potato_L"],
							["RRPItem_Container_Salema_Rice", "RRPItem_Container_Salema_Rice_L"],
							["RRPItem_Container_Mullet_Potato", "RRPItem_Container_Mullet_Potato_L"],
							["RRPItem_Container_Mullet_Rice", "RRPItem_Container_Mullet_Rice_L"],
							["RRPItem_Container_Ornate_Potato", "RRPItem_Container_Ornate_Potato_L"],
							["RRPItem_Container_Ornate_Rice", "RRPItem_Container_Ornate_Rice_L"],
							["RRPItem_Container_Mackrel_Potato", "RRPItem_Container_Mackrel_Potato_L"],
							["RRPItem_Container_Mackrel_Rice", "RRPItem_Container_Mackrel_Rice_L"]
						];
					
						{
							_itemGroup = _x;
							if (_item in _itemGroup) exitWith {
								_itemGroupId = _itemGroup findIf {_x in (magazines player)};
								if (_itemGroupId isNotEqualTo -1) then {_item = _itemGroup select _itemGroupId};
							};
						} forEach _itemGroups;
					};
					
					if !(_item in (magazines player)) then {
						bind_number_array set [_i, ["",""]];
						_picture = "";
					};
					
				};
			};
			case "weapons": {
				switch (_item) do {
					if (_item isEqualTo (currentWeapon player) AND (currentWeapon player) != "") then {_color = [0.165,0.42,0.18,_alpha]};
					default {
						_itemInfo = [_item] call RRPClient_util_itemDetails;
						_picture = format ["%1",_itemInfo select 2];
					}; 
				};
			};
			/*case "gesture": {
				_picture = getText(missionConfigFile >> "LifeCfgSettings" >> "MFMpictureGesture");
			};
			case "dance": {
				_picture = getText(missionConfigFile >> "LifeCfgSettings" >> "MFMpictureDance");
			};
			case "pose": {
				_picture = getText(missionConfigFile >> "LifeCfgSettings" >> "MFMpicturePose");
			};*/
			default {
				/* code */
			};
		};
	};			

	_ctrlBg = ("main_button_bg_" + str _i) call _getControl;
	_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;

	_ctrlBg ctrlSetBackgroundColor _color;
	_ctrlPicture ctrlSetText _picture;
};

["bind_number_array", str bind_number_array] call RRPClient_reg_write;