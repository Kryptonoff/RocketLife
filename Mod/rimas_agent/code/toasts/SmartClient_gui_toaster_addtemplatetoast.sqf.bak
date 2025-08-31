/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_template", "_placeholders", "_placeholder1", "_placeholder2", "_placeholder3", "_placeholder4", "_templateConfig", "_color", "_templateText", "_rawText"];
_template = _this select 0;
if !(isClass(configFile >> "CfgToasts" >> _template)) exitWith {
    format["UNKNOWN TOAST TEMPLATE: %1", _template] call chat;
};
_placeholders = param[1, [""]];
_placeholder1 = _placeholders param[0, ""];
_placeholder2 = _placeholders param[1, ""];
_placeholder3 = _placeholders param[2, ""];
_placeholder4 = _placeholders param[3, ""];
_templateConfig = configFile >> "CfgToasts" >> _template;
_color = getArray(_templateConfig >> "color");
_templateText = getText(_templateConfig >> "template");
_rawText = format[_templateText, _placeholder1, _placeholder2, _placeholder3, _placeholder4];
[_rawText, _color] call SmartClient_gui_toaster_addToast;