/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	["_player",objNull,[objNull]],
	["_vehicle",objNull,[objNull]],
	"_plate",
	"_curPlate"
];
try
{
	if (isNull _player) throw "Вас не существует! Попробуйте позже!";
	if (isNull _vehicle) throw "Транспорт не определен сервером! Попробуйте еще раз!";
	_id = _vehicle getVariable ["RRPDatabaseID",-1];
	if (_id isEqualTo -1) throw "Ошибка в поиске ID транспорта!";
	
	_vehicle setPlateNumber _plate;
	_vehicle setVariable ["dbInfo",[getPlayerUID _player,_plate],true];
	
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"changePlate",990,format ["Изменил номерной знак машине %1 (ID %2) старый %3, новый %4",typeOf _vehicle,_id,_curPlate,_plate]] call RRPServer_DB_lk_fireAndForget;
	format ["updatePlate:%1:%2",_plate,_id] call RRPServer_DB_fireAndForget;
	[_player,"point","take",990] call RRPServer_system_moneyChange;
	["SuccessTitleAndText", ["Успешно!", format["На транспортное средство %1 установлены новые номерные знаки '%2'!",(getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")),_plate]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
	["plate",1] remoteExecCall ["RRPClient_ach_gateway",remoteExecutedOwner];
}catch{
	["ErrorTitleAndText", ["Ошибка!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};