/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
*/
{
  private _markerName = _x # 0;
  deleteMarkerLocal ("death_marker_" + _markerName);
  deleteMarkerLocal ("death_warn_" + _markerName);
} forEach _this;

life_death_markers = (life_death_markers - _this);
[["life_death_markers",life_death_markers,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;

