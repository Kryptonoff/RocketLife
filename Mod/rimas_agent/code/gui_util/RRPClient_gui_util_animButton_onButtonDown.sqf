/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_control", "_displayName", "_controlName", "_texture"];
_control = (_this select 0) select 0;
_displayName = _this select 1;
_controlName = _this select 2;
if (isClass (getMissionConfig _displayName)) then 
{
	_texture = getText(getMissionConfig _displayName >> "controls" >> _controlName >> "buttonPictures" >> _logicalState);
}else{
	_texture = getText(configFile >> _displayName >> "controls" >> _controlName >> "buttonPictures" >> _logicalState);
};
_control ctrlSetText _texture;
RRPGuiControlClick = true;
true
