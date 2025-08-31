/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
	
	Usage:
		"marker_Variable" call RRPClient_util_world_getRandomPositionInCircleMarker
	Result:
		Array
*/

private _center  = getMarkerPos _this;
private _centerX = _center select 0;
private _centerY = _center select 1;
private _size = getMarkerSize _this;
_size = _size select 0;
private _dir  = random 360;
private _rand = sqrt random 1;
private _posX = (_size * (cos _dir)) * _rand;
private _posY = (_size * (sin _dir)) * _rand;
private _pos  = [_posX,_posY];

_posX = _centerX + (_pos select 0);
_posY = _centerY + (_pos select 1);

[_posX,_posY,0]