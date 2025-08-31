params [
    ["_timeData",[],[[]]]
];

private _res = "";
if (_timeData isEqualTo []) exitWith {_res};
_timeData params ["_god","_mesec","_day","_hr","_min","_sec"];

if (_hr < 10) then {_hr = format["0%1",_hr]};
if (_min < 10) then {_min = format["0%1",_min]};
_mesec = switch (_mesec) do 
{
		case 1: {"янв"};
		case 2: {"фев"};
		case 3: {"мар"}; 
		case 4: {"апр"};
		case 5: {"мая"}; 
		case 6: {"июн"};
		case 7: {"июл"};
		case 8: {"авг"};
		case 9: {"сен"};
		case 10: {"окт"};
		case 11: {"ноя"};
		case 12: {"дек"};
		default {"ХЗ"}; 
};
_res = format["%3 %4 %1:%2",_hr,_min,_day,_mesec];
		
_res