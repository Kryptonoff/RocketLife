/*

	Filename: 	RRPClient_system_badProfileName.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private _string = param [0,"",[""]];
if (["  ",_string] call BIS_fnc_inString) exitWith {true};
private _return = false;
private _filter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ";

_string = toArray _string;
_filter = toArray _filter;

{
	if !(_x in _filter) exitWith {_return = true};
} forEach _string;

if !(_return) then 
{
	private _first = _string select 0;
	private _last = _string select ((count _string) - 1);
	private _space = (toArray " ") select 0;
	if (_last isEqualTo _space) then {_return = true};
	if (_first isEqualTo _space) then {_return = true};

	{
		if ((_x isEqualTo _space) && ((_string select (_forEachIndex + 1)) isEqualTo _space)) exitWith {_return = true};
	} forEach _string;
};
_return