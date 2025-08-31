/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_newPos", "_isCompleated", "_count", "_startPos"];
_newPos = _this;
_isCompleated = false;
_count = count RRPClientGroupMapLineRenderArray;
if(_count > 2)then
{
	_startPos = ((RRPClientGroupMapLineRenderArray select 0) select 0);
	if((_startPos distance2D _newPos) < 50)then
	{
		_isCompleated = true;
	};
};
_isCompleated