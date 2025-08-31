/*
	
	Filename: 	RRPClient_util_xString.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

	_found = ["needle", "Needle in Haystack"] call RRPClient_util_xString;

*/

private _toSearch = toArray (param [0,"",[""]]);
private _inSearch = toArray (param [1,"",[""]]);

private _lengthTo = count _toSearch;
private _lengthIn = count _inSearch;

private _found = false;

if (_lengthIn >= _lengthTo) then {
	_inSearch resize _lengthTo;
	if (_inSearch isEqualTo _toSearch) then {_found = true};
};

_found;