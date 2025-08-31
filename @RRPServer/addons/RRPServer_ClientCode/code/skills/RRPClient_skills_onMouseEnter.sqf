/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private ["_control","_display","_prof","_config","_textGroup","_text","_textPosition","_name","_picture"];
_control = _this select 0;
_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
_prof = _control getVariable ["prof",""];
_config = getMissionConfig "CfgSkills" >> _prof;
_slide = _display displayCtrl 29000;

_textGroup = _slide controlsGroupCtrl 29002;
_text = _textGroup controlsGroupCtrl 29101;
_textPosition = ctrlPosition _text;
_name = _slide controlsGroupCtrl 29004;
_picture = _slide controlsGroupCtrl 29003;
_name ctrlSetStructuredText parseText format ["<t font='SFCompactText'>%1</t>",(getText(_config >> "displayName"))];
_text ctrlSetStructuredText parseText format ["<t font='SFCompactText'>%1</t>",(getText(_config >> "description"))];
_picture ctrlSetText (getText(_config >> "picture"));
_textPosition set [3,((ctrlTextHeight _text) + (0.005 * safezoneH))];
_text ctrlSetPosition _textPosition;
_text ctrlCommit 0;
true
