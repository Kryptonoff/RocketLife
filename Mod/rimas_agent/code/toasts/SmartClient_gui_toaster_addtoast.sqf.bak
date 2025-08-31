/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/

private["_rawText", "_stripeColor", "_display", "_toastControl", "_toastPosition", "_textControl", "_textHeight", "_textPosition", "_backgroundControl", "_backgroundPosition", "_stripeControl", "_stripePosition"];
disableSerialization;
if !(SmartClientToastAreaVisible) exitWith {
    false
};

private _pushToBottom = {
    
    private["_position", "_toastControl", "_toastPosition", "_status", "_statusChangeAt"];
    disableSerialization;
    _position = 0; 
    {
        _toastControl = _x select 0;
        _toastPosition = ctrlPosition _toastControl;
        _status = 0;
        _statusChangeAt = (_x select 2) max(diag_tickTime + 2);
        if (_forEachIndex isEqualTo 0) then {
            _position = safeZoneY + 40 * pixelH;
            _toastControl ctrlSetFade 0;
        } else {
            if (_forEachIndex > 4) then {
                _toastControl ctrlSetFade 1;
                _status = 1;
                _statusChangeAt = diag_tickTime + 2;
            };
        };
        _toastPosition set [1, _position];
        _toastControl ctrlSetPosition _toastPosition;
        _toastControl ctrlCommit 0.25;
        _position = _position + (_toastPosition select 3) + (10 * pixelH);
        SmartClientToasts set [_forEachIndex, [_toastControl, _status, _statusChangeAt]];
    }
    forEach SmartClientToasts;
};

_rawText = _this select 0;
_stripeColor = _this select 1;
_display = uiNameSpace getVariable["RscToastArea", displayNull];
_toastControl = _display ctrlCreate["RscToast", -1];
_toastPosition = ctrlPosition _toastControl;
_textControl = _toastControl controlsGroupCtrl 102;
_textControl ctrlSetStructuredText(parseText _rawText);
_textHeight = ctrlTextHeight _textControl;
_textPosition = ctrlPosition _textControl;
_textPosition set[3, _textHeight];
if (_textHeight < ((_toastPosition select 3) - 14 * pixelH)) then {
    _textPosition set[1, (_toastPosition select 1) + ((_toastPosition select 3) - _textHeight) * 0.5];
} else {
    _toastPosition set[3, _textHeight + 14 * pixelH];
    _textPosition set[1, 7 * pixelH];
};
_textControl ctrlSetPosition _textPosition;
_textControl ctrlCommit 0;
_backgroundControl = _toastControl controlsGroupCtrl 100;
_backgroundPosition = ctrlPosition _backgroundControl;
_backgroundPosition set[3, _toastPosition select 3];
_backgroundControl ctrlSetPosition _backgroundPosition;
_backgroundControl ctrlCommit 0;
_stripeControl = _toastControl controlsGroupCtrl 101;
_stripeControl ctrlSetBackGroundColor _stripeColor;
_stripePosition = ctrlPosition _stripeControl;
_stripePosition set[3, _toastPosition select 3];
_stripeControl ctrlSetPosition _stripePosition;
_stripeControl ctrlCommit 0;
_toastPosition set [0, safeZoneX + 475 * pixelW];
_toastPosition set [1, safeZoneY + (50 - 10) * pixelH - (_toastPosition select 3)];
_toastControl ctrlSetPosition _toastPosition;
_toastControl ctrlSetFade 1;
_toastControl ctrlCommit 0;
reverse SmartClientToasts;
SmartClientToasts pushBack[_toastControl, 0, diag_tickTime + 5];
reverse SmartClientToasts;
playsound "HintExpand";
call _pushToBottom;