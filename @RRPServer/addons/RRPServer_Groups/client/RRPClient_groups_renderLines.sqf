/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control"];
_control = _this select 0;
if(!(RRPClientGroupMapLineRenderArray isEqualTo []))then
{
	{
		_control drawLine _x;
	}
	forEach RRPClientGroupMapLineRenderArray;
};