/*

	Filename: 	RRPClient_eln_repair.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_action_inUse) throw "Вы заняты";
	params ["_target", "_caller", "_actionId"];
	if (isNull life_eln_job) then {removeAllActions _target; throw "Вы не на работе"};
	if (life_eln_vehicle distance player > 75) throw "Ваша машина должна находиться рядом с вами для осуществления ремонтных работ";

	["Чиним лампу",15,"repairme","",false,{if !(animationState player isEqualTo "acts_carfixingwheel") then {["Acts_carFixingWheel"] call RRPClient_system_animDo};!(isNull objectParent player)}] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
	if !(isNull objectParent player) throw "Для починки вы должны выйти из автомобиля";

	life_eln_task setTaskState "SUCCEEDED"; 
	life_eln_lamps = life_eln_lamps - [_target];
	_target removeAction _actionId;

	if (life_eln_lamps isEqualTo []) then {
		_price = ("eln" call RRPClient_economy_getResInfo) select 2;
		if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
		["Работа", format ["Вы выполнили работу, $%1 переведены на ваш счет. Верните технику в офис или продолжите работу",_price]] call toastSuccess;
		[500,"выполненную работу"] call addXP;
		// ["ElnDone"] spawn добавитьОпытЕпта;
		
		[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

		life_eln_job setTaskState "SUCCEEDED"; 
		player removeSimpleTask life_eln_job;
		player removeSimpleTask life_eln_task;
		life_job_inProgress = false;

		RRP_job_waypoints deleteAt "eln_point";
		["addSelled", "eln", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];

		// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "eln", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
	} else {
		private _closest = objNull;
		private _closestdist = 100000;
		private _p_pos = getpos player;
		{
			if (_x distance _p_pos < _closestdist) then {
				_closest = _x;
				_closestdist = _x distance _p_pos;
			};
		} forEach life_eln_lamps;
		life_eln_task setSimpleTaskDestination (getPos _closest); 
		life_eln_task setTaskState "ASSIGNED"; 
		player setCurrentTask life_eln_task;
		removeAllActions _closest;//костыль

		RRP_job_waypoints set ["eln_point", (getPos _closest)];

		_closest addAction ["Починить лампу",RRPClient_eln_repair,"",1,true,true,"","!life_action_inUse",5];
		["Работа", format["Вы успешно отремонтировали лампу, осталось ламп: %1 ",count life_eln_lamps]] call toastSuccess;
		[100,"ремонт"] call addXP;
	};
} catch {
	["Работа", _exception] call toastError;
};
