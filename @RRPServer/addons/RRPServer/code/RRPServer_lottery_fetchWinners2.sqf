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
private _amount = getNumber(getMissionConfig "CfgLottery" >> "amounts");
private _maxNumbers = getNumber(getMissionConfig "CfgLottery" >> "maxNumber");
_numbers = [];
for "_i" from 1 to _maxNumbers do {
	_enumber = str _i;
	if((count _enumber) isEqualTo 1) then {
		_enumber = format["0%1",_i];
	};
	_numbers pushBack _enumber;
};
_lotterynumbers = [];
for "_i" from 1 to _amount do {
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

	for "_i" from 1 to _amount do {
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
[
	"LotBot","","","",false,
	[
		[
			format["Результаты лотереи за %1-%2-%3",systemTime#2,systemTime#1,systemTime#0],
			"",
			"",
			"1FFF00",true,
			"","",[],[],
			[
				[
					"**Победный билет:** " + (_lotterynumbers  joinString "-"),
					[
						format ["**Куплено билетов:** %1",count _result],
						format ["**Победителей:** %1",count _winners],
						format ["**Выигранные суммы:** \n%1",_winnersAndAmount apply {_x#2} joinString "\n"],
						format ["**Новый джекпот:** %1",[_jackpot] call RRPClient_util_numberText],
						"\n**Испытать свою удачу можно купив билет в любом из частных магазинов!**"
					] joinString "\n",
					true
				]
			]
		]
	]
] call DiscordEmbedBuilder_fnc_buildSqf;
format ["insertGeneratedTicket:%1:%2",(_lotterynumbers  joinString "-"),_winnersAndAmount] call RRPServer_DB_insertSingle;
format["%1 выиграло в лотерее. | Новый джекпот: %2!",count _winners,[_jackpot] call RRPClient_util_numberText] call _diag_fnc;
["InfoTitleAndText",["Лотерея","Розыгрыш билета был произведен! Проверяйте купленные ранее билеты в личном кабинете, возможно ваш был выиграшный!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",-2];
true
