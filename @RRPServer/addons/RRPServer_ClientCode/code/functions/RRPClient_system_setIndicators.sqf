/*

	Filename: 	RRPClient_system_setIndicators.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _indicators = param [0,[],[[]]];
if (EQUAL(_indicators,[])) exitWith {};
diag_log format ["INDICATORS: %1",_indicators];
private["_var","_val"];
{
	_var = _x select 0;
	_val = _x select 1;

	switch (_var) do {
		case "life_myIdentity": {
			if (EQUAL(FETCH_CONST(life_donator),0)) then {_val = ""};
		};
		case "life_myPassportID": {
			if !(_val isEqualType "") then {_val = ""};
		};
	};
	SVAR_MNS [_var,_val];
} foreach _indicators;
