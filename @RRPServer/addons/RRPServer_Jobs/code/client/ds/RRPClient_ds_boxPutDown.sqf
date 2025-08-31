/*

	Filename: 	RRPClient_ds_boxPutDown.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
player removeAction AID_DROPDSBOX;
detach life_ds_box;
deleteVehicle life_ds_box;
if ((currentWeapon player) isEqualTo "") then {player PlayActionNow "FT_Act_Gesture_Reset"};

_price = ("dhlland" call RRPClient_economy_getResInfo) select 2;
if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
["Работа", format["Вы заработали на доставке $%1",[_price] call RRPClient_util_numberText]] call toastSuccess;
// ["DSDone"] spawn добавитьОпытЕпта;

[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

life_ds_job setTaskState "SUCCEEDED"; 
player removeSimpleTask life_ds_job;

RRP_job_waypoints deleteAt "ds_point";
["addSelled", "ds", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];

life_job_inProgress = false;
// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "ds", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;