/*
	Filename: 	RRPClient_system_lootInvSearch.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_obj","_value","_data"];
_obj = cursorObject;
if(isNull _obj) exitWith {};
if(typeOf _obj != "Box_Wps_F") exitWith {};

_data = _obj GVAR ["Trunk",[[],0]];
if(count _data == 0) exitWith {["Транспорт пуст"] call hints};

_value = 0;

{
	_var = _x select 0;
	_val = _x select 1;

	_index = [_var,RRPPublicEconomyIlegalItems] call RRPClient_system_index;
	if(_index != -1) then {
		_value = _value + (_val * ((RRPPublicEconomyIlegalItems select _index) select 1));
	};
} foreach (_data select 0);

if(_value > 0) then {
	[format ["При обыске было изъято нелегальных вещей на сумму $%1",[_value] call RRPClient_util_numberText]] call hints;
	[[player,"atm","add",_value],"system_moneyChange"] call RRPClient_system_hcExec;

	_log = format ["lootInvSearch: atm (add) %3 to NAME:%1 (%2)",name player,steamid,_value];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
	[_obj] call RRPClient_system_clearVehicleTrunk;
} else {
	["В транспорте нет незаконных предметов"] call hints;
};