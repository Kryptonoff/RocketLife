/*

	Filename: 	RRPClient_eco_ws_sampleTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_action_inUse) throw "Вы заняты";
	if (isNull objectParent player) throw "Для взятия пробы вы должны находиться в технике.";

	private _vehicle = objectParent player;
	if ((driver _vehicle) isEqualTo player) throw "Вы должны быть на месте пассажира";

	params ["_target", "_caller", "_actionId", "_point"];
	if (isNull life_eco_ws_job) then {player removeAction _actionId; throw "Вы не на работе"};

	["Берем пробу воды",15,"","",false,{(isNull objectParent player) OR (isEngineOn _vehicle) OR ((driver _vehicle) isEqualTo player)}] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
	if (isNull objectParent player) throw "Для взятия пробы вы должны находиться в технике";
	if (isEngineOn _vehicle) throw "Для взятия пробы мотор должен быть заглушен";
	if ((driver _vehicle) isEqualTo player) throw "Вы должны быть на месте пассажира";

	life_eco_ws_task setTaskState "SUCCEEDED"; 
	life_eco_ws_points = life_eco_ws_points - [_point];
	life_eco_ws_vehicle removeAction _actionId;

	if (life_eco_ws_points isEqualTo []) then {
		_price = ("eco_ws" call RRPClient_economy_getResInfo) select 2;
		if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
		["Работа", format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price]] call toastSuccess;
		[500,"выполненную работу"] call addXP;
		
		[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
		// ["EcoWSDone"] spawn добавитьОпытЕпта;

		life_eco_ws_job setTaskState "SUCCEEDED"; 
		player removeSimpleTask life_eco_ws_job;
		player removeSimpleTask life_eco_ws_task;
		deleteMarkerLocal "eco_ws_marker";
		life_job_inProgress = false;

		RRP_job_waypoints deleteAt "eco_ws_point";

		["addSelled", "eco_ws", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];
		// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "eco_ws", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
	} else {
		private _closest = [0,0,0];
		private _closestdist = 100000;
		private _p_pos = getpos player;
		{
			if (_x distance _p_pos < _closestdist) then {
				_closest = _x;
				_closestdist = _x distance _p_pos;
			};
		} forEach life_eco_ws_points;
		life_eco_ws_task setSimpleTaskDestination _closest; 
		life_eco_ws_task setTaskState "ASSIGNED"; 
		player setCurrentTask life_eco_ws_task;
		"eco_ws_marker" setMarkerPosLocal _closest;

		RRP_job_waypoints set ["eco_ws_point", _closest];

		[100,"взятие пробы"] call addXP;
		life_eco_ws_vehicle addAction ["Взять пробу воды",RRPClient_eco_ws_sampleTake,_closest,0,true,false,"",format["player inArea [%1, 250, 250, 0, false] && !life_action_inUse",_closest]];
		["Работа", format["Вы успешно взяли пробу, осталось %1 проб",count life_eco_ws_points]] call toastSuccess;
	};
} catch {
	["Работа", _exception] call toastError;
};
