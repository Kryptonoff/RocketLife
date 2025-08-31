
params [
	["_format","",[""]],
    ["_timeData",[],[[]]]
];

private _res = "";
if (_timeData isEqualTo []) exitWith {_res};

_timeData params ["_god","_mesec","_day","_hr","_min","_sec","_ms"];
switch (_format) do {
	case "hud" : {
        if (_mesec < 10) then {_mesec = format["0%1",_mesec];};
	    if (_day < 10) then {_day = format["0%1",_day]};
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
        _res = format["Rimas %6 [%1-%2-%3 %4:%5]",_day,_mesec,_god,_hr,_min,worldName]
    };
    case "db" : {
	    if (_mesec < 10) then {_mesec = format["0%1",_mesec];};
	    if (_day < 10) then {_day = format["0%1",_day]};
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _res = format["%1-%2-%3 %4:%5:%6",_god,_mesec,_day,_hr,_min,_sec];
    };
	case "db2" : {
	    if (_mesec < 10) then {_mesec = format["0%1",_mesec];};
	    if (_day < 10) then {_day = format["0%1",_day]};
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _res = format["%1-%2-%3 %4:%5",_god,_mesec,_day,_hr,_min];
    };
	case "db3" : {
	    if (_mesec < 10) then {_mesec = format["0%1",_mesec];};
	    if (_day < 10) then {_day = format["0%1",_day]};
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _res = format["%3/%2/%1",_god,_mesec,_day];
    };
	case "db4" : {
	    _res = format["%3.%2.%1",_god,_mesec,_day];
    };
	case "db5" : {
	    if (_mesec < 10) then {_mesec = format["0%1",_mesec];};
	    if (_day < 10) then {_day = format["0%1",_day]};
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _res = format["%1/%2 %3:%4",_day,_mesec,_hr,_min];
    };
	case "db6" : {
	    if (_mesec < 10) then {_mesec = format["0%1",_mesec];};
	    if (_day < 10) then {_day = format["0%1",_day]};
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _res = format["%1/%2/%3 %4:%5",_god,_mesec,_day,_hr,_min];
    };
    case "msg" : {
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _mesec = switch (_mesec) do {
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
    };
    case "msg2" : {
	    if (_hr < 10) then {_hr = format["0%1",_hr]};
	    if (_min < 10) then {_min = format["0%1",_min]};
	    _mesec = switch (_mesec) do {
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
        _res = format["%3 %4 %1:%2 %5г.",_hr,_min,_day,_mesec,_god];
    };
	default {
	    _timeData params ["_god","_mesec","_day","_hr","_min","_sec"];
		[_god,_mesec,_day,_hr,_min]
	};
};
_res