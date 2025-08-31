/*

	Filename: 	RRPClient_terror_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	
	private _towns = nearestLocations [getPosATL player, ["NameCity","NameVillage"], 20000]; 
	if (_towns isEqualTo []) throw "Вы слишком далеко чтобы найти работу";
	private _town = selectRandom _towns;  
	private _chapel = nearestObjects [getPos _town, ["Land_Chapel_V1_F","Land_Chapel_Small_V2_F"], 3000] select 0; 
	
	RRP_job_waypoints set ["terror_point", getPos _town];

	life_terror_job = [["JOB_TERROR"],(getpos _chapel),["Вам нужно взорвать церковь!",format["Диверсия в городе %1",text _town],"destroy"]] call RRPClient_tasks_createTask;
	
	_chapel addAction ["Установить бомбу",RRPClient_terror_bombPlant,"",1,true,true,"","!life_action_inUse",5];
	life_job_inProgress = true;
	life_job_startTime = time;
} catch {
	["Темки", _exception] call toastError;
};
