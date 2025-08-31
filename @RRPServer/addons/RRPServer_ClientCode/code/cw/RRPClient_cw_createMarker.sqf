/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ["_radiusZone","_posZone","_marker_name_1","_marker_name_2","_marker_name_3"];

_radiusZone = getNumber(missionConfigFile >> "LifeCfgSettings" >> "radiusCW");
_posZone = (getMarkerPos (getText(missionConfigFile >> "LifeCfgSettings" >> "startMarkerCW")));
_marker_name_1 = getText(missionConfigFile >> "LifeCfgSettings" >> "MarkerCW_1");
_marker_name_2 = getText(missionConfigFile >> "LifeCfgSettings" >> "MarkerCW_2");
_marker_name_3 = getText(missionConfigFile >> "LifeCfgSettings" >> "MarkerCW_3");


createMarkerLocal [_marker_name_1,_posZone];
_marker_name_1 setMarkerShapeLocal "ELLIPSE";
_marker_name_1 setMarkerBrushLocal "BDiagonal";
_marker_name_1 setMarkerSizeLocal [_radiusZone,_radiusZone];
_marker_name_1 setMarkerColorLocal "ColorBlue";
_marker_name_1 setMarkerAlphaLocal 1;

createMarkerLocal [_marker_name_2,_posZone];
_marker_name_2 setMarkerTypeLocal "mil_objective";
_marker_name_2 setMarkerTextLocal "Территория исправительных работ";


createMarkerLocal [_marker_name_3,(getPosATL garbage_container_1)];
_marker_name_3 setMarkerColorLocal "ColorBlue";
_marker_name_3 setMarkerTypeLocal "mil_start";
_marker_name_3 setMarkerTextLocal "Пункт сдачи мусора";
