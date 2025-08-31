/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_displayName","_xOffset", "_yOffset", "_height", "_width"];
_displayName = _this select 0;
if (isClass (getMissionConfig _displayName)) then 
{
	_xOffset = getNumber (missionconfigfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "x");
	_yOffset = getnumber (missionconfigfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "y");
	_height = getnumber (missionconfigfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "h");
	_width = getnumber (missionconfigfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "w");
	RRPDisplayCurrentLimits = [[_xOffset,_xOffset + _width],[_yOffset,_yOffset + _height]];
}else{
	_xOffset = getNumber (configfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "x");
	_yOffset = getnumber (configfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "y");
	_height = getnumber (configfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "h");
	_width = getnumber (configfile >> _displayName >> "controls" >> (_this select 1) >> "CaptureArea" >> "w");
	RRPDisplayCurrentLimits = [[_xOffset,_xOffset + _width],[_yOffset,_yOffset + _height]];
};
true