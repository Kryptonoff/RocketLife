/*
	
	Filename: 	RRPClient_dlv_getMission.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	disableSerialization;
	private _control = (findDisplay 4300) displayCtrl 4302;
	private _to = _control lbData (lbCurSel _control);

	closeDialog 0;
	if (_to isEqualTo "") throw "Не выбрана конечная точка";

	if (player distance life_dlv_vehicle > 25) throw "Проверьте, чтобы ваш грузовик был рядом и повторите попытку";
	private _cargoDeliver = life_dlv_vehicle getVariable ["cargoDeliver",[]];
	if !(_cargoDeliver isEqualTo []) throw "Вы уже взяли заказ на доставку";

	private _price = [life_depo,_to,life_dlv_vehicle] call RRPClient_dlv_price;
	private _fromTitle = getText(missionConfigFile >> "CfgJobs" >> "dlv" >> life_depo);
	private _toTitle = getText(missionConfigFile >> "CfgJobs" >> "dlv" >> _to);

	life_dlv_vehicle setVariable ["cargoDeliver",[life_depo,_to,_price],true];
	life_dlv_job = player createSimpleTask [format["JOB_dlv_%1",getPlayerUID player]]; 
	life_dlv_job setSimpleTaskDescription ["Работа дальнобойщиком описание","Работа дальнобойщиком","Работа дальнобойщиком"];
	life_dlv_job setTaskState "CREATED"; 
	life_dlv_job setSimpleTaskDestination (getMarkerPos _to); 

	RRP_job_waypoints set ["dlv_point", (getMarkerPos _to)];

	player setCurrentTask life_dlv_job;
	["Работа", format ["Вы взяли заказ на доставку груза из %1 в %2. Удачи на дороге!",_fromTitle,_toTitle]] call toastSuccess;
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Работа", _exception] call toastError;
};
