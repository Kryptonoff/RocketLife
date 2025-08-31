/*
	
	Filename: 	RRPClient_surgery_Menu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (server_restartSoon) exitWith {["Надвигается буря..."] call hints};

disableSerialization;
createDialog "UnionDialogSurgery";
waitUntil {!isNull (findDisplay 5400)};

call RRPClient_surgery_BoxCreate;

_list = CONTROL(5400,5402);
lbClear _list;
_config = getMissionConfig "CfgSurgery" >> if (license_isGirl) then {"Women"}else{"Man"};

{
	_x params ["_face","_name"];
	if (isNumber (configfile >> "CfgFaces" >> "Man_A3" >> _face >> "disabled")) then 
	{
		if (getNumber (configfile >> "CfgFaces" >> "Man_A3" >> _face >> "disabled") isNotEqualTo 0) then {continue};
		_index = _list lbAdd format["%1",_name];
		_list lbSetData [_index,_face];
		_list lbSetTextRight [_index, format["  $%1", [getNumber(_config >> "cost")] call RRPClient_util_numberText]];
	};
} forEach getArray(_config >> "faces");

[] spawn {
	while {true} do {
		if (isNull (findDisplay 5400)) exitWith {
			call RRPClient_surgery_BoxDestroy;
		};
		uiSleep 0.1;
	};
};
