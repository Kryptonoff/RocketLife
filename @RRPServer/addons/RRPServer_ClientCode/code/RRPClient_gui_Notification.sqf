private _messageText = param [0,"",[""]];
if (_messageText isEqualTo "") exitWith {};
disableSerialization;
private _ui = uiNamespace getVariable ["ExtremoNotification",displayNull];
if (isNull _ui) then {
	["ExtremoNotification","PLAIN",1,false] call RRPClient_gui_CreateRscLayer;
	_ui = uiNamespace getVariable ["ExtremoNotification",displayNull];
};

private _messageID = switch (true) do {
case (!life_message1): {1};
case (!life_message2): {2};
case (!life_message3): {3};
case (!life_message4): {4};
case (!life_message5): {5};
default {0}; 
};

if (_messageID isEqualTo 0) exitWith {
	uiSleep 5;
	[_messageText] spawn RRPClient_gui_Notification;
};

private _var = format["life_message%1",_messageID];
missionNamespace setVariable [_var,true];

private _message = _ui displayCtrl (24500 + _messageID);
private _xOut = 1 * safezoneW + safezoneX;
private _xIn = 0.680491 * safezoneW + safezoneX;
private _messagePositionY = ((ctrlPosition _message) select 1);

private _rollTime = 0.2;

_message ctrlSetStructuredText parseText format ["<t size='1' shadow='1' font='RobotoRegular' align='right'>%1</t>",_messageText];
_message ctrlSetPosition [_xIn,_messagePositionY];
_message ctrlCommit _rollTime;
uiSleep 3;
_message ctrlSetPosition [_xOut,_messagePositionY];
_message ctrlCommit _rollTime;
uiSleep _rollTime;
missionNamespace setVariable [_var,false];
