/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private _newValue = _this select 1;

profileNamespace setVariable ["rrp_markers_Size",_newValue];
saveProfileNamespace;
{
	if !((_x in (getArray(missionConfigFile >> "RRPConfig_mapMarkers" >> "List_IgnorChangeSize"))) or (["other_drawToMap_",_x] call RRPClient_util_xString) or (["war_zone_",_x] call RRPClient_util_xString)) then {
		_x setMarkerSizeLocal [_newValue,_newValue];
	};
} forEach allMapMarkers;
