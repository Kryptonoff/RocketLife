//Example Usage:
// From infistar to player ["addKitRequest", ["UID_OF_PLAYER_TARGET", "BaseObjectsWood"]] call RRPClient_system_send;

// From server to player ["__SERVER__", ["76561198055124016", "CurrencyKit"]] call RRPServer_rewards_addKitRequest;


 
private ["_sessionID", "_parameters", "_targetUID", "_kit", "_check", "_bad", "_player", "_allowedRewardGivers", "_playerObject", "_playerUID", "_targetPlayerObject", "_targetSessionID", "_rewardsData", "_hasRewardsPlayer", "_rewards", "_classname", "_index", "_current", "_amt", "_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetUID = _parameters select 0;
_kit = _parameters select 1;

try 
{	
	_check = getNumber(configFile >> "CfgRewards" >> "AllowedUIDS" >> "checkRewards");
	_bad = false;
	_player = false;
	if(_check isEqualTo 1) then {
		_allowedRewardGivers = getArray(configFile >> "CfgRewards" >> "AllowedUIDS" >> "AllowedRewardGivers");
		if (count _sessionID != 8) then {
			if(_sessionID in _allowedRewardGivers) then {
				diag_log format["REWARDS SERVER - %1 Added rewards to _targetUID %2",_sessionID,_targetUID];
				_player = false;
			} else {
				diag_log format["REWARDS SERVER - %1 tried to add rewards to _targetUID %2",_sessionID,_targetUID];
				_bad = true;
			};
		} else {
			//Player called the addKitRequest
			_playerObject = _sessionID call RRPServer_session_getPlayerObject;
			_playerUID = getPlayerUID _playerObject;
			if(_playerUID in _allowedRewardGivers) then {
				diag_log format["REWARDS SERVER - Player %1 Added rewards to _targetUID %2",_playerUID,_targetUID];
				_player = true;
			} else {
				diag_log format["REWARDS SERVER - Player %1 tried to add rewards to _targetUID %2",_playerUID,_targetUID];
				_bad = true;
			};
		};
	};
	
	if (_bad) throw 9999;
	
	
	_targetPlayerObject = _targetUID call RRPClient_util_objectFromPlayerUID;
	_targetSessionID = _targetPlayerObject getVariable ["SessionID", -1];
	
	_rewardsData = [];
	_hasRewardsPlayer = format["hasRewardsPlayer:%1", _targetUID] call RRPServer_DB_selectSingleField;
	
	if(_hasRewardsPlayer) then {
		_rewardsData = format["loadRewards:%1", _targetUID] call RRPServer_DB_selectSingle;
		_rewardsData = (_rewardsData select 0);
		_targetPlayerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	} else {
		format["createRewards:%1:%2", _targetUID, []] call RRPServer_DB_insertSingle;
		_targetPlayerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	};
	
	_rewards = getArray(missionConfigFile >> "RewardKits" >> _kit >> "items");
	
	
	{	
		if(typeName _x == "ARRAY") then {
			_classname = (_x select 0);
			if(count _rewardsData > 0) then {
				_index = [_rewardsData,_classname] call RRPServer_util_searchArray;
				if(_index != -1) then {
					_current = _rewardsData select _index;
					_amt = (_current select 1)+(_x select 1);
					_rewardsData set [_index, [(_current select 0),_amt]];
				} else {
					_rewardsData pushBack _x;
				};
			} else {
				_rewardsData pushBack _x;
			};
		} else {
			_classname = _x;
			if(count _rewardsData > 0) then {
				_index = [_rewardsData,_classname] call RRPServer_util_searchArray;
				if(_index != -1) then {
					_current = _rewardsData select _index;
					_amt = (_current select 1)+1;
					_rewardsData set [_index, [(_current select 0),_amt]];
				} else {
					_rewardsData pushBack [_x,1];
				};
			} else {
				_rewardsData pushBack [_x,1];
			};
		};
	} forEach _rewards;
	
	format["setPlayerRewards:%1:%2", _rewardsData, _targetUID] call RRPServer_DB_fireAndForget;
	_targetPlayerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	format ["insertRewardLog:%1:%2:%3:%4",_targetUID,_kit,"add",1] call RRPServer_DB_fireAndForget;
	[_targetSessionID, "hasRewardsResponse", [0,_rewardsData]] call RRPServer_system_sendTo;
}
catch
{
	_responseCode = _exception;
	if(_responseCode isEqualTo 9999) then {
		diag_log "REWARDS SERVER - Bad caller for rewards!";
	};
	[_bad, "hasRewardsResponse", [_responseCode, []]] call RRPServer_system_sendTo;
};
true