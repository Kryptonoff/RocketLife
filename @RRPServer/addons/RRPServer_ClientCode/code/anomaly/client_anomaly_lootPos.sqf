/*

    Filename: 	client_anomaly_lootPos.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club
	
*/
private _building = param [0,objNull,[objNull]];
private _posNumber = param [1,-1,[0]];

if (isNull _building) exitWith {[]};

private _arrayPosition = [_building] call BIS_fnc_buildingPositions;
if (_arrayPosition isEqualTo []) exitWith {[]};

private _return = -1;

if (_posNumber isEqualTo -1) then {
	_number_pos = floor random (count _arrayPosition - 1);
	if ((count _arrayPosition - 1) >= _number_pos) then {
		_return = _arrayPosition select _number_pos;
	} else {
		_return = _arrayPosition select 0;
	};
} else {
	_tmp = _arrayPosition select _posNumber;
	if !(isNil "_tmp") then {_return = _tmp;};
};

if (_return isEqualTo -1) exitWith {[]};

_return;