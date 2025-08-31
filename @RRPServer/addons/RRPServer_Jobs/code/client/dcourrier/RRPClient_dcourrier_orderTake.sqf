/*

	Filename: 	RRPClient_dcourrier_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою прошлую темку или работу";

	private _town_cfg = configName selectRandom ("true" configClasses (missionConfigFile >> "CfgJobs" >> "dcourrier" >> "dcourrierTowns"));
	private _town_name = getText(missionConfigFile >> "CfgJobs" >> "dcourrier" >> "dcourrierTowns" >> _town_cfg >> "townName"); 
	private _town_pos = getArray(missionConfigFile >> "CfgJobs" >> "dcourrier" >> "dcourrierTowns" >> _town_cfg >> "townPosition"); 
	life_dcourrier_digs = nearestObjects [_town_pos, ["Land_i_Stone_Shed_V1_F","Land_Metal_Shed_F","Land_Slum_House02_F"], 1000];
	if (count life_dcourrier_digs > 10) then {life_dcourrier_digs resize 10};
	if (life_dcourrier_digs isEqualTo []) throw "Что-то сломалось. Отбой, пишите письма";

	life_dcourrier_job = player createSimpleTask [format["JOB_DCOURRIER_%1",getPlayerUID player]]; 
	life_dcourrier_job setSimpleTaskDescription ["Вам нужно сделать закладки!",format["Работа наркокурьером в городе %1",_town_name],format["Работа наркокурьером в городе %1",_town_name]];
	life_dcourrier_job setTaskState "CREATED"; 

	private _dig = life_dcourrier_digs select 0;
	RRP_job_waypoints set ["dcourrier_point", (getpos _dig)];

	life_dcourrier_task = [["DCOURRIER_DIG"],(getpos _dig),["Сделайте закладку!","Сделайте закладку!","land"]] call RRPClient_tasks_createTask;

	_dig addAction ["Сделать закладку",RRPClient_dcourrier_dig,"",1,true,true,"","!life_action_inUse",5];
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Темки", _exception] call toastError;
};
