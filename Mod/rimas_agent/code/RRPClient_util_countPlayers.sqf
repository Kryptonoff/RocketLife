/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	
	Usage: 
		0 - STRING
	Return:
		SCALAR
*/

_find = _this select 0;
_return = count (allPlayers apply {_x getVariable [_find,false]});
_return