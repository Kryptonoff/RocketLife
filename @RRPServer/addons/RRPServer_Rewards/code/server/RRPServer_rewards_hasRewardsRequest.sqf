
private ["_sessionID", "_playerObject", "_rewardsData", "_hasRewardsPlayer", "_responseCode"];
_sessionID = _this select 0;

try 
{
	_playerObject = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _playerObject) throw "Пользователь не определен";
	_uid = getPlayerUID _playerObject;
	if (isNil "_uid") throw "UID?";
	if (_uid isEqualTo "") throw "UID??";
	
	_rewardsData = [];
	_hasRewardsPlayer = format["hasRewardsPlayer:%1", _uid] call RRPServer_DB_selectSingleField;
	
	if(_hasRewardsPlayer) then {
		_rewardsData = format["loadRewards:%1", _uid] call RRPServer_DB_selectSingle;
		_rewardsData = (_rewardsData select 0);
		_playerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
	} else {
	
		format["createRewards:%1:%2", _uid, []] call RRPServer_DB_insertSingle;
		_playerObject setVariable ["RRPClientPlayerRewards", _rewardsData];
		
	};
	
	[_sessionID, "hasRewardsResponse", [0,_rewardsData]] call RRPServer_system_sendTo;
}
catch
{
	_responseCode = _exception;
	[_sessionID, "hasRewardsResponse", [_responseCode, []]] call RRPServer_system_sendTo;
};
true