/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_mapControl", "_mouseButton", "_shift", "_ctrl", "_alt", "_stopPropagation"];
_mapControl = _this select 0;
_mouseButton = _this select 1;
_shift = _this select 4;
_ctrl = _this select 5;
_alt = _this select 6;
_stopPropagation = false;
if (_mouseButton isEqualTo 1) then 
{
    RRPClientLastMapDown = diag_tickTime;
};
_stopPropagation
