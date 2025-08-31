/*
	Seassons:
		christmas
		hallowen
		china_year
		9may
		23feb
		vdv
*/


private _now = systemTime;
private _season = "";

{  
    if ((_x select 0) <= (_now select 1) && (_x select 2) >= (_now select 1)) then { 
        if ((_x select 1) <= (_now select 2) && (_x select 3) >= (_now select 2)) then { 
            _season = _x select 4; 
        }; 
    }; 
} forEach (getArray(configFile >> "CfgSeasons" >> "dates"));

{
	_x params ["_variable","_value"];
	missionNamespace setVariable [_variable,_value,true];
} forEach [
	["CurrentSeasson",_season]
];

format ["Current Season: %1 #0101",_season] call RRPServer_util_debugConsole;