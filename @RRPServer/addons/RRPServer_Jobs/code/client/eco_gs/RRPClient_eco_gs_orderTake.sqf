/*

	Filename: 	RRPClient_eco_gs_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	private _spawnPoint = getText(missionConfigFile >> "CfgJobs" >> "eco_gs" >> "life_office_spawn");
	if (life_eco_gs_vehicle distance getMarkerPos _spawnPoint < 30) throw "С рядом с офисом, отъедьте на 30 метров чтобы взять работу";

	life_eco_gs_points = [];
	private _points = getArray(missionConfigFile >> "CfgJobs" >> "eco_gs" >> "life_eco_gs_car_points");
	while {count life_eco_gs_points < 3} do {life_eco_gs_points pushBackUnique (selectRandom _points)};

	life_eco_gs_job = player createSimpleTask [format["JOB_ECO_GS_%1",getPlayerUID player]]; 
	life_eco_gs_job setSimpleTaskDescription ["Работа пробоотборщиком грунта описание","Работа пробоотборщика грунта","Работа пробоотборщика грунта"];
	life_eco_gs_job setTaskState "CREATED"; 

	private _point = life_eco_gs_points select 0;
	life_eco_gs_task = player createSimpleTask ["ECO_GS_POINT",life_eco_gs_job]; 

	life_eco_gs_task setSimpleTaskDestination _point; 
	life_eco_gs_task setSimpleTaskDescription ["Место для отбора пробы грунта","Работа пробоотборщика грунта","Работа пробоотборщика грунта"];
	life_eco_gs_task setTaskState "CREATED"; 
	player setCurrentTask life_eco_gs_task;

	RRP_job_waypoints set ["eco_gs_point", _point];

	_mrk = createMarkerLocal ["eco_gs_marker",_point]; 
	_mrk setMarkerShapeLocal "ELLIPSE";
	_mrk setMarkerColorLocal "ColorOrange";
	_mrk setMarkerAlphaLocal 0.5;
	_mrk setMarkerSizeLocal [10, 10];

	player addAction ["Взять пробу грунта",RRPClient_eco_gs_sampleTake,_point,0,true,false,"",format["player inArea [%1, 10, 10, 0, false] && !life_action_inUse && isNull objectParent player",_point]];

	["Работа", "Вы взяли заказ, следуйте на точку"] call toastSuccess;
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Работа", _exception] call toastError;
};
