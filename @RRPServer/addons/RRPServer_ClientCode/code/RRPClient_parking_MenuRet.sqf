/*
	Filename: 	RRPClient_parking_MenuRet.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
disableSerialization;
private _vehicles = param [0,[],[[]]];
waitUntil {!isNull (findDisplay 5700)};
_display = findDisplay 5700;
if (EQUAL(_vehicles,[])) exitWith {
	ctrlSetText[5702,"Гараж пуст."];
};

_vehicles = _vehicles apply {
	[_x select 0,_x select [1,((count _x) -1)]]
};

_hash = createHashMapFromArray _vehicles;
_display setVariable ["cache",_hash];

private _control = CONTROL(5700,5702); 
lbClear _control;

private ["_vehicleInfo","_tmp"];
{
	_x params ["_id","_data"];
	_vehicleInfo = [_data select 0] call RRPClient_util_fetchVehInfo;
	_index = _control lbAdd (_vehicleInfo select 3);
	_control lbSetValue [_index,_id];
} forEach _vehicles;

ctrlShow[5703,false];
ctrlShow[5704,false];

