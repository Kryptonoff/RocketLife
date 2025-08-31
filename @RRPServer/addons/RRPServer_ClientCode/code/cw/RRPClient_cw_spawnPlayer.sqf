/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private _spawnPos = getMarkerPos  "C_R";
player setPosATL _spawnPos;

call RRPClient_cw_createMarker;
[20] call RRPClient_cw_createGarbage;
[] spawn RRPClient_cw_action;
