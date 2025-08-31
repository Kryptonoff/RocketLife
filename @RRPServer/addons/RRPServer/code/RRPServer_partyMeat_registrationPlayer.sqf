/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
params [
  ["_netID", "", [""]],
  ["_deposit", 0, [0]]
];

private ["_player","_pid","_isNewPLayer","_res"];
_player = objectFromNetId _netID;
_pid = getPlayerUID _player;


_res = format["isRegPartyMeat:%1",_pid] call RRPServer_DB_selectSingle;
_isNewPLayer = isNil{_res};
if (_isNewPLayer) then {
    format ["partyMeatRegAndStart:%1:%2:%3",_pid,_deposit,1] call RRPServer_DB_insertSingle;
    _res = [_pid,0,0,0,true,_deposit];
} else {
    format ["partyMeatStart:%1:%2:%3",_deposit,1,_pid] call RRPServer_DB_fireAndForget;
    _res set [5, _deposit];
};
_res remoteExecCall ["RRPClient_partymeat_startGaming",_player];
