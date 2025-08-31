/*

	Filename: 	RRPClient_dhl_mailBoxGive.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
player playAction "PutDown";
[player] call RRPClient_dhl_boxSpawn;
["Работа", "Загрузите коробку в грузовик и отправляйтесь к месту доставки"] call toastInfo;

life_dhl_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_dhl_job;

"DHL - Step 1 completed" call RRPClient_util_log;

"DHL - Step 2 begin" call RRPClient_util_log;

private _dpEnd = [format["%1",life_dhl_finishPoint],"_"," "] call RRPClient_kron_replace;

life_dhl_job = player createSimpleTask [format["JOB_DHL_%1",getPlayerUID player]];

life_dhl_job setSimpleTaskDestination getpos life_dhl_finishPoint;
life_dhl_job setSimpleTaskDescription [format["Доставьте посылку в %1",toUpper(_dpEnd)],format["Доставьте посылку в %1",toUpper(_dpEnd)],""];
life_dhl_job setTaskState "CREATED";
life_dhl_job setSimpleTaskType "MAP";
player setCurrentTask life_dhl_job;

RRP_job_waypoints set ["dhl_point", (getpos life_dhl_finishPoint)];

life_dhl_startPoint removeAction AID_TFMB;