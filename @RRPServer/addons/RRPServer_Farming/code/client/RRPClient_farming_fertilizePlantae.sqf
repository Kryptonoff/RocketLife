/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_fertilizePlantae.sqf
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

	_isFertilized = _state select 5;
	if (_isFertilized isEqualTo -1) throw "Нет нужде в удобрении";
	if (_isFertilized isEqualTo 1) throw "Растение уже удобрено!";

	if ((["ftmItem_Fertilizer"] call RRPClient_inventory_itemCount) isEqualTo 0) throw "У вас нет удобрения!";
	["ftmItem_Fertilizer"] call RRPClient_system_removeItem;

	["Удобряем растение", 10, "", "", true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	_curGrowKoef = _state select 2;
	_state set[2, _curGrowKoef * 1.1];
	_state set[5, 1];
	_plant setVariable ["growState",_state,true];

	life_action_inUse = false;
} catch {
	["Растения", _exception] call toastError;
};