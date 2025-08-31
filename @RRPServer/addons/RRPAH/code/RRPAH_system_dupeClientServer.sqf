/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params[["_option",-1],["_playerNetId","0:0"]];

_player = objectFromNetId _playerNetId;
if (isNull _player) exitWith {false};

_name = _player call RRPAH_util_getObjName;
_uid = getPlayerUID _player;
_owner = owner _player;
switch(_option)do
{
	case 0: {
		_log = toString (_this select 2);
		_log = format["%1 (%2) - %3",_name,_uid,_log];
		[_log,"DUPE_log"] call RRPServer_system_logIt;
		// [_log,{["ErrorTitleOnly", [_this]] call SmartClient_gui_toaster_addTemplateToast;},-2,false] call RRPAH_util_executeJIP;
	};
	case 1: {
		_log = toString(_this select 2);
		_log = format["%1 (%2) - %3",_name,_uid,_log];
		[_log,"DUPE_log"] call RRPServer_system_logIt;
		
		// [_log,{["ErrorTitleOnly", [_this]] call SmartClient_gui_toaster_addTemplateToast;},-2,false] call RRPAH_util_executeJIP;
		_log call fnc_add_hacklog;
	};
	case 2: {
		_container = objectFromNetId (_this select 2);
		_container setOwner (owner _player);
	};
	case 3: {
		params[["_option",-1],["_playerNetId","0:0"],["_xNetId","0:0"],["_netIDItem","0:0"],["_what",0]];
		
		_log = call {
			if(_what isEqualTo 1)exitWith{"BackPack removed (duped)"};
			if(_what isEqualTo 2)exitWith{"BackPack removed (duped)"};
			if(_what isEqualTo 3)exitWith{"BackPack removed (duped)"};
			""
		};
		_log = format["%1 (%2) - %3",_name,_uid,_log];

		_ownerid = _netIDItem select [0,_netIDItem find ":"];
		_ownerid = parseNumber _ownerid;
		_owneruid = missionNameSpace getVariable [format["UID_BY_OWNER_%1",_ownerid],""];
		if(_owneruid isEqualTo "")then
		{
			[format["%1 | netID: %2",_log,_netIDItem],"DUPE_log"] call RRPServer_system_logIt;
		}
		else
		{
			_ownername = missionNameSpace getVariable [format["NAME_BY_UID_%1",_owneruid],""];
			[format["%1 | netID: %2 | owned by %3(%4)",_log,_netIDItem,_ownername,_owneruid],"DUPE_log"] call RRPServer_system_logIt;
		};

		_this set[5,_log];
		[
			_this,
			{
				params[["_option",-1],["_playerNetId","0:0"],["_xNetId","0:0"],["_netIDItem","0:0"],["_what",0],["_log",""]];
				// ["ErrorTitleOnly", [_log]] call SmartClient_gui_toaster_addTemplateToast;

				{
					if (!isNull _x)then
					{
						if (_what isEqualTo 1) exitWith {removeBackpackGlobal _x;};
						if (_what isEqualTo 2) exitWith {removeVest _x;};
						if (_what isEqualTo 3) exitWith {removeUniform _x;};
					};
				} forEach [objectFromnetId _playerNetId,objectFromnetId _xNetId];
			},
			-2,
			false
		] call RRPAH_util_executeJIP;
	};
	default {false};
};
