/*

	Filename: 	RRPClient_dcleaner_cleanHouse.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_action_inUse) throw "Вы заняты";
	params ["_target", "_caller", "_actionId"];
	if (isNull life_dcleaner_job) then {player removeAction _actionId; throw "Вы не на темке"};
	if (random(100) >= 50) then {
		["Темки", "Вас заметили жители, о вашей деятельности сообщено в полицию"] call toastWarning;
		[[1,2],format["!!! Чистильщик (координаты: %1) орудует в городе %2 !!!",mapGridPosition player, text (nearestLocation[getPos player,"NameCity"])],false,[]] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];
		[getPlayerUID player,"220"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	};

	["Скрываем улики преступления",10,"","",true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	life_dcleaner_task setTaskState "SUCCEEDED"; 
	deleteVehicle life_dcleaner_corpse;
	life_dcleaner_houses = life_dcleaner_houses - [_target];

	if (life_dcleaner_houses isEqualTo []) then {
		_price = ("dcleaner" call RRPClient_economy_getResInfo) select 2;
		if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
		["Темки", format ["Вы успешно выполнили работу, получите вознаграждение в $%1 грязными деньгами",_price]] call toastSuccess;
		[200,"выполненную работу"] call addXP;
		[player,"dcash","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

		// ["DCleanerDone"] spawn добавитьОпытЕпта;
		life_dcleaner_job setTaskState "SUCCEEDED";
		RRP_job_waypoints deleteAt "dcleaner_point";
		["addSelled", "dcleaner", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];
		
		player removeSimpleTask life_dcleaner_job;
		player removeSimpleTask life_dcleaner_task;
		life_job_inProgress = false;
		// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "dcleaner", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
	} else {
		private _closest = objNull;
		private _closestdist = 10000;

		{
			if (_x distance player < _closestdist) then {
				_closest = _x;
				_closestdist = _x distance player;
			};
		} forEach life_dcleaner_houses;
		life_dcleaner_corpse = (selectRandom ["Land_Bodybag_01_white_F","Land_Bodybag_01_blue_F","Land_Bodybag_01_black_F"]) createVehicleLocal [0,0,0];

		private _corpse_pos = selectRandom (_closest buildingPos -1);
		life_dcleaner_corpse setPosATL _corpse_pos;
		RRP_job_waypoints set ["dcleaner_point", _corpse_pos];

		life_dcleaner_task setSimpleTaskDestination _corpse_pos; 
		life_dcleaner_task setTaskState "ASSIGNED"; 
		player setCurrentTask life_dcleaner_task;
		_closest addAction ["Скрыть улики",RRPClient_dcleaner_cleanHouse,"",5,true,true,"","!life_action_inUse",5];
		["Темки", format["Вы успешно скрыли улики, осталось: %1 ",count life_dcleaner_houses]] call toastSuccess;
		[50,"скрытие улик"] call addXP;
	};
	_target removeAction _actionId;
} catch {
	["Темки", _exception] call toastError;
};
