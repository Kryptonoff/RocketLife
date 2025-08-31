/*

	file: fn_handleMessages.sqf
	Author: Silex

*/

private ["_msg","_to","_target","_player","_type"];
_target = param [0,ObjNull,[ObjNull]];
_msg = param [1,"",[""]];
_player = param [2,ObjNull,[ObjNull]];
_type = param [3,-1];

switch(_type) do
{
	case 0:
	{
		if(isNULL _target)  exitWith {};
		_to = call compile format ["%1", _target];
		[_msg,(_player call getFullName),0] remoteExec ["RRPClient_system_clientMessage",_to];

		private ["_query","_pid","_toID"];
		_pid = getPlayerUID _player;
		_toID = getPlayerUID _target;
		_msg = [_msg] call RRPServer_DB_mresString;
		_fromName = _player call getFullName;
		_toName = _target call getFullName;
		format ["createMessages:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName] call RRPServer_DB_insertSingle;
	};
	case 1:
	{
		[_msg,(_player call getFullName),1,getPosWorld _player] remoteExec ["RRPClient_system_clientMessage",allPlayers select {_x call getSide == "cop"}];
		RRPClient_waiting_cop_calls pushBack [
			(_player call getFullName),
			(getPosWorld _player),
			_msg,
			serverTime,
			"",
			_player,
			0
		]; 
		publicVariable "RRPClient_waiting_cop_calls"; 
	};

	case 2:
	{
		[
			"AdminServer","","","",false,
			[
				[
					"Steam профиль",
					[
						format ["**Имя:** %1",(_player call getFullName)],
						format ["**Имеет вопрос**: %1",_msg],
						format ["**Находится на позиции**: %1",(mapGridPosition _player)],
						format ["**DB ID:** %1",(_player getVariable ["RRPDatabasePID",0])],
						format ["**TeamSpeak ID:** %1",(_player getVariable ["tsNickName",name _player])]
					] joinString "\n",
					"https://steamcommunity.com/profiles/" + getPlayerUID _player,
					"00FF00",false,"","",[],[]
				]
			]
		] call DiscordEmbedBuilder_fnc_buildSqf;

		[_msg,name _player,2,getposWorld _player] remoteExec ["RRPClient_system_clientMessage",0];
	};
	case 3:
	{
		[_msg,(_player call getFullName),5,getposWorld _player] remoteExec ["RRPClient_system_clientMessage",allPlayers select {_x call getSide == "med"}];
		RRPClient_waiting_med_calls pushBack [(_player call getFullName),(getPosWorld _player),_msg,serverTime,"",_player,0]; 
		publicVariable "RRPClient_waiting_med_calls"; 
	};
	case 4:
	{
		_to = call compile format ["%1", _target];
		if(isNull _to) exitWith {};

		[_msg,(_player call getFullName),3] remoteExec ["RRPClient_system_clientMessage",_to];
	};
	case 5:
	{
		[_msg,(_player call getFullName),4] remoteExec ["RRPClient_system_clientMessage",0];
	};
	case 6:
	{
		[_msg,(_player call getFullName),6] remoteExec ["RRPClient_system_clientMessage",0];
	};

	case 7:
	{
		[_msg,(_player call getFullName),7] remoteExec ["RRPClient_system_clientMessage",0];
	};

	case 8:
	{
		[_msg,(_player call getFullName),8,getposWorld _player] remoteExec ["RRPClient_system_clientMessage",0];
	};
	case 9:
	{
		[_msg,(_player call getFullName),9] remoteExec ["RRPClient_system_clientMessage",0];
	};
};
