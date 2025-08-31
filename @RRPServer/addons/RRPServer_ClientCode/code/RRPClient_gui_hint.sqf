params[
	"_text",
	["_customnotification", "info", ["",[],{}]],
	["_speed","",[""]]
];

if (!hasInterface) exitWith {};

disableSerialization;
_display = finddisplay 46;

_color = "";
private _headerIcon = "";
private _headerIconSize = 0.85;

switch (_customnotification) do
{
    case "info": {
        _color = [0.129,0.588,0.953,1];
        _headerIcon = "\a3\ui_f\data\igui\cfg\simpletasks\types\documents_ca.paa"; _headerIconSize = 0.85;
    };

    case "event": {
        _color = [0.337,0.031,0.514,1];
        _headerIcon = "\a3\ui_f\data\igui\cfg\simpletasks\types\default_ca.paa"; _headerIconSize = 0.85;
    };

    case "error": {
        _color = [1,0,0,1];
        _headerIcon = "\a3\ui_f\data\igui\cfg\simpletasks\types\danger_ca.paa"; _headerIconSize = 0.85;
    };

    case "warning": {
        _color = [0.722,0.349,0,1];
        _headerIcon = "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa"; _headerIconSize = 0.85;
    };

    case "admin": {
        _color = [0,1,0.831,1];
        _headerIcon = "\a3\ui_f\data\igui\cfg\simpletasks\types\interact_ca.paa"; _headerIconSize = 0.85;
    };
	default {
        _color = [0.298,0.686,0.314,1];
        _headerIcon = "\a3\ui_f\data\igui\cfg\simpletasks\types\help_ca.paa"; _headerIconSize = 0.7;
	};
};

playSound "notification";

private _Header = _display ctrlCreate ["RscStructuredText", -1];
_Header ctrlSetPosition [0.795 * safezoneW + safezoneX, 0.151 * safezoneH + safezoneY, 0.2 * safezoneW, 0.02 * safezoneH];
_Header ctrlSetBackgroundColor _color;
_Header ctrlSetFade 1;
_Header ctrlCommit 0;
_Header ctrlSetFade 0;
_Header ctrlCommit 0.4;
_Header ctrlSetStructuredText parseText format["<img align='left' size='%3' image='%1'/><t size='0.85' align='right' font='PuristaSemiBold'>%2</t>",_headerIcon,"Rocket Life",_headerIconSize];

private _TextField = _display ctrlCreate ["RscStructuredText", -1];

_TextField ctrlSetStructuredText parseText format["<t size='0.85' align='left' font='PuristaMedium'>%1</t>",_text];
_TextField ctrlSetPosition [0.795 * safezoneW + safezoneX, 0.171 * safezoneH + safezoneY,0.2 * safezoneW, 0.5];
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [0.795 * safezoneW + safezoneX, 0.171 * safezoneH + safezoneY,0.2 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_TextField ctrlSetBackgroundColor [0.25999999,0.23999999,0.31,0.8];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;
_TextField ctrlSetFade 0;
_TextField ctrlCommit 0.4;

[_TextField,_Header,_speed] spawn {
	disableSerialization;
	if (_this select 2 isEqualTo "fast") then {
		uiSleep 8;
	} else {
		uiSleep 15;
	};

	private _TextField = _this select 0;
	private _Header = _this select 1;
	_TextField ctrlSetFade 1;
	_TextField ctrlCommit 0.3;
	_Header ctrlSetFade 1;
	_Header ctrlCommit 0.3;
	uiSleep 0.3;
	ctrlDelete _Header;
	ctrlDelete _TextField;
};

private _posText = (ctrlPosition (_TextField)) select 1;
private _posHeader = (ctrlPosition (_Header)) select 1;
private _textHigh = (ctrlPosition (_TextField)) select 3;
if(isNil "life_open_notifications") then {life_open_notifications = [];};
if (count life_open_notifications > 0) then {
	private _activeNotifications = 0;
	{
		private _ctrlHeader = _x select 0;
		private _ctrlText = _x select 1;
		if (!isNull _ctrlHeader && !isNull _ctrlText) then {
			_ctrlHeader ctrlSetPosition [0.795 * safezoneW + safezoneX, (_posHeader + _textHigh + 2*(0.011 * safezoneH))];
			_ctrlText ctrlSetPosition [0.795 * safezoneW + safezoneX, (_posText + _textHigh + 2*(0.011 * safezoneH))];
			_ctrlHeader ctrlCommit 0.25;
			_ctrlText ctrlCommit 0.25;
			_posText = (_posText + _textHigh + 2*(0.011 * safezoneH));
			_posHeader = (_posHeader + _textHigh + 2*(0.011 * safezoneH));
			_textHigh = (ctrlPosition (_ctrlText)) select 3;
			if (_activeNotifications > 3) then {
				_ctrlText ctrlSetFade 1;
				_ctrlHeader ctrlSetFade 1;
				_ctrlText ctrlCommit 0.2;
				_ctrlHeader ctrlCommit 0.2;
			};
			_activeNotifications = _activeNotifications + 1;
		};
	} forEach life_open_notifications;
};

life_open_notifications = ([[_Header,_TextField]] + life_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};