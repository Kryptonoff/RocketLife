/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_wateringPlantae.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
try {
	if (life_action_inUse OR life_action_gathering) throw "Вы заняты";
	if !(isNull objectParent player) throw "Вы не можете заниматься этим находясь в транспорте!";

	private _plant = param [0,objNull,[objNull]];
	if (isNull _plant) throw "Растения больше нет";

	private _state = _plant getVariable ["growState",[]];
	if (_state isEqualTo []) throw "У растения нет состояния";

	_isWatered = _state select 4;
	if (_isWatered isEqualTo 1) throw "Растение уже полито";
	//поиск воды из фляжки или бутылки
	private _searchItem = "";
	{
		if ([_x] call RRPClient_inventory_itemCount > 0) exitWith {
			_searchItem = _x;
		};
	} forEach [
	    "extItem_canteen_salt",
		"extItem_bottle_salt",
		"extItem_bottleclean_100",
		"extItem_bottleclean_50",
		"extItem_canteen_clean_3",
		"extItem_canteen_clean_2",
		"extItem_canteen_clean_1"
	];

	if (_searchItem isEqualto "") throw "У вас нечем полить";

	private _newItem = switch (_searchItem) do {
		case "extItem_canteen_clean_3": {"extItem_canteen_clean_2"};
		case "extItem_canteen_clean_2": {"extItem_canteen_clean_1"};
		case "extItem_canteen_clean_1": {"extItem_canteen_empty"};
		case "extItem_bottleclean_100": {"extItem_bottleclean_50"};
		case "extItem_bottleclean_50": {"extItem_bottle_empty"};
		case "extItem_canteen_salt": {"extItem_canteen_empty"};
		case "extItem_bottle_salt": {"extItem_bottle_empty"};
		default {""};
	};
	if (_newItem isEqualto "") throw "Ошибка, нет следующего предмета!";
	
	if ([_newItem, 1, backpackContainer player] call RRPClient_inventory_canAddItem < 1) throw "Инвентарь переполнен";
	if !([_searchItem] call RRPClient_system_removeItem) throw "Не удалось удалить предмет";
	[_newItem, 1] call RRPClient_inventory_addItemToInventory;
	
	["Поливаем растение", 10, "", "", true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	_state set [4, 1];
	_plant setVariable ["growState",_state,true];

} catch {
	["Растения", _exception] call toastError;
};