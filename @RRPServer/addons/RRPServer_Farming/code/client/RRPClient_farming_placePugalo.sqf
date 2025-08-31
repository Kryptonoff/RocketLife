/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_placePugalo.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
params [
	["_item","",[""]]
];
try {
	if (life_action_inUse OR life_action_gathering) throw "Вы заняты";
	if !(isNull objectParent player) throw "Вы не можете заниматься этим находясь в транспорте!";
	if (([_item] call RRPClient_inventory_itemCount) isEqualTo 0) throw "У вас нет этого предмета";

	if !((surfaceType position player) in life_farmGroundTypes) throw "На такой земле нельзя ставить пугало";
	private _pos = player getPos [1, getDir player];
	if (_pos isFlatEmpty [1, -1, -1, -1, -1, false, player] isEqualTo []) throw "Рядом есть что-то, что мешает установке пугала. Найдите более свободную поверхность";
	if (isOnRoad player) throw "Пугало нельзя установить на дороге";

	private _pugaloConfig = "true" configClasses (missionConfigFile >> "LifeCfgPugalo");
	private _pugaloModels = _pugaloConfig apply {getText(_x >> "model")};
	private _pugaloRadiuses = _pugaloConfig apply {getNumber(_x >> "radius")};

	private _maxRadius = _pugaloRadiuses select 0;
	{if (_x > _maxRadius) then {_maxRadius = _x}} forEach _pugaloRadiuses;
	_maxRadius = _maxRadius + _maxRadius;
 	private _nearestPugalos = nearestObjects [getPosATL player, _pugaloModels, _maxRadius];
	if (_nearestPugalos isNotEqualTo []) throw "Вы не можете ставить пугало, когда рядом есть другое пугало";
	
	["Устанавливаем пугало", 10, "", "", true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
	if !([_item] call RRPClient_system_removeItem) throw "Не удалось удалить предмет";

	private _model = getText(missionConfigFile >> "LifeCfgPugalo" >> _item >> "model");
	private _pugalo = createVehicle [_model, _pos, [], 0, "CAN_COLLIDE"];

	private _playerUid = getPlayerUID player;
	_pugalo setVariable ["owner", _playerUid, true];
	_pugalo setVariable ["class", _item, true];

	[_pugalo, _playerUid, _pos, _item] remoteExecCall ["RRPServer_farming_createPugalo", 2];

} catch {
	["Пугало", _exception] call toastError;
};