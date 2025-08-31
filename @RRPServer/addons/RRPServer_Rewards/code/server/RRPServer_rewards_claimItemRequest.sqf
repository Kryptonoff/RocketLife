
private ["_sessionID", "_parameters", "_itemClassName", "_containerType", "_containerNetID", "_playerObject", "_vehicleObject", "_rewardsData", "_index", "_current", "_amt", "_playerUID", "_logging", "_rewardsLogging", "_traderLog", "_responseCode"]; 
_sessionID = _this select 0;
_parameters = _this select 1;
_itemClassName = _parameters select 0;
_containerType = _parameters select 1;
_containerNetID = _parameters select 2;
try 
{
	_playerObject = _sessionID call RRPServer_session_getPlayerObject;
	if (_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex",true];
	_vehicleObject = objNull;
	if (_containerType isEqualTo 2) then 
	{
		_vehicleObject = objectFromNetID(_containerNetID);
	};
	if (isNull _playerObject) throw 1;
	if !(alive _playerObject) throw 2;
	
	_rewardsData = _playerObject getVariable ["RRPClientPlayerRewards", []];
	
	_index = [_rewardsData,_itemClassName] call RRPServer_util_searchArray;
	
	if(_index == -1) throw 3;
	
	_current = _rewardsData select _index;
	_amt = (_current select 1)-1;
	if(_amt <= 0) then {
		_rewardsData deleteAt _index;
	} else {
		_rewardsData set [_index, [(_current select 0),_amt]];
	};
	
	_playerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	_playerUID = getPlayerUID _playerObject;
	format["setPlayerRewards:%1:%2", _rewardsData, _playerUID] call RRPServer_DB_fireAndForget;
	[_sessionID, "claimItemResponse", [0, _itemClassName, _containerType, _containerNetID,_rewardsData]] call RRPServer_system_sendTo;
	
	format ["insertRewardLog:%1:%2:%3:%4",_playerUID,_itemClassName,"take",1] call RRPServer_DB_fireAndForget;
}
catch 
{
	_responseCode = _exception;
	[_sessionID, "claimItemResponse", [_responseCode, "", 0, "",_rewardsData]] call RRPServer_system_sendTo;
};	
_playerObject setVariable ["ExileMutex",false];
true