/*

	Filename: 	RRPClient_eln_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	private _spawnPoint = getText(missionConfigFile >> "CfgJobs" >> "eln" >> "life_office_spawn");
	if (life_eln_vehicle distance getMarkerPos _spawnPoint < 30) throw "С рядом с офисом, отъедьте на 30 метров чтобы взять работу";

	private _town_cfg = configName selectRandom ("true" configClasses (missionConfigFile >> "CfgJobs" >> "eln" >> "elnLamps"));
	private _town_name = getText(missionConfigFile >> "CfgJobs" >> "eln" >> "elnLamps" >> _town_cfg >> "townName"); 
	private _town_pos = getArray(missionConfigFile >> "CfgJobs" >> "eln" >> "elnLamps" >> _town_cfg >> "townPosition"); 
	life_eln_lamps = nearestObjects [_town_pos, ["Land_LampStreet_F","Land_LampStreet_small_F","Land_LampDecor_F"], 750];
	if (count life_eln_lamps > 10) then {life_eln_lamps resize 10};
	if (life_eln_lamps isEqualTo []) throw "Что-то сломалось. Отбой, пишите письма";

	life_eln_job = player createSimpleTask [format["JOB_ELN_%1",getPlayerUID player]]; 
	life_eln_job setSimpleTaskDescription ["Вам необходимо починить все неисправные лампы в городе!",format["Работа электриком в городе %1",_town_name],format["Работа электриком в городе %1",_town_name]];
	life_eln_job setTaskState "CREATED"; 


	private _lamp = life_eln_lamps select 0;
	life_eln_task = player createSimpleTask ["ELN_LAMP",life_eln_job]; 

	life_eln_task setSimpleTaskDestination (getPos _lamp); 
	life_eln_task setSimpleTaskDescription ["Почините эту лампу!","Неисправная лампа","Неисправная лампа"];
	life_eln_task setTaskState "CREATED"; 
	player setCurrentTask life_eln_task;

	RRP_job_waypoints set ["eln_point", (getPos _lamp)];

	removeAllActions _lamp;
	_lamp addAction ["Починить лампу",RRPClient_eln_repair,"",1,true,true,"","!life_action_inUse",5];

	["Работа", "Вы взяли заказ, следуйте на точку"] call toastSuccess;
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Работа", _exception] call toastError;
};
