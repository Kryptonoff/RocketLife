/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

_house = _this;
_housePos = getPosATL _house;
life_vehicles pushBack _house;

life_houses pushBack [_housePos,typeOf _house];
life_houses_count = life_houses_count + 1;

life_netID_Houses pushBack (netID _house);

private _houseName = getText (configFile >> "CfgVehicles" >> typeOf _house >> "displayName");
private _markerID = round (_housePos select 0);
private _marker = createMarkerLocal [format["house_%1",_markerID],_housePos];
_marker setMarkerTextLocal format["%1",_houseName];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "loc_Lighthouse";