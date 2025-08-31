
private ["_sessionID", "_parameters", "_itemClassName", "_amount", "_playerObject", "_rewardsData", "_index", "_playerUID", "_playerRespect", "_playerMoney", "_logging", "_rewardsLogging", "_traderLog", "_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_itemClassName = _parameters select 0;
_amount = _parameters select 1;

try 
{
	_playerObject = _sessionID call RRPServer_session_getPlayerObject;
	if (_playerObject getVariable ["ExileMutex",false]) throw 12;
	_playerObject setVariable ["ExileMutex",true];
	if (isNull _playerObject) throw 1;
	if !(alive _playerObject) throw 2;
	
	_rewardsData = _playerObject getVariable ["RRPClientPlayerRewards", []];
	_index = [_rewardsData,_itemClassName] call RRPServer_util_searchArray;
	if (_index == -1) throw 3;
	call {
		if (_itemClassName == "RRPAtm") exitWith {[_playerObject,"atm","add",_amount] call RRPServer_system_moneyChange};
		if (_itemClassName == "Points") exitWith {[_playerObject,"point","pointsToAdd_ifbk2",_amount] call RRPServer_system_moneyChange};
		if (_itemClassName == "RRPTRX") exitWith {[_playerObject,"trx","add",_amount] call RRPServer_system_moneyChange};
	};
	_rewardsData deleteAt _index;
	_playerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	_playerUID = getPlayerUID _playerObject;
	format ["insertRewardLog:%1:%2:%3:%4",_playerUID,_itemClassName,"take",_amount] call RRPServer_DB_fireAndForget;
	format["setPlayerRewards:%1:%2", _rewardsData, _playerUID] call RRPServer_DB_fireAndForget;
	[_sessionID, "claimTabsResponse", [0, _itemClassName, _amount,_rewardsData]] call RRPServer_system_sendTo;
}
catch 
{
	_responseCode = _exception;
	[_sessionID, "claimTabsResponse", [_responseCode, "", 0,_rewardsData]] call RRPServer_system_sendTo;
};	
_playerObject setVariable ["ExileMutex",false];
true
