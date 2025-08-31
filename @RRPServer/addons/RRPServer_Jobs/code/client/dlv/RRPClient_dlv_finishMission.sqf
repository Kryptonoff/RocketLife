/*

	Filename: 	RRPClient_dlv_finishMission.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
life_depo = _this;

try {
	if (life_action_inUse) throw "Вы заняты";
	disableSerialization;
	if (player distance life_dlv_vehicle > 25) throw "Проверьте, чтобы ваш грузовик был рядом и повторите попытку";

	private _cargoDeliver = life_dlv_vehicle getVariable ["cargoDeliver",[]];
	_cargoDeliver params ["_from","_to"];
	if (_cargoDeliver isEqualTo []) throw "У вас не взят заказ на доставку";

	private _fromTitle = getText(missionConfigFile >> "CfgJobs" >> "dlv" >> _from);
	private _toTitle = getText(missionConfigFile >> "CfgJobs" >> "dlv" >> _to);

	if (_to != life_depo) throw format["Вы привезли груз не в то депо! Вам необходимо доставить груз из %1 в %2",_fromTitle,_toTitle];
	_cargoDeliver = life_dlv_vehicle getVariable ["cargoDeliver",[]];

	life_dlv_vehicle lockCargo false;
	[life_dlv_vehicle,"cargoDeliver"] call RRPClient_system_clearGlobalVar;

	private _distance = (getMarkerPos _from) distance (getMarkerPos _to);
	// ["DeliveryDone",_distance] spawn добавитьОпытЕпта;
	private _price = _cargoDeliver select 2;
	if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};

	[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
	["Работа", format ['Вы успешно доставили груз в депо "%1"! На ваш банковский счет зачислено $%2',_toTitle,[_cargoDeliver select 2] call RRPClient_util_numberText]] call toastSuccess;
	life_dlv_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_dlv_job;

	RRP_job_waypoints deleteAt "dlv_point";
	["addSelled", "dlv", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];
	
	life_job_inProgress = false;
	[200,"доставку"] call addXP;
	// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "delivery", time - life_job_startTime, _cargoDeliver select 2],"customLog"] call серверныйЛогНахуй;	
} catch {
	["Работа", _exception] call toastError;
};