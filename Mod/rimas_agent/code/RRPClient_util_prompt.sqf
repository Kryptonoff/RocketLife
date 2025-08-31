
if !(canSuspend) exitWith {_this spawn RRPClient_util_prompt};
disableSerialization;
params [
	'_displayParent',
	['_action',{}],
	['_actionArguments',[]],
	'_title',
	'_text',
	['_actionDenied',{}],
	['_actionDeniedArguments',[]],	
	['_hasOK',true],
	['_closeParent',false]
];
	
if (!isNull (uiNamespace getVariable ['promptDisplay',displayNull])) exitWith {};
private _display = _displayParent createDisplay "RscDisplayEmpty";
uiNamespace setVariable ['promptDisplay',_display];
_display setVariable ['statusCode',-1];
private _fontH = "RobotoCondensedBold";
private _pW = parseNumber (((pixelW * 5) * 1) toFixed 3);
private _pH = parseNumber (((pixelH * 5) * 1) toFixed 3);
private _group = _display ctrlCreate ['RscControlsGroupNoScrollbars',-1];
_group ctrlSetPosition [0 * safezoneW + safezoneX, 0 * safezoneH + safezoneY, 1 * safezoneW, 1 * safeZoneH];
_group ctrlCommit 0;
(ctrlPosition _group) params ['_gX','_gY','_gW','_gH'];
private _background = _display ctrlCreate ['RscText',-1,_group];
_background ctrlSetPosition [0,0,_gW,_gH];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;
_background ctrlEnable false;
private _titleCtrl = _display ctrlCreate ['RRP_RscStructuredText',-1,_group];
_titleCtrl ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.8];
_titleCtrl ctrlSetPosition [0,_gH/2 - (20 * _pH),_gW,8 * _pH];
_titleCtrl ctrlSetStructuredText parseText format["<t align='center' font='%2' size='%3'>%1</t>",_title,"RobotoCondensedBold",180 * _pH];
_titleCtrl ctrlCommit 0;
_titleCtrl ctrlEnable false;
private _textCtrl = _display ctrlCreate ['RRP_RscStructuredText',-1,_group];
_textCtrl ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
_textCtrl ctrlSetPosition [0,_gH/2 - (12 * _pH),_gW,18 * _pH];
_textCtrl ctrlSetStructuredText parseText format["<br/><t align='center' font='%2' size='%3'>%1</t>",_text,_fontH,100 * _pH];
_textCtrl ctrlCommit 0;
private _buttonBg = _display ctrlCreate ['RRP_RscStructuredText',-1,_group];
_buttonBg ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
_buttonBg ctrlSetPosition [0,_gH/2 + (4 * _pH),_gW,10 * _pH];
_buttonBg ctrlCommit 0;
_buttonBg ctrlEnable false;
private _buttonOK = if (_hasOK) then {
	private _buttonOK = _display ctrlCreate ['RRP_btn_green',-1,_group];
	_buttonOK ctrlSetPosition [_gW/2 - (38 * _pW),_gH/2 + (6 * _pH),36 * _pW,6 * _pH];
	_buttonOK ctrlSetStructuredText parseText format["<t align='center' font='%2'>%1</t>",toUpper "Ок",_fontH,140 * _pH];
	_buttonOK ctrlCommit 0;
	_buttonOK
} else {
	controlNull
};
private _cancelPositionX = if (isNull _buttonOK) then {_gW/2 - 36 * _pW} else {_gW/2 + (2 * _pW)};
private _cancelPositionW = if (isNull _buttonOK) then {72 * _pW} else {36 * _pW};
private _buttonCancel = _display ctrlCreate ['RRP_btn_red',-1,_group];
_buttonCancel ctrlSetPosition [_cancelPositionX,_gH/2 + (6 * _pH),_cancelPositionW,6 * _pH];
_buttonCancel ctrlSetStructuredText parseText format["<t align='center' font='%2'>%1</t>",toUpper "Отмена",_fontH,140 * _pH];
_buttonCancel ctrlCommit 0;

_buttonOK ctrlAddEventHandler ['ButtonClick',{
	params ['_ctrl'];
	(ctrlParent _ctrl) setVariable ['statusCode',1];
}]; 
_buttonCancel ctrlAddEventHandler ['ButtonClick',{
	params ['_ctrl'];
	(ctrlParent _ctrl) setVariable ['statusCode',2];
}];

private _keyID = _display displayAddEventHandler ['KeyDown',{
	params ['_display','_code'];
	private _handled = true;
	if (_code in [0x01,0x1C,0x9C]) then {_handled = false};
	switch (_code) do {
		case 0x01: {_display setVariable ['statusCode',2]};
		case 0x1C: {_display setVariable ['statusCode',1]};
		case 0x9C: {_display setVariable ['statusCode',1]};
	};
	_handled
}];
waitUntil {_display getVariable ['statusCode',-1] > -1};
private _statusCode = _display getVariable ['statusCode',-1];
if (_statusCode isEqualTo 2) exitWith {
	_display closeDisplay 0;
	if (_closeParent) then {_displayParent closeDisplay 0};
	_actionDeniedArguments call _actionDenied;
};
_display closeDisplay 0;
_actionArguments call _action;
