/*
	Filename: 	RRPClient_system_broadcast.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\..\script_macros.hpp"
params [
	["_type",0,[[],0]],
	["_message","",[""]],
	["_localize",false,[false]],
	["_arr",[],[[]]]
];

if (EQUAL(_message,"")) exitwith {};

private _msg = if (_localize) then {
	switch (count _arr) do {
		case 0: {_message};
		case 1: {format[_message,_arr select 0]};
		case 2: {format[_message,_arr select 0, _arr select 1]};
		case 3: {format[_message,_arr select 0, _arr select 1, _arr select 2]};
		case 4: {format[_message,_arr select 0, _arr select 1, _arr select 2, _arr select 3]};
		case 5: {format[_message,_arr select 0, _arr select 1, _arr select 2, _arr select 3, _arr select 4]};
	};
} else {_message};

if (_type isEqualType []) then {
	{
		switch (_x) do {
			case 0: {_msg call chat};
			case 1: {[_msg] call hints};
			case 2: {titleText[format["%1",_msg],"PLAIN"]};
		};
	} forEach _type;
} else {
	switch (_type) do {
		case 0: {_msg call chat};
		case 1: {[_msg] call hints};
		case 2: {titleText[format["%1",_msg],"PLAIN"]};
	};
};