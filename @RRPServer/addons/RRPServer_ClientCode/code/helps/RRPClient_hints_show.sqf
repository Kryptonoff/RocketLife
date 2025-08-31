/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _resizeText = {
	_textPosition = ctrlPosition _textControl;
	_textPosition set [3,((ctrlTextHeight _textControl) + (0.005 * safezoneH))];
	_textControl ctrlSetPosition _textPosition;
	_textControl ctrlCommit 0.1;
};

private _display = uiNamespace getVariable ["HintsKeyboard",displayNull];
if (isNull _display) then 
{
	["HintsKeyboard","PLAIN",1,false] call RRPClient_gui_CreateRscLayer;
	_display = uiNamespace getVariable ["HintsKeyboard",displayNull];
};
private _group = _display displayCtrl 19930;
_display setVariable ["position",ctrlPosition _group];
_display setVariable ["isHide",false];
private _config = getMissionConfig "CfgHints";

_textControl = [
	_group,
	10001,
	[0,0,0.3375,0.06],
	"",
	getText(_config >> "font"),
	getNumber(_config >> "textSize"),
	"left",
	"#efefef",
	"0",
	[0.26, 0.24, 0.31,0.5]
] call RRPClient_gui_util_makeStructuredText;

if (profileNamespace getVariable ["HelpsHided",false]) then {
	0 spawn RRPClient_hints_show_hide;
};

private _prevArray = [];

while {true} do 
{
	if (_display getVariable ["isHide",false]) then { uiSleep 1; continue};
	_newArray = [];
	{
		_newArray pushBackUnique (getText(_x >> "text"));
	}forEach ("[getText(_x >> ""condition"")] call RRPClient_util_conditionsCheck" configClasses _config);
	if (_prevArray isEqualTo _newArray) then { uiSleep 1; continue};
	_prevArray = _newArray;
	_textControl ctrlSetStructuredText parseText (format ["<t valign='middle'>%1</t>", _newArray joinString "<br/>"]);
	call _resizeText;
	uiSleep 1;
};

true
