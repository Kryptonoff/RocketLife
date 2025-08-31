
_time = diag_tickTime;
params ["_id", "_uid", "_name", "_jip", "_owner"];
private _exit = false;
if (_uid in ["", "__SERVER__", "__HEADLESS__", "__HC__"] or {toLower(_name) in ["hc1","headlessclient","hc","hc2"]}) then
{
	"Player Null or Headless connected" call RRPServer_util_debugConsole;
	_exit = true;
};

if _exit exitWith {true};

switch (true) do 
{
	case !(_owner > 2): 
	{
		format ["Player %1 Have mistake owner id %2 #1111",_name,_owner] call RRPServer_util_debugConsole;
		_exit = true;
	}; 
	case (_uid in ["", "__SERVER__", "__HEADLESS__", "__HC__"]): 
	{
		"Player Null or Headless connected #1111" call RRPServer_util_debugConsole;
		_exit = true;
	};
	/*
		case ([_name] call RRPClient_util_checkASCII): 
		{
			format["Player %1 (UID %2) have bad name! #1111", _name, _uid] call RRPServer_util_debugConsole;
			["BadProfileName",false,false] remoteExecCall ["BIS_fnc_endMission",_owner];
			_exit = true;
		};
		case !([_name] call RRPClient_system_checkName): 
		{
			format["Player %1 (UID %2) have wrong nickname! #1111", _name, _uid] call RRPServer_util_debugConsole;
			["BadProfileName2",false,false] remoteExecCall ["BIS_fnc_endMission",_owner];
			_exit = true;
		};
	*/
};

if _exit exitWith {true};

//-- Call on client
if (_owner > 2) then { [] remoteExecCall ["BIS_fnc_3den_onMissionStart",_owner] };

private _kick = {
	params [
		['_uid','',['']],
		['_owner',-10,[0]]
	];
	if(_owner > 2)then
	{
		_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_owner];
	}
	else
	{
		_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_uid];
	};
};

//-- Ban check function
private _bans = {
	//-- Check local ban
	private ["_uid","_baned","_baned2","_query","_mults"];
	_uid = _this;

	//-- Check hardware ban
	_baned2 = format["checkBan:%1",_uid] call RRPServer_DB_selectSingleField;
	format ["OnPlayerConnected - 2 Check ban %1 ? %2 #0111",_uid,_baned2] call RRPServer_util_debugConsole;
	if (_baned2) exitWith
	{
		//-- Call multiaccs
		_query = ["getMultiAccounts",[_uid]] call RRPServer_DB_createMessage;
		_mults = _query call RRPServer_DB_selectFull;
		
		if (count _mults > 1) then
		{
			//-- Send report about multiaccs in discord
			[_name,_uid,_mults] call sendMutiacsDiscord;
		};
		[_uid,_owner] call _kick;
		["Banned",false,false] remoteExecCall ["BIS_fnc_endMission",_owner];
	};
};


//-- msn variables
missionNameSpace setVariable [format['NAME_BY_UID_%1',_uid],_name];
missionNameSpace setVariable [format['UID_BY_OWNER_%1',_owner],_uid,true];

//-- Call check ban function
_uid call _bans;

//-- Check account in DB
private _hasAccount = format["hasAccount:%1",_uid] call RRPServer_DB_selectSingleField;
if !(_hasAccount) then
{
	//-- Create new player
	_name = [_name] call RRPServer_DB_mresString;
	format ["insertNewPlayer:%1:%2",_uid,_name] call RRPServer_DB_fireAndForget;
	format ["insertNewPlayerData:%1:%2",_uid,selectRandom(getArray(missionconfigFile >> "LifeCfgSettings" >> "startUniforms"))] call RRPServer_DB_fireAndForget;
}else{
	//-- Start session
	format ["startAccountSession:%1", _uid] call RRPServer_DB_fireAndForget;
};
//-- Check settings account
private _hasProfile = format["hasPlayerSettings:%1",_uid] call RRPServer_DB_selectSingleField;
if !(_hasProfile) then
{
	//-- Create settings account
	format ["insertPlayerSettings:%1",_uid] call RRPServer_DB_fireAndForget;
};
format ["OPC: Runtime: %1 sec | UID: %2 | NAME %3",diag_tickTime - _time,_uid,_name] call RRPServer_util_debugConsole;