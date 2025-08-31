/*

	Filename: 	RRPClient_dhl_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	private _startPoint = lbData[5802, lbCurSel 5802];
	private _finishPoint = lbData[5803, lbCurSel 5803];

	if (_startPoint isEqualTo "" OR _finishPoint isEqualTo "") throw "Вы не выбрали начальную или конечную точку";
	if (_startPoint isEqualTo _finishPoint) throw "Конечная точка не должна совпадать с начальной";
	if (life_job_inProgress) throw "Сначала закончите свою работу!";

	_startPoint = call compile format["%1",_startPoint];
	_finishPoint = call compile format["%1",_finishPoint];
	if (isNil "_startPoint" OR isNil "_finishPoint") throw "Одной из точек не существует";

	closeDialog 0;

	life_dhl_startPoint = _startPoint;
	life_dhl_finishPoint = _finishPoint;

	format["DHL - Order Take from %1 to %2",_startPoint,_finishPoint] call RRPClient_util_log;

	AID_TFMB = life_dhl_startPoint addAction ["<img image='\rimas_dhl\data\dhl_logo.paa' /> Получить посылку",RRPClient_dhl_mailBoxGive,nil,0,true,true,"",' life_job_inProgress && isNull life_dhl_box ', 5];

	private _dpStart = [format["%1",life_dhl_startPoint],"_"," "] call RRPClient_kron_replace;
	private _dpEnd = [format["%1",life_dhl_finishPoint],"_"," "] call RRPClient_kron_replace;
	private _price = round((life_dhl_startPoint distance2D life_dhl_finishPoint) * getNumber(missionConfigFile >> "CfgJobs" >> "dhl" >> "life_dhl_price"));

	"DHL - Order Tasks 1 add..." call RRPClient_util_log;

	life_dhl_job = player createSimpleTask [format["JOB_DHL_%1",getPlayerUID player]];

	life_dhl_job setSimpleTaskDestination getpos life_dhl_startPoint;
	life_dhl_job setSimpleTaskDescription [format["Заберите посылку из %1, погрузите ее в фургон и отправляйтесь в %2",toUpper(_dpStart),toUpper(_dpEnd)],format["Заберите посылку в %1",toUpper(_dpStart)],""];
	life_dhl_job setTaskState "CREATED";
	life_dhl_job setSimpleTaskType "MAP";
	player setCurrentTask life_dhl_job;

	RRP_job_waypoints set ["dhl_point", (getpos life_dhl_startPoint)];

	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Работа", _exception] call toastError;
};
