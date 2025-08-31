/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_destroyPlantae.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
try {
	if !(isNull objectParent player) throw "Вы не можете заниматься этим находясь в транспорте!";
	
	private _plant = param [0,objNull,[objNull]];
	if (isNull _plant) throw "Растения больше нет";

	private _state = _plant getVariable ["growState", []];
	if (_state isEqualTo []) throw "У растения нет статуса";

	private _action = [
		"Вы точно хотите уничтожить растение?",
		"Уничтожить растение",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;
	if !(_action) throw "Вы отказались от уничтожения растения";

	// private _growOwner = _plant getVariable["growOwner",""];
	// if (getPlayerUID player != _growOwner) exitWith {diag_log "Error grow owner RRPServer_farming_destroyPlanta";};

	deleteVehicle _plant;
} catch {
	["Растения", _exception] call toastError;
};