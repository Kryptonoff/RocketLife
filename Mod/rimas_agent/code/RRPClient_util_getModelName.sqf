/*

	Filename: 	RRPClient_util_getModelName.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

private _object = param [0,ObjNull,[ObjNull]];
private _array = (str(_object)) splitString ": .";

private _return = "";
{
	if (_x isEqualTo "p3d") exitWith {
		_return = _array select (_forEachIndex - 1);
	};
} forEach _array;

_return