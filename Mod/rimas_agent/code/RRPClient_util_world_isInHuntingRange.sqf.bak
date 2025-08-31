/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_position", "_result"];
_position = _this;
_result = false;
{
	if ((((_x select 0) distance2D _position) < (_x select 1) && (getPosATL player select 2 < 50))) exitWith
	{
		_result = true;
	};
}
forEach HuntingMarkersPosAndSize;
_result