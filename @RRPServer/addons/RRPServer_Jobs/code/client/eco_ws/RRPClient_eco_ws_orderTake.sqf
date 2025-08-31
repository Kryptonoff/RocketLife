/*

	Filename: 	RRPClient_eco_ws_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	private _spawnPoint = getText(missionConfigFile >> "CfgJobs" >> "eco_ws" >> "life_office_spawn");
	if (life_eco_ws_vehicle distance getMarkerPos _spawnPoint < 30) throw "С рядом с офисом, отъедьте на 30 метров чтобы взять работу";

	life_eco_ws_points = [];
	private _points = getArray(missionConfigFile >> "CfgJobs" >> "eco_ws" >> "life_vehicle_points");
	while {count life_eco_ws_points < 3} do {life_eco_ws_points pushBackUnique (selectRandom _points)};

	life_eco_ws_job = player createSimpleTask [format["JOB_ECO_WS_%1",getPlayerUID player]]; 
	life_eco_ws_job setSimpleTaskDescription ["Работа пробоотборщиком воды описание","Работа пробоотборщика воды","Работа пробоотборщика воды"];
	life_eco_ws_job setTaskState "CREATED"; 

	private _point = life_eco_ws_points select 0;
	life_eco_ws_task = player createSimpleTask ["ECO_WS_POINT",life_eco_ws_job]; 

	life_eco_ws_task setSimpleTaskDestination _point; 
	life_eco_ws_task setSimpleTaskDescription ["Место для отбора пробы воды","Работа пробоотборщика воды","Работа пробоотборщика воды"];
	life_eco_ws_task setTaskState "CREATED"; 
	player setCurrentTask life_eco_ws_task;

	RRP_job_waypoints set ["eco_ws_point", _point];

	_mrk = createMarkerLocal ["eco_ws_marker",_point]; 
	_mrk setMarkerShapeLocal "ELLIPSE";
	_mrk setMarkerColorLocal "ColorOrange";
	_mrk setMarkerAlphaLocal 0.5;
	_mrk setMarkerSizeLocal [250, 250];

	life_eco_ws_vehicle addAction ["Взять пробу воды",RRPClient_eco_ws_sampleTake,_point,0,true,false,"",format["_target inArea [%1, 250, 250, 0, false]",_point]];

	["Работа", "Вы взяли заказ, следуйте на точку"] call toastSuccess;
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Работа", _exception] call toastError;
};
