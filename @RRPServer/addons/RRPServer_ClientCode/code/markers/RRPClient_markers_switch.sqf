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
params [["_prefix","",[""]],["_idc",-1,[1]]];

private _alpha = (profileNamespace getVariable format ["rrp_markers_alpha_%1",_prefix]);
_alpha= if (_alpha isEqualTo 1) then {0} else {1};


if (_prefix isEqualTo "all") then {
	private	["_prefixx", "_allMarkersCategory"];
	_allMarkersCategory = "true" configClasses (missionConfigFile >> "RRPConfig_mapMarkers" >> "markers_category");
	_idc = 1233;
	{
		_prefixx = configName _x;
		profileNamespace setVariable [format ["rrp_markers_alpha_%1",_prefixx],_alpha];
		((findDisplay 12) displayCtrl _idc) ctrlSetText getText (missionConfigFile >> "RRPConfig_mapMarkers"  >> "markers_category" >>  _prefixx >> (if (_alpha isEqualTo 1) then {"icon_on"} else {"icon_off"}));
			_idc = _idc + 2;
	} forEach _allMarkersCategory;
} else {
	profileNamespace setVariable [format ["rrp_markers_alpha_%1",_prefix],_alpha];

	((findDisplay 12) displayCtrl _idc) ctrlSetText getText (missionConfigFile >> "RRPConfig_mapMarkers"  >> "markers_category" >>  _prefix >> (if (_alpha isEqualTo 1) then {"icon_on"} else {"icon_off"}));
	if ((profileNamespace getVariable ["rrp_markers_alpha_all",-1] isEqualTo 0) and (_alpha isEqualTo 1)) then {
		profileNamespace setVariable ["rrp_markers_alpha_all",1];
		((findDisplay 12) displayCtrl RRPClient_markers_idc) ctrlSetText (getText (missionConfigFile >> "RRPConfig_mapMarkers"  >> "markers_category" >>  "all" >> "icon_on"));
	};
};

{
	if (([_prefix,_x] call RRPClient_util_xString) or (_prefix isEqualTo "all")) then {
		if (!(_x in (getArray(missionConfigFile >> "RRPConfig_mapMarkers" >> "List_IgnorChangeAlpha"))) AND !(_x isEqualTo getText(missionConfigFile >> "LifeCfgSettings" >> "zone_for_beginners"))) then {
			_x setMarkerAlphaLocal _alpha;
		};
	};
} forEach allMapMarkers;

saveProfileNamespace;
