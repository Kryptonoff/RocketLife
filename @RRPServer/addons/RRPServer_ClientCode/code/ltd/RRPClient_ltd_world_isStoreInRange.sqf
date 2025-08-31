/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_position","_range"];
private _stores = [];
{
	_var = _x getVariable ["ltdOwner",-1];
	if !(_var isEqualTo -1) then 
	{
		_stores pushBack _x;
	};
}forEach (_position nearObjects ["LtdsStore", _range]);

private _isInRange = !(_stores isEqualTo []);
_isInRange