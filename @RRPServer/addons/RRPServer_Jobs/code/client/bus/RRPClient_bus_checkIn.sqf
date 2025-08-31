/*

	Filename: 	RRPClient_bus_checkIn.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_action_inUse) throw "Вы заняты";
	if (isNull objectParent player) throw "Для отметки вы должны находиться в технике.";
	if (isNull life_bus_job) throw "Вы не на работе";

	params ["_target", "_caller", "_actionId", "_point"];

	["Ждем пассажиров",15,"","",false,{(isNull objectParent player OR life_bus_vehicle distance _point > 10)}] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};	
	if (isNull objectParent player) throw "Для отметки вы должны находиться в технике.";
	if (life_bus_vehicle distance _point > 10) throw "Для отметки вы не должны двигаться.";

	life_bus_task setTaskState "SUCCEEDED"; 
	life_bus_points = life_bus_points - [_point];
	life_bus_vehicle removeAction _actionId;

	if (life_bus_points isEqualTo []) then {
		_price = ("dhlland" call RRPClient_economy_getResInfo) select 2;

		if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
		["Работа", format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price]] call toastSuccess;
		[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

		life_bus_job setTaskState "SUCCEEDED";
		RRP_job_waypoints deleteAt "bus_point";
		player removeSimpleTask life_bus_task;
		player removeSimpleTask life_bus_job;
		life_job_inProgress = false;
		
		["addSelled", "bus", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];
		
		[200,"выполненную работу"] call addXP;
		// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "bus", time - life_job_startTime, _price],"customLog"] call логи;
	} else {
		_closest = life_bus_points#0;
		RRP_job_waypoints set ["bus_point", _closest];
		life_bus_task setSimpleTaskDestination _closest; 
		life_bus_task setTaskState "ASSIGNED"; 
		player setCurrentTask life_bus_task;
		life_bus_vehicle addAction ["Отметиться",RRPClient_bus_checkIn,_closest,3,true,false,"",format["_target inArea [%1, 10, 10, 0, false] && !life_action_inUse",_closest]];
		["Работа", format["Вы успешно отметились на остановке, осталось %1 остановок",count life_bus_points]] call toastSuccess;
		[25,"остановку"] call addXP;
	};
} catch {
	["Работа", _exception] call toastError;
};
