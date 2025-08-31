/*

	Filename:	RRPClient_hotkeys_useHotKey.sqf
	Project:	Fatum Altis Life
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
params [
	["_useKeyNumber",-1,[0]],
	["_infoKey",[],[[]]]
];
if (_infoKey isEqualTo [] OR _useKeyNumber isEqualTo -1) exitWith {};
if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
if !(isNull life_DraggedBody) exitWith {};
private _disablePlrActArray = ["unconsciousoutprone", "flyfrommutant_backward", "flyfrommutant_forward", "krovosos_catch_end_suck_victim", "krovosos_catch_end_victim", "krovosos_catch_loop_victim", "krovosos_catch_start_victim", "plagued_armed_melee_noweapon_catch_victim", "plagued_armed_melee_noweapon_catch_victim_behind", "controller_human_unnarmed_anim_in", "controller_human_unnarmed_anim_loop", "controller_human_unnarmed_anim_out"];
if ((animationState player) in _disablePlrActArray OR !(isNil {player getVariable "IsControlledBy"})) exitWith {};

private _unit = player;
//private _vehicle = vehicle _unit;
private _target = cursorTarget;

_infoKey params ["_type", "_item"];

//Для еды.воды 1 бинд на все банки
if ((_type isEqualTo "inventory") && !(_item in (magazines player))) then {
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
		}
	} forEach _itemGroups;
};

if ((_type isEqualTo "inventory") && !(_item in (magazines player))) exitWith {["Горячие клавиши", "Предмет отсутствует!"] call toastError};

switch (_type) do {
	case "inventory": {
		[_item, _target] call RRPClient_inventory_itemAction;
	};
	case "weapons": {
		[_item] call RRPClient_hotkeys_switchWeapon;
	};
	/*case "gesture": {
	  [_item] call RRPClient_gestures_playAction;
	};
	case "dance": {
	  [_item] spawn RRPClient_gestures_danceAction;
	};
	case "pose": {
	  [_item] call RRPClient_gestures_playAction;
	};*/
	default {
	  /* code */
	};
};
