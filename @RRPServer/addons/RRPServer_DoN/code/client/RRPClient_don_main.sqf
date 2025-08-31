/*
	author : itsleigham
	description : runs the main double or nothing function
	usage : [machine] spawn RRPClient_don_main;
*/


if !(params [
	["_machine", objNull, [objNull]]
]) exitWith {};


if (_machine getVariable ["don_inprogress", false]) exitWith {};
_machine setVariable ["don_inprogress", true];

private _multiplier = _machine getVariable ["multiplier", 0];

if (_multiplier isEqualTo -1) exitWith 
{
	_machine setVariable ["multiplier", 0];
	_machine setVariable ["don_user", "", true];
	_machine spawn RRPClient_don_update;
};

private _random = [1,100] call BIS_fnc_randomInt;

if (_random < 50) exitWith 
{
	_machine setVariable ["multiplier", -1];
	_machine spawn RRPClient_don_update;
	_machine say3D ["DONXN", 1000, 1];
	_machine setVariable ["don_inprogress", false];
};

private _newMultplier = (_multiplier + 1) min 10;
if !(_newMultplier isEqualTo 10) then 
{
	_machine say3D [format ["donx%1", _newMultplier], 1000, 1];
};
_machine setVariable ["multiplier", _newMultplier];
_machine spawn RRPClient_don_update;

[_newMultplier, _machine] spawn 
{
	params [
		["_newMultplier", 0, [0]],
		["_machine", objNull, [objNull]]
	];

	private _timer = diag_tickTime;
	waitUntil {
		!(_newMultplier isEqualTo (_machine getVariable ["multiplier", 0])) ||  // bet again 
		((_machine getVariable ["don_user", ""]) isEqualTo "") || // manually cashed out 
		((diag_tickTime - _timer) >= 60) // time limit
 	};
	if ((diag_tickTime - _timer) >= 60) exitWith 
	{
		[_machine] call RRPClient_don_cashout;
	};
};
