
params [
    ["_myData",[],[[]]],
    ["_toData",[],[[]]],
    ["_message","",[""]],
    ["_offline",false,[false]],
    ["_delete",false,[false]]
];

[
    "UpdateMessage",
    _this,
    false
] call RRPClient_util_logArray;

if (_delete && {!(_myData isEqualTo [])}) exitWith {
    _myData params ["_myUid","_myName"];
    private _exist = format["selectMessageData:%1",_myUid] call RRPServer_DB_selectSingleField;
    format ["Update Message: SelectMessages: Delete: %1 #0111",_exist] call RRPServer_util_debugConsole;
    if !(isNil "_exist") then 
    {
        format["updateMessagesData:%1:%2",[],_myUid] call RRPServer_DB_fireAndForget;
    };
};

if (_toData isEqualTo [] || {_myData isEqualTo []} || {_message isEqualTo ""} || {_delete}) exitWith {};

_myData params ["_myUid","_myName"];
_toData params ["_toUid","_toName"];

if (_offline) then 
{
    private _exist = format["selectMessageData:%1",_toUid] call RRPServer_DB_selectSingleField;
    format ["Update Message: SelectMessages: Update: %1 #0111",_exist] call RRPServer_util_debugConsole;
    if (isNil "_exist" ) then
    {
        diag_log "exist";
        _newMessageData = [[_myUid,_myName,[[_myName,_message,systemTime]],1]];
        format["insertMessagesData:%1:%2",_toUid,_newMessageData] call RRPServer_DB_fireAndForget;
    } else {
        diag_log "!exist";

        private _toConversationData = _exist;
        private _tempConversationArray = [];
        private _messageData = [];
        private _moveIndex = -1;
        if (count _toConversationData > 0) then 
		{
            {
                if ((_x select 0) isEqualTo _myUid) exitWith 
				{
                    _moveIndex = _forEachIndex; 
                    _messageData = (_x select 2);
                    _messageData pushback [_MyName,_message,systemTime];
                    _countMsg = (_x select 3) + 1;
                    _x set [2,_messageData];
                    _x set [3,_countMsg];
                };
            } forEach _toConversationData;
        };
        
        if (_moveIndex > -1) then 
		{
            _tempConversationArray = [(_toConversationData select _moveIndex)];
            _toConversationData deleteAt _moveIndex;
            _toConversationData = _tempConversationArray + _toConversationData;
        } else {
            _moveIndex = _toConversationData pushBack [_myUid,_MyName,[[_MyName,_message,systemTimeUTC]],1];
            _tempConversationArray = [(_toConversationData select _moveIndex)];
            _toConversationData deleteAt _moveIndex;
            _toConversationData = _tempConversationArray + _toConversationData;
        };
        
        format["updateMessagesData:%1:%2",_toConversationData,_toUid] call RRPServer_DB_fireAndForget;
    };
};
