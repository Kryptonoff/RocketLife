/*

	Filename: 	RRPClient_dcourrier_dig.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (life_action_inUse) throw "Вы заняты";
	params ["_target", "_caller", "_actionId"];
	if (isNull life_dcourrier_job) then {player removeAction _actionId; throw "Вы не на темке"};
	if (random(100) >= 50) then {
		["Вас заметили жители, о вашей деятельности сообщено в полицию"] call toastWarning;
		[[1,2],format["!!! Закладчик (координаты: %1) орудует в городе %2 !!!",mapGridPosition player,text (nearestLocation[getPos player,"NameCity"])],false,[]] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];
		[getPlayerUID player,"230"] remoteExecCall ["RRPServer_ws_wantedAdd",2];

	};

	["Делаем закладку",10,"","",true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Действие отменено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};

	life_dcourrier_task setTaskState "SUCCEEDED"; 

	life_dcourrier_digs = life_dcourrier_digs - [_target];

	if (life_dcourrier_digs isEqualTo []) then {
		_price = ("dcourrier" call RRPClient_economy_getResInfo) select 2;
		if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
		["Темки", format ["Вы успешно выполнили работу и получили вознаграждение в $%1 грязными деньгами",_price]] call toastSuccess;
	
		[200,"выполненную работу"] call addXP;
		// ["DCourrierDone"] spawn добавитьОпытЕпта;
		[player,"dcash","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
		life_dcourrier_job setTaskState "SUCCEEDED"; 
		player removeSimpleTask life_dcourrier_job;
		player removeSimpleTask life_dcourrier_task;
		RRP_job_waypoints deleteAt "dcourrier_point";
		["addSelled", "dcourrier", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];
		
		life_job_inProgress = false;
		// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "dcourrier", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
	} else {
		private _closest = objNull;
		private _closestdist = 10000;
		_p_pos = getpos player;
		{
			if (_x distance _p_pos < _closestdist) then {
				_closest = _x;
				_closestdist = _x distance _p_pos;
			};
		} forEach life_dcourrier_digs;
		RRP_job_waypoints set ["dcourrier_point", (getpos _closest)];

		life_dcourrier_task setSimpleTaskDestination (getPos _closest); 
		life_dcourrier_task setTaskState "ASSIGNED"; 
		player setCurrentTask life_dcourrier_task;
		_closest addAction ["Сделать закладку",RRPClient_dcourrier_dig,"",1,true,true,"","!life_action_inUse",5];
		["Темки", format["Вы успешно сделали закладку, осталось: %1 ",count life_dcourrier_digs]] call toastSuccess;
		[25,"закладку"] call addXP;
	};	
	_target removeAction _actionId;
} catch {
	["Темки", _exception] call toastError;
};
