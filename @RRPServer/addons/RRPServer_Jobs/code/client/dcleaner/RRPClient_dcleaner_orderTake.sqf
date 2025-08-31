/*

	Filename: 	RRPClient_dcleaner_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою прошлую темку или работу";

	private _town_cfg = configName selectRandom ("true" configClasses (missionConfigFile >> "CfgJobs" >> "dcleaner" >> "dcleanerTowns"));
	private _town_name = getText(missionConfigFile >> "CfgJobs" >> "dcleaner" >> "dcleanerTowns" >> _town_cfg >> "townName"); 
	private _town_pos = getArray(missionConfigFile >> "CfgJobs" >> "dcleaner" >> "dcleanerTowns" >> _town_cfg >> "townPosition"); 
	life_dcleaner_houses = nearestObjects [_town_pos, ["Land_i_Addon_02_V1_F","Land_Metal_Shed_F","Land_u_Addon_01_V1_F","Land_Slum_House03_F"], 1000];
	if (count life_dcleaner_houses > 10) then {life_dcleaner_houses resize 10};
	if (life_dcleaner_houses isEqualTo []) throw "Что-то сломалось. Отбой, пишите письма";

	life_dcleaner_job = player createSimpleTask [format["JOB_DCLEANER_%1",getPlayerUID player]]; 
	life_dcleaner_job setSimpleTaskDescription ["Вам нужно скрыть улики убийства!",format["Работа чистильщиком в городе %1",_town_name],format["Работа чистильщиком в городе %1",_town_name]];
	life_dcleaner_job setTaskState "CREATED"; 

	life_dcleaner_corpse = (selectRandom ["Land_Bodybag_01_white_F","Land_Bodybag_01_blue_F","Land_Bodybag_01_black_F"]) createVehicleLocal [0,0,0];
	private _corpse_pos = selectRandom (_house buildingPos -1);
	life_dcleaner_corpse setPosATL _corpse_pos;
	RRP_job_waypoints set ["dcleaner_point", _corpse_pos];

	private _house = life_dcleaner_houses select 0;

	life_dcleaner_task = [["DCLEANER_CORPSE"],_corpse_pos,["Скройте улики убийства!","Скройте улики убийства!","walk"]] call RRPClient_tasks_createTask;
	_house addAction ["Скрыть улики",RRPClient_dcleaner_cleanHouse,"",5,true,true,"","!life_action_inUse",5];
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Темки", _exception] call toastError;
};
