//Example Usage: - This is only used to update the player that they have new rewards - if you add to their rewards via DB you could call this with their UID
//It would then notify and update their client rewards.
// From server to player "UID OF PLAYER" call ExileServer_system_rewards_updatePlayer;

 
private ["_playerUID", "_targetPlayerObject", "_targetSessionID", "_rewardsData", "_hasRewardsPlayer", "_targetUID", "_responseCode", "_bad"];
_playerUID = _this select 0;

try 
{	
	_targetPlayerObject = _playerUID call RRPClient_util_objectFromPlayerUID;
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
	
	[_targetSessionID, "hasRewardsResponse", [0,_rewardsData]] call RRPServer_system_sendTo;
}
catch
{
	_responseCode = _exception;
	[_bad, "hasRewardsResponse", [_responseCode, []]] call RRPServer_system_sendTo;
};
true