private _amountAddXP = 3;
private _defaultEXP = 1500;
private _time = 0;
private _defaultTime = 5;
for "_i" from 1 to 50 do {
	private _amountXP = if (_i <= 1) then {_defaultEXP} else {(_i * (_i + 1) * _defaultEXP)};
	private _amountAddXP = if (_i <= 1) then {3} else {(_i * _amountAddXP) * 2};
	private _timeOneAction = [50,_i,_defaultTime] call RRPClient_util_countSavingTime;

	if (_timeOneAction <= (_defaultTime - _timeOneAction)) then {
		diag_log str(_timeOneAction/(_defaultTime/2));
		_amountXP = (_amountXP/(_timeOneAction/(_defaultTime/2)));
	};

	private _timeOneLvl = ((_amountXP/_amountAddXP) * _timeOneAction)/60;
	diag_log format ["Текущий уровень: %2 | Уровень: %1 | Кл-во экспы за действие: %3 | Кол-во действий: %4 | Условных часов на достижение уровня: %5",str(_amountXP),_i,_amountAddXP,str(_amountXP/_amountAddXP),_timeOneLvl];
	_time = _time + _timeOneLvl;
};
diag_log format ["Время: %1",_time/60];
