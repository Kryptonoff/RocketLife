/*

	Filename: 	RRPClient_bus_orderTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_job_inProgress) throw "Сначала закончите свою работу!";
	private _spawnPoint = getText(missionConfigFile >> "CfgJobs" >> "bus" >> "life_office_spawn");
	if (life_bus_vehicle distance getMarkerPos _spawnPoint < 30) throw "С рядом с офисом, отъедьте на 30 метров чтобы взять работу";
		
	life_bus_points = getArray(missionConfigFile >> "CfgJobs" >> "bus" >> "life_bus_points"); 
	{life_bus_points set [_forEachIndex,[round(_x select 0),round(_x select 1),round(_x select 2)]]} forEach life_bus_points;

	life_bus_job = player createSimpleTask [format["JOB_BUS_%1",getPlayerUID player]]; 
	life_bus_job setSimpleTaskDescription ["Вам необходимо заехать на все точки маршрута!","Работа водителем автобуса","Работа водителем автобуса"];
	life_bus_job setTaskState "CREATED"; 

	private _point = life_bus_points select 0;
	life_bus_task = player createSimpleTask ["BUS_point",life_bus_job]; 

	life_bus_task setSimpleTaskDestination _point;
	RRP_job_waypoints set ["bus_point", _point];
	
	life_bus_task setSimpleTaskDescription ["Направляйтесь на эту точку","Остановка","Остановка"];
	life_bus_task setTaskState "CREATED"; 
	player setCurrentTask life_bus_task;

	life_bus_vehicle addAction ["Отметиться",RRPClient_bus_checkIn,_point,3,true,false,"",format["_target inArea [%1, 10, 10, 0, false] && !life_action_inUse",_point]];

	["Работа", "Вы взяли заказ, следуйте на точку"] call toastSuccess;
	life_job_inProgress = true;
	life_job_startTime = time;

	[{
		if ((life_bus_points isEqualTo []) OR (isNull life_bus_vehicle) OR !(alive life_bus_vehicle)) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler};
		if (!(isOnRoad life_bus_vehicle) AND objectParent player isEqualTo life_bus_vehicle AND !(call RRPClient_system_isInterrupted)) then {
			_fine = round (getNumber(missionConfigFile >> "CfgJobs" >> "bus" >> "life_bus_price") * 0.01);
			[player,"atm","take", _fine] remoteExecCall ["RRPServer_system_moneyChange",2];

			["Работа", format["Вас оштрафовали на $%1, так как вы едете не по дорожному покрытию",[_fine] call RRPClient_util_numberText]] call toastWarning;
		};
	},60] call CBA_fnc_addPerFrameHandler;
} catch {
	["Работа", _exception] call toastError;
};
