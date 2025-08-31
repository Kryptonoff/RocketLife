/*

	Filename: 	RRPClient_eco_gs_sampleTake.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_action_inUse) throw "Вы заняты";
	if !(currentWeapon player isEqualTo "Extremo_Tool_Shovel") throw "У вас должна быть лопата в руках!";
	if !(isNull objectParent player) throw "Для взятия пробы вы должны выйти из машины";

	params ["_target", "_caller", "_actionId", "_point"];
	if (isNull life_eco_gs_job) then {player removeAction _actionId; throw "Вы не на работе"};

	["Берем пробу грунта",7,"","",false,{player forceWeaponFire ["Extremo_Tool_Shovel", "Hack"]}] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};	

	life_eco_gs_task setTaskState "SUCCEEDED"; 
	life_eco_gs_points = life_eco_gs_points - [_point];
	player removeAction _actionId;

	if (life_eco_gs_points isEqualTo []) then {
		_price = ("eco_gs" call RRPClient_economy_getResInfo) select 2;
		if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
		["Работа", format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price]] call toastSuccess;
		// ["EcoGSDone"] spawn добавитьОпытЕпта;
		
		[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

		life_eco_gs_job setTaskState "SUCCEEDED"; 
		player removeSimpleTask life_eco_gs_job;
		player removeSimpleTask life_eco_gs_task;
		deleteMarkerLocal "eco_gs_marker";
		life_job_inProgress = false;
		
		RRP_job_waypoints deleteAt "eco_gs_point";
		["addSelled", "eco_gs", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];

		[500,"выполненную работу"] call addXP;
		// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "eco_gs", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
	} else {
		private _closest = [0,0,0];
		private _closestdist = 100000;
		private _p_pos = getpos player;
		{
			if (_x distance _p_pos < _closestdist) then {
				_closest = _x;
				_closestdist = _x distance _p_pos;
			};
		} forEach life_eco_gs_points;
		life_eco_gs_task setSimpleTaskDestination _closest; 
		life_eco_gs_task setTaskState "ASSIGNED"; 
		player setCurrentTask life_eco_gs_task;
		"eco_gs_marker" setMarkerPosLocal _closest;
		RRP_job_waypoints set ["eco_gs_point", _closest];

		player addAction ["Взять пробу грунта",RRPClient_eco_gs_sampleTake,_closest,0,true,false,"",format["_target inArea [%1, 10, 10, 0, false] && !life_action_inUse && isNull objectParent player",_closest]];
		["Работа", format["Вы успешно взяли пробу, осталось %1 проб",count life_eco_gs_points]] call toastSuccess;
		[100,"взятие пробы"] call addXP;
	};
} catch {
	["Работа", _exception] call toastError;
};
