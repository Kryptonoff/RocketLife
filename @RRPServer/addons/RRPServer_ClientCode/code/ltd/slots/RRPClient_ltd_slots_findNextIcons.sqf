/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(params [
	["_array", [], [[]]],
	["_index", -1, [-1]]
]) exitWith {[]};

private _middle_index = [(_index + 1), 0] select (_index isEqualto ((count _array) - 1));
private _bottom_index = [
	([(_middle_index + 1), 0] select (_middle_index isEqualto ((count _array) - 1))),
	1
] select (_middle_index isEqualTo 0);

[
	_array # _index,
	_array # _middle_index,
	_array # _bottom_index
]