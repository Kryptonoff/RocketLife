#include "..\..\script_macros.hpp"
params [
	["_uid","",[""]],
	["_MyName","",[""]],
	["_FromName","",[""]],
	["_message","",[""]],
	["_offline",false,[false]]
];

if (_uid isEqualTo "" || {_MyName isEqualTo ""} || {_FromName isEqualTo ""} || {isNil "RRPClientTGConversations"}) exitWith {};
if (count _message isEqualTo 0) exitWith {};
private _tempConversationArray = [];
private _messageData = [];
private _moveIndex = -1; 
{
	if ((_x select 0) isEqualTo _uid) exitWith {
	    _moveIndex = _forEachIndex; 
		(_x select 2) pushback [_MyName,_message,systemTimeUTC];
		_messageData = (_x select 2);
	    _countMsg = (_x select 3) + 1;
	    if (count _messageData > 100) then {
	        while {count _messageData > 100} do {
	            _messageData deleteAt 0;
			};
		};
		_x set [2,_messageData];
		_x set [3,_countMsg];
	};
} foreach RRPClientTGConversations;

if (_moveIndex > -1) then {
    _tempConversationArray = [(RRPClientTGConversations select _moveIndex)];
    RRPClientTGConversations deleteAt _moveIndex;
    RRPClientTGConversations = _tempConversationArray + RRPClientTGConversations;
} else {
	_messageData = [[_MyName,_message,systemTimeUTC]];
	_moveIndex = RRPClientTGConversations pushBack [_uid,_FromName,_messageData,1];
    _tempConversationArray = [(RRPClientTGConversations select _moveIndex)];
    RRPClientTGConversations deleteAt _moveIndex;
    RRPClientTGConversations = _tempConversationArray + RRPClientTGConversations;
};

["add",RRPClientTGConversations] call RRPClient_ini_chatHistory;

//если открыта соответствующая история, то обновить ее
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTelegram",displayNull];
if !(isNull _display) then {
	if (_uid isEqualTo (CONTROL_DATA(9001))) then {
		["onRefreshConversation",[_display,_messageData]] call RRPClient_tg_main;
	};
};