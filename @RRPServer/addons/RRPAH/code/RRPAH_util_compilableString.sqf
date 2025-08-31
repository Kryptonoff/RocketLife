/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

_input = _this select 0;
_output = call 
{
	if (_input isEqualType {}) exitWith { (str(_input)) select [1,((count(str(_input)))-2)] };
	if (_input isEqualType "") exitWith { _input };
	""
};
_output