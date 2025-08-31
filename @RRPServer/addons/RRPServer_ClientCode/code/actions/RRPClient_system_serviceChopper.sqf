/*
	Filename: 	RRPClient_system_serviceChopper.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{	
	disableSerialization;
	private["_search","_ui","_progress","_cP","_pgText","_title","_point","_progress_rscLayer"];
	if(life_action_inUse) throw "Вы уже что-то делаете. Пожалуйста, подождите пока текущее действие закончится.";
	_point = _this select 3;
	_search = nearestObjects[getMarkerPos _point, ["Air"],10];
	if(EQUAL(_search,[])) throw "На вертолетной площадке пусто";
	if(CASH < 100) throw "Вам нужно $100 что бы отремонтировать ваш вертолёт.";
	[[player,"cash","take",100],"system_moneyChange"] call RRPClient_system_hcExec;

	_log = format ["serviceChopper: cash (take) %3 to NAME:%1 (%2)",name player,steamid,100];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
	call RRPClient_actions_inUse;

	_title = "Обслуживание вертолёта";
	_cP = 0;
	titleText[_title,"PLAIN"];

	while {true} do {
		uiSleep  0.2;
		_cP = _cP + 0.01;
		[_cP,"repair"] call RRPClient_system_progressBar;
		if(_cP >= 1 OR (call RRPClient_system_isInterrupted)) exitWith {};
	};

	["life_progress"] call RRPClient_gui_DestroyRscLayer;
	life_action_inUse = false;

	if (call RRPClient_system_isInterrupted) exitWith {titleText["Действие отменено","PLAIN"]};

	if(!alive (_search select 0) || (_search select 0) distance air_sp > 15) throw "Вертолёт находится слишком далеко от площадки.";
	if(!local (_search select 0)) then {
		[(_search select 0),1] remoteExecCall ["RRPClient_system_setFuel",(_search select 0)];
	} else {
		(_search select 0) setFuel 1;
	};
	(_search select 0) setDamage 0;
	titleText ["Ваш вертолёт отремонтирован и заправлен.","PLAIN"];
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};