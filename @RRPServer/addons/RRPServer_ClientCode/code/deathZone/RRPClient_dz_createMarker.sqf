/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/
private _forDelete = [];
{
  private _curSessionID = _x param [3,-1,[0]];
  if !(_curSessionID isEqualTo RRPPublicSessionID) then {
    _forDelete pushBack _x;
  } else {
    private _markerName = _x param [0,"",[""]];
    private _markerPos = _x param [1,[],[[]]];

    private _radius = createMarkerLocal [("death_marker_" + _markerName),_markerPos];
    _radius setMarkerShapeLocal "ELLIPSE";
    _radius setMarkerSizeLocal [500,500];
    _radius setMarkerBrushLocal "Solid";
    _radius setMarkerColorLocal "ColorBlack";

    private _markerIcon = createMarkerLocal [("death_warn_" + _markerName), _markerPos];
    _markerIcon setMarkerColorLocal "ColorWhite";
    _markerIcon setMarkerTypeLocal "KIA";
  };
} forEach life_death_markers;

if !(_forDelete isEqualTo []) then {
  _forDelete call RRPClient_dz_deathZoneDelete;
};
