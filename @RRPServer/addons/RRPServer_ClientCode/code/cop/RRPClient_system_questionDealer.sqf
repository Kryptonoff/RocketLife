/*
	Filename: 	RRPClient_system_questionDealer.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _sellers = (_this select 0) GVAR ["sellers",[]];
if (EQUAL(_sellers,[])) exitWith {["Дилер давно не получал поставок."] call hints};
call RRPClient_actions_inUse;
private _names = "";
private "_val";
{	
	_val = _x select 2;

	if (_val > 15000) then {
		_val = round(_val / 16);
	};

	[_x select 0,"483",_val] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	_names = _names + format["%1<br/>",_x select 1];
} foreach _sellers;

[format[("Эти люди были недавно на продаже возле дилера.")+ "<br/><br/>%1",_names]] call hints;
(_this select 0) SVAR ["sellers",[],true];
life_action_inUse = false;