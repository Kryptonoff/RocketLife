/*

	Filename: 	RRPClient_dhl_orderDone.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
deleteVehicle life_dhl_box;
life_dhl_vehicle removeAction AID_TFW;

life_dhl_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_dhl_job;

RRP_job_waypoints deleteAt "dhl_point";

private _distance = round(life_dhl_startPoint distance2D life_dhl_finishPoint);
private _factor = (("dhl" call RRPClient_economy_getResInfo) select 2) * 0.01;
private _price = round(_distance * _factor);
if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};

[75,"доставку"] call addXP;
[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
["Работа", format["Вы заработали на доставке $%1. Верните технику или продолжите работу.",[_price] call RRPClient_util_numberText]] call toastSuccess;
// ["DHLdone",_distance] spawn добавитьОпытЕпта;
["addSelled", "dhl", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];

"DHL - Order done" call RRPClient_util_log;

life_dhl_startPoint = objNull;
life_dhl_finishPoint = objNull;
life_dhl_box = objNull;
life_job_inProgress = false;
// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "dhl", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;