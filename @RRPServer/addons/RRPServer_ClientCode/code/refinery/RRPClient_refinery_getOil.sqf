/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
	["_object", objNull, [objNull]]
];

try {

	if ((player getVariable ["groupID",-1]) < 0) throw "Взаимодействие НПЗ доступно только членам группировок!";

	private ["_player_gang_id","_ref_gang_id"];
	_player_gang_id = (player getVariable ["groupID",-1]);
	private _refinery_var = (vehicleVarName _object) select [0,4];
	private ["_refinery_control","_ref_gang_id"];
	_refinery_control = missionNamespace getVariable [format["%1_control", _refinery_var], objNull];
	if (isNull _refinery_control) throw "_refinery_control isNull";
	_ref_gang_id = _refinery_control getVariable ["ref_gang_id", -1];

	if (_ref_gang_id isEqualTo -1) throw "Что бы забрать ресурсы вам нужно захватить лабораторию!";
	if !(_player_gang_id isEqualTo _ref_gang_id) throw "Взаимодействие нарколабой доступно только членам группировок, которые ей владеют";

	private _ref_oil = _refinery_control getVariable ["ref_oil", -1];
	if (_ref_oil isEqualTo 0) throw "Хранилище, приезжайте после бури";

	private _nearVehicles = nearestObjects[_object, ["LandVehicle", "Air", "Ship"], 50];
	if (_nearVehicles isEqualTo []) throw "Поблизости нет техники. Подъедьте поближе!";

	disableSerialization;
	if !(createDialog "DialogVehicleSelect") exitWith {};

	private ["_control","_button","_textMoney"];
	_control = (findDisplay 58000) displayCtrl 5802;
	_button = (findDisplay 58000) displayCtrl 5804;
	_textMoney = (findDisplay 58000) displayCtrl 5803;
	_textMoney ctrlSetText format ["%1 Шт", _ref_oil];

	_button ctrlSetText "Начать погрузку";
	_button buttonSetAction "[] spawn RRPClient_refinery_getOilProcess";
	lbclear _control;
	{
		if (_x in life_vehicles) then {
			private _idx = _control lbAdd format["%1 (#%2)",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),_x getVariable ["dbInfo",["",""]] select 1];
			_control lbSetData [_idx, netId _x];
			_control lbSetPicture [_idx, getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture")];
		};
	} foreach _nearVehicles;
	lbdatarefinery = _refinery_var;
	_control lbSetCurSel 0;

} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
