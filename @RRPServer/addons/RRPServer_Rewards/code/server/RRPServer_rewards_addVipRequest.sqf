
private _sessionID = _this select 0;
private _parameters = _this select 1;
_parameters params ["_currentVIP","_newVIP"];
_playerObject = _sessionID call RRPServer_session_getPlayerObject;

try
{
	_playerObject = _sessionID call RRPServer_session_getPlayerObject;
	if (_playerObject getVariable ["ExileMutex",false]) throw 12;
	_playerObject setVariable ["ExileMutex",true];
	if (isNull _playerObject) throw 1;
	if !(alive _playerObject) throw 2;
	
	_rewardsData = _playerObject getVariable ["RRPClientPlayerRewards", []];
	_index = [_rewardsData,format["vip%1",_newVIP]] call RRPServer_util_searchArray;
	if (_index == -1) throw 3;
	_playerUID = getPlayerUID _playerObject;
	
	_current = _rewardsData select _index;
	_amount = (_current select 1);

	_rewardsData deleteAt _index;

	if (_currentVIP isEqualTo 0) then {
		format ["addVip:%1:%2:%3",_newVIP,_amount,_playerUID] call RRPServer_DB_fireAndForget;
	}else{
		format ["addDayVip:%1:%2",_amount, _playerUID] call RRPServer_DB_fireAndForget;
	};

	_playerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	format["setPlayerRewards:%1:%2", _rewardsData, _playerUID] call RRPServer_DB_fireAndForget;
	format ["insertRewardLog:%1:%2:%3:%4",_playerUID,_newVIP,"take",_amount] call RRPServer_DB_fireAndForget;
	[_sessionID, "claimVipResponse", [0,_newVIP,_rewardsData]] call RRPServer_system_sendTo;

}catch{
	_responseCode = _exception;
	[_sessionID, "claimVipResponse", [_responseCode,0,_rewardsData]] call RRPServer_system_sendTo;
};

_playerObject setVariable ["ExileMutex",false];
true
