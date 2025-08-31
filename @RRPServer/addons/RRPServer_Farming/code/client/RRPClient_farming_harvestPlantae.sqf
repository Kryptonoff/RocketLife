/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_harvestPlantae.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/

private _plant = param [0,objNull,[objNull]];

try {

	if (life_action_inUse OR life_action_gathering) throw "Вы заняты";
	if !(isNull objectParent player) throw "Вы не можете заниматься этим находясь в транспорте!";
	if (isNull _plant) throw "Растения больше нет";

	if !((_plant getVariable ["Harvesting", player]) in [player, objNull]) throw "Урожай уже кто-то собирает";
	_plant setVariable ["Harvesting", player, true];

	private _state = _plant getVariable ["growState",[]];
	if (_state isEqualTo []) throw "У растения нет статуса";

	_state params ["_curState","_totalState"];

	private _percentage = (_curState / _totalState) * 100;
	if (_percentage < 100) throw "Растение еще не готово к сбору!";

	private _pugaloConfig = "true" configClasses (missionConfigFile >> "LifeCfgPugalo");
	private _pugaloModels = _pugaloConfig apply {getText(_x >> "model")};
	private _pugaloRadiuses = _pugaloConfig apply {getNumber(_x >> "radius")};

	private _maxRadius = _pugaloRadiuses select 0;
	{if (_x > _maxRadius) then {_maxRadius = _x}} forEach _pugaloRadiuses;
 	private _nearestPugalos = nearestObjects [getPosATL _plant, _pugaloModels, _maxRadius];

	private _playerUid = getPlayerUID player;
	private _nearestPugalo = _nearestPugalos findIf {(_x getVariable ["owner", ""]) isNotEqualTo _playerUid};
	private _plantOwner = _plant getVariable ["growOwner", ""];
	if (_nearestPugalo isNotEqualTo -1) throw "Рядом с растением стоит пугало, вы не можете собрать урожай";

	["Собираем урожай", 10, "", "", true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	private _plantClass = _plant getVariable ["plantClass",""];
	private _chance = random(100);
	{
		if (_chance <= (_x select 1)) then {
			_itemArr = _x select 0;
			_item = _itemArr select 0;
			_amount = (_itemArr select 1) call BIS_fnc_randomInt;

			[_item, _amount] call RRPClient_inventory_addItemToInventory;
			format["Вы собрали %1 (%2 шт.)", _item call RRPClient_inventory_getItemName, _amount] call toastSuccess;
		};
	} forEach getArray(missionConfigFile >> "LifeCfgFarming" >> _plantClass >> "items");

	player playAction "PutDown";
	deleteVehicle _plant
} catch {
	["Растения", _exception] call toastError;
	_plant setVariable ["Harvesting", objNull, true];
};