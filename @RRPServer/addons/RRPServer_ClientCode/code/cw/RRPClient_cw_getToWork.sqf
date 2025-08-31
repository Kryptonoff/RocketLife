/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_count","_spawnPos"];
_count = param [0,0,[0]];

if (_count <= 0) exitWith {};
_spawnPos = getMarkerPos  "C_R";
player setPosATL _spawnPos;

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];

life_jail_coin = _count;
[25] call RRPClient_session_updatePartial;
call RRPClient_cw_createMarker;
[20] call RRPClient_cw_createGarbage;
[] spawn RRPClient_cw_action;
[(getPlayerUID player)] remoteExecCall ["RRPServer_ws_wantedRemove",2];
