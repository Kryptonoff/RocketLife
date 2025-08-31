/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_value","_dayname","_timearr","_time","_time_index","_curtime","_selecttime","_dif","_numbers","_enumber","_lotterynumbers","_gone","_uid","_lvl","_money","_gone","_temp","_amount","_winnersAndAmount"];
private _diag_fnc = {
	diag_log format[">>>>>> Lottery: %1",_this];
			 format[">>>>> Lottery: %1 #0101",_this] call RRPServer_util_debugConsole;

};
_value = systemTime;
_dayname = toUpper("selectDayName" call RRPServer_DB_selectSingleField);
format["СЕГОДНЯ - %1 #0101",_dayname] call RRPServer_util_debugConsole;
if(!(_dayname in ["MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY","SUNDAY"])) exitWith {format["ОШИБКА В ИНДЕКСЕ ДНЯ НЕДЕЛИ: %1|%2",_dayname,_value] call _diag_fnc};
_timearr = getArray(missionConfigFile >> "CfgLottery" >> "lottery_drawings" >> _dayname);
if(_timearr isEqualTo []) exitWith {format["Сегодня %1 -> Нема лотереи сегодня!",_dayname] call _diag_fnc};
_time = 999999;
_time_index = -1;
_curtime = parseNumber format["%1%2",_value select 3,_value select 4];
for "_i" from 0 to ((count _timearr)-1) do {
	_selecttime = _timearr select _i;
	_selecttime = _selecttime splitString ":";
	_selecttime = parseNumber (_selecttime joinString "");
	_dif = _selecttime - _curtime;
	if((_dif > 0) && {_dif < _time}) then {
		_time = _dif;
		_time_index = _i;
	};
};
str _time call _diag_fnc;
if(_time > (4 * 100)) exitWith {"В этот рестарт без лотереи!" call _diag_fnc};
if(_time_index isEqualTo -1) exitWith {"На сегодня нет лотерей" call _diag_fnc};

_numbers = [];
for "_i" from 1 to 20 do {
	_enumber = str _i;
	if((count _enumber) isEqualTo 1) then {
		_enumber = format["0%1",_i];
	};
	_numbers pushBack _enumber;
};
_lotterynumbers = [];
for "_i" from 1 to 6 do {
	_lotterynumbers pushBack (selectRandom _numbers);
};
"lotterydelwin" call RRPServer_DB_fireAndForget;
format["Лотерея сгенерирована! Код: %1",_lotterynumbers joinString "-"] call _diag_fnc;
private ["_result","_winners","_level","_code"];
_result = "getAllTickets" call RRPServer_DB_selectFull;
_winners = [];
{
	_level = 0;
	_code = (_x select 1) splitString "-";

	for "_i" from 0 to 5 do {
		if(!((_code select _i) isEqualTo (_lotterynumbers select _i))) exitWith {};
		_level = _level + 1;
	};

	if(_level > 1) then {
		_winners pushBack [(_x select 0),_level];
	};
} forEach _result;
private ["_jackpot","_oldjackpot","_levelbonus","_levelvalues"];
_jackpot = count _result;
_jackpot = _jackpot * (getNumber(getMissionConfig "CfgLottery" >> "cost"));
_oldjackpot = "getLotteryJackpot" call RRPServer_DB_selectSingleField;
_jackpot = _oldjackpot + _jackpot;
_levelbonus = "getLotteryLvlTick" call RRPServer_DB_selectFull;
for "_i" from 0 to ((count _levelbonus)-1) do {
	_levelbonus set [_i,(_levelbonus select _i) select 0];
};
_levelvalues = [0,0];
_levelvalues append _levelbonus;
"lotterydeltickets" call RRPServer_DB_fireAndForget;
_gone = 0;
{
	_uid = _x select 0;
	_lvl = _x select 1;
	_money = _jackpot * ((_levelvalues select _lvl)/100);
	_gone = _gone + _money;
	_temp = missionNamespace getVariable [format["lottery_win_%1",_uid],0];
	_temp = _temp + _money;
	missionNamespace setVariable [format["lottery_win_%1",_uid],_temp];
} forEach _winners;
_jackpot = _jackpot - _gone;
if(_jackpot >= 0) then {
	format["Сумма джекпота $%1!", [_jackpot] call RRPClient_util_numberText] call _diag_fnc;
} else {
	format["Джекпот отрицательный %1 -> Сброс на 0", [_jackpot] call RRPClient_util_numberText] call _diag_fnc;
	_jackpot = 0;
};
format ["updateJackpot:%1",_jackpot] call RRPServer_DB_fireAndForget;
_winnersAndAmount = [];
{
	_uid = _x select 0;
	_amount = missionNamespace getVariable [format["lottery_win_%1",_uid],0];
	if(_amount > 0) then {
		_winnersAndAmount pushBack [_uid,_amount,[_amount] call RRPClient_util_numberText];
		format ["setLotteryWin:%1:%2",_amount,_uid] call RRPServer_DB_fireAndForget;
	};
} forEach _winners;
format ["insertGeneratedTicket:%1:%2",(_lotterynumbers  joinString "-"),_winnersAndAmount] call RRPServer_DB_insertSingle;
format["%1 выиграло в лотерее. | Новый джекпот: %2!",count _winners,[_jackpot] call RRPClient_util_numberText] call _diag_fnc;
true
