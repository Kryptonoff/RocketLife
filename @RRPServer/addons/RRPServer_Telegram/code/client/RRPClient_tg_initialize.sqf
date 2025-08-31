
params [
	["_myConversations",[],[[]]]
];

_conversationsData = ["read"] call RRPClient_ini_chatHistory;
if !(_myConversations isEqualTo []) then 
{
	{
		private _moveIndex = -1;
		private _fName = "";
		private _delete = false;
		private _tempConversationArray = [];
		_x params ["_newUid","_newName","_newMsgData","_countNewMsg"];		
		{			
			_x params ["_uid","_name","_msgData","_countMsg"];
			if (_uid isEqualTo _newUid) exitWith 
			{
				_moveIndex = _forEachIndex;
				_msgData append _newMsgData;
				_countMsg = _countMsg + _countNewMsg;
				_x set [2,_msgData];
				_x set [3,_countMsg];
				_deleteIndex = ["[Удалил переписку...]",_msgData] call RRPClient_system_index;
				if !(_deleteIndex isEqualTo -1) then 
				{
					_delete = true;
				};
			};
		} forEach _conversationsData;

		if (_moveIndex > -1) then 
		{
			_tempConversationArray = [(_conversationsData select _moveIndex)];
			_conversationsData deleteAt _moveIndex;
			if !(_delete) then {
				_conversationsData = _tempConversationArray + _conversationsData;
			};
		} else {
			_moveIndex = _conversationsData pushBack _x;
			_tempConversationArray = [(_conversationsData select _moveIndex)];
			_conversationsData deleteAt _moveIndex;
			if !(_delete) then {
				_conversationsData = _tempConversationArray + _conversationsData;
			};
		};
	} forEach _myConversations;
};

RRPClientTGConversations = _conversationsData;

{
	private _friendsIndex = [getPlayerUID _x,RRPClientTGFriends] call RRPClient_system_index;
	private _converIndex = [getPlayerUID _x,RRPClientTGConversations] call RRPClient_system_index;
	if !(_friendsIndex isEqualTo -1) then 
	{
		private _fName = (RRPClientTGFriends select _friendsIndex) select 0;

		if !(_fName isEqualTo name _x) then 
		{
			RRPClientTGFriends deleteAt _friendsIndex;
			["[Удалил вас из друзей...]",player,0] remoteExecCall ["RRPClient_tg_receiveClient",_x];
			if !(_converIndex isEqualTo -1) then 
			{
				RRPClientTGConversations deleteAt _converIndex;
				["[Удалил переписку...]",player,0] remoteExecCall ["RRPClient_tg_receiveClient",_x];
			};
		};
	} else {
		if !(_converIndex isEqualTo -1) then 
		{
			private _cName = (RRPClientTGConversations select _converIndex) select 1;

			if !(name _x isEqualTo _cName) then 
			{
				RRPClientTGConversations deleteAt _converIndex;
				["[Удалил переписку...]",player,0] remoteExecCall ["RRPClient_tg_receiveClient",_x];
			};
		};
	};
} forEach allPlayers;

private _countNewMessages = 0;
if (count RRPClientTGConversations > 0) then 
{
	{
		if !((_x select 0) in ["__ADMIN__","__COP__","__MED__","__PRESS__","__TAXI__"]) then 
		{
			_countNewMessages = _countNewMessages + (_x select 3);
		};
	} foreach RRPClientTGConversations;
};

if (_countNewMessages > 0) then 
{
	_countNewMessages spawn 
	{
		waitUntil {uiSleep 10; player getVariable ["lifeState",""] isEqualTo "HEALTHY";};
		player say3D "sms";
	};
};

RRPClientTGFriends = ["read"] call RRPClient_ini_friendList;
