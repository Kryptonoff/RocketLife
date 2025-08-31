/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_control", "_rightClick", "_positionX", "_positionY", "_inScreen"];
_control = _this select 0;
_rightClick = [false,true] select ((_this select 1) isEqualTo 1);
_positionX = _this select 2;
_positionY = _this select 3;
_inScreen = [_positionX,_positionY] call RRPClient_gui_util_mouseControl_inLimit;
if(_inScreen)then
{
	if(_rightClick)then
	{
		RRPCameraRightClickDown = true;
	};
};
RRPClientDisplayResetFocus = true;
true
