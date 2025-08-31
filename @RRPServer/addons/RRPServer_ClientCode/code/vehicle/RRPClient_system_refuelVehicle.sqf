/*
	Filename: 	RRPClient_system_refuelVehicle.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private ["_vehicle","_capacity","_litres","_cost","_level","_tick","_delay"];
try{
	if(life_action_inUse) throw "Вы уже что-то делаете. Пожалуйста, подождите пока текущее действие закончится.";
	if !(NOTINVEH(player)) throw "У вас недостаточно длинные руки, чтобы заправляться прямо из машины.";
	_vehicle = nearestObjects [(_this select 0), ["Air", "LandVehicle", "Armored"], 20];
	if (count _vehicle == 0) throw "В радиусе 20 метров нет техники!";
	_vehicle = _vehicle select 0;

	if (isEngineOn _vehicle) throw "Выключите двигатель перед началом заправки!";

	_capacity = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "fuelCapacity");

	_litres = 0;
	_cost = 0;
	_level = fuel _vehicle;
	_delay = 0.5;
	if (_vehicle isKindOf "Air") then { _delay = _delay / 3; };

	call RRPClient_actions_inUse;

	while {_level < 1} do {
		uiSleep _delay;	
		if (player distance (_this select 0) > 5) exitWith {};
		
		_litres = _litres + 1;
		
		_cost = _cost + 5;
		if (BANK < _cost) exitWith {};
		
		_tick = 1 / _capacity;
		_level = _level + _tick;
		if (_level > 1) then { _level = 1; };
		
		hintSilent parseText format["Сеть заправок<br /><t size='1.5' color='#00a8ff'>""АлтисНефтьГаз""</t><br /><br /><t color='#cec25b'>Литров:</t> %1<br/><t color='#cec25b'>Стоимость:</t> $%2<br/><t color='#cec25b'>Заправлено:</t> %3%4", _litres, [_cost] call RRPClient_util_numberText, floor (_level * 100), "%"];
	};

	hintSilent parseText format["Сеть заправок<br /><t size='1.5' color='#00a8ff'>""АлтисНефтьГаз""</t><br /><br /><t color='#cec25b'>Литров:</t> %1<br/><t color='#cec25b'>Стоимость:</t> $%2<br/><t color='#cec25b'>Заправлено:</t> %3%4<br/><br/><t color='#00FF00'>Заправка закончена</t>", _litres, [_cost] call RRPClient_util_numberText, floor (_level * 100), "%"];

	[player,"atm","take",STR(_cost)] remoteExecCall ["RRPServer_system_moneyChange",2];
	_log = format ["refuel: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_cost];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

	life_tmp_tax = life_tmp_tax + _cost;	

	if(!local (_vehicle)) then {	
		[_vehicle,_level] remoteExecCall ["RRPClient_system_setFuel",_vehicle];
	} else {
		_vehicle setFuel _level;
	};
	['fuelstations',1] call RRPClient_ach_gateway;
	life_action_inUse = false;
}catch{
	[_exception] call toastError;
};