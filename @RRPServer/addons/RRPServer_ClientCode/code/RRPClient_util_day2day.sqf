 
systemTime params ["_year","_month","_day"]; 
private _date = [_year, _month, _day, 0, 0]; 
 
private _yearBefore = ((_date select 0) - 1) max 0; 
private _leapYears = floor (_yearBefore / 4); 
private _normalYears = _yearBefore - _leapYears; 
private _days = _normalYears + (_leapYears * (366 / 365)) + dateToNumber _date; 
 
private _res = (round (_days / (1 / 365))) mod 7; 
 
call { 
	if (_res == 1) exitWith {"Понедельник"}; 
	if (_res == 2) exitWith {"Вторник"}; 
	if (_res == 3) exitWith {"Среда"}; 
	if (_res == 4) exitWith {"Четверг"}; 
	if (_res == 5) exitWith {"Пятница"}; 
	if (_res == 6) exitWith {"Суббота"}; 
	if (_res == 7) exitWith {"Воскресенье"}; 
	"Понедельник" 
};