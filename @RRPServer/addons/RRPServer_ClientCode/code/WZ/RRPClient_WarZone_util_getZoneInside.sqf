/*
	Project: Rimas Role Play 
	Author: FairyTale#5571
	License: CC BY-ND

	Return: String marker name
*/

private _unit = param [0,objNull,[objNull]];
private _return = [];
{
		_marker = format["war_zone_%1",_x select 0];
		if (_unit distance2D (getMarkerPos _marker) < (_x select 1)) exitWith 
		{
			_return = [_marker,_x select 1];
		};
} forEach RRPServerWarZones;
_return
