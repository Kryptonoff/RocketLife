/*
	Project: Headless Client for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_arrest","_alive","_position","_query","_thread","_indicators","_config","_craft","_dcash","_tmptax","_selled"];
params
[
	["_uid","",[""]],
	["_side",sideUnknown,[civilian]],
	["_cash",0,[0]],
	["_bank",5000,[0]],
	["_licenses",[],[[]]],
	["_gear",[],[[]]],
	["_tmptax",0,[0]],
	["_selled",[],[[]]],
	["_config",[],[[]]],
	["_indicators",[],[[]]],
	["_craft",[],[[]]],
	["_dcash",0,[0]],
	["_deaths",0,[0]]

	//["_tmptaxREB",0,[0]],
	//["_selledREB",[],[[]]]
];

//Get to those error checks.
if (_uid isEqualTo "") exitWith {};

//Parse and setup some data.

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call RRPHC_DB_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

for "_i" from 0 to count(_config)-1 do {
    _bool = [(_config select _i) select 1] call RRPHC_DB_bool;
    _config set[_i,[(_config select _i) select 0,_bool]];
};

for "_i" from 0 to count(_craft)-1 do {
    _bool = [(_craft select _i) select 1] call RRPHC_DB_bool;
    _craft set[_i,[(_craft select _i) select 0,_bool]];
};

_query = format ["updateRequest:%1:%2:%3:%4:%5:%6:%7:%8:%9",_uid,_cash,_bank,_licenses,_gear,_indicators,_config,_craft,_deaths];
_query call RRPHC_DB_fireAndForget;

if !(_selled isEqualTo []) then {
    for "_i" from 0 to count(_selled)-1 do {
	   format ["updateRequest_economy:%1:%2",(_selled select _i) select 0,(_selled select _i) select 1] call RRPHC_DB_fireAndForget;
	   [] spawn {uiSleep 0.03;};
	};
};

if (_tmptax > 0) then {
	format ["updateRequest_rules:%1",_tmptax] call RRPHC_DB_fireAndForget;
};
