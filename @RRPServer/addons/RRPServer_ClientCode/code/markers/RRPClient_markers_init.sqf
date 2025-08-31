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
private ["_mod","_display","_ctrBackGround","_ctrFrame","_idc","_allMarkersCategory","_idc","_name","_ctrSlider","_allMapMarkers","_markersSize","_prefix","_ctrlBtn","_ctrlImg","_Ycoord","_numberCtrls"];
disableSerialization;

if ((call life_adminlevel) > 0) then {RRPClient_debug_ctrlList = []};
_idc = 1230;
_display = findDisplay 12;

_allMarkersCategory = "true" configClasses (missionConfigFile >> "RRPConfig_mapMarkers" >> "markers_category");

_ctrBackGround = _display ctrlCreate ["RRP_background",1231];
_ctrFrame = _display ctrlCreate ["RscFrame",1232];

_ctrSlider = _display ctrlCreate ["RscXSliderH",_idc];
_ctrSlider sliderSetRange [0.4, 1];
_ctrSlider sliderSetSpeed [0.05, 0.1];
_ctrSlider ctrlSetEventHandler ["SliderPosChanged", "_this call RRPClient_markers_changeSize"];
_ctrSlider ctrlSetTooltip "Размер меркеров";

_allMapMarkers = allMapMarkers;
_markersSize = profileNamespace getVariable ["rrp_markers_Size",-1];
if (_markersSize isEqualTo -1) then {
  profileNamespace setVariable ["rrp_markers_Size",0.5];
  _markersSize = 0.5;
};

_ctrSlider sliderSetPosition _markersSize;
{
  if !((_x in (getArray(missionConfigFile >> "RRPConfig_mapMarkers" >> "List_IgnorChangeSize"))) or (["other_drawToMap_",_x] call RRPClient_util_xString) or (["war_zone_",_x] call RRPClient_util_xString) or (["death_marker_",_x] call RRPClient_util_xString)) then {
    _x setMarkerSizeLocal [_markersSize,_markersSize];
    _x setMarkerDirLocal 0;
  };
} forEach _allMapMarkers;

_Ycoord= 0.95;
_numberCtrls = 0;
_idc = 1232;
{
  _name   = getText (_x >> "name");
  _prefix = configName _x;

  _mod = (profileNamespace getVariable [format ["rrp_markers_alpha_%1",_prefix],-1]);
  if (_mod isEqualTo -1) then {
    profileNamespace setVariable [format ["rrp_markers_alpha_%1",_prefix],1];
    _mod = 1;
  };

  _idc = _idc + 1;
 _ctrlImg = _display ctrlCreate ["RscPictureKeepAspect",_idc];
 _ctrlImg ctrlSetText getText (_x >> if (_mod isEqualTo 1) then {"icon_on"} else {"icon_off"});
 _ctrlImg ctrlSetPosition [0.00499998 * safezoneW + safezoneX,_Ycoord * safezoneH + safezoneY,0.014 * safezoneW,0.044 * safezoneH];
 _ctrlImg ctrlCommit 0;
 if (_prefix isEqualTo "all") then {RRPClient_markers_idc = _idc};

 _idc = _idc + 1;
 _ctrlBtn = _display ctrlCreate ["RscPictureButtonMenu",_idc];
 _ctrlBtn ctrlSetText "";
 _ctrlBtn ctrlSetPosition [0.00499998 * safezoneW + safezoneX,_Ycoord * safezoneH + safezoneY,0.014 * safezoneW,0.044 * safezoneH];
 _ctrlBtn ctrlCommit 0;
 _ctrlBtn buttonSetAction format ["['%1',%2] call RRPClient_markers_switch;",_prefix,(_idc - 1)];
 _ctrlBtn ctrlSetTooltip _name;

 _numberCtrls = _numberCtrls + 1;
 _Ycoord = _Ycoord - 0.04;

  if ((call life_adminlevel) > 0) then {
  RRPClient_debug_ctrlList pushBack _ctrlImg;
  RRPClient_debug_ctrlList pushBack _ctrlBtn;
  };

  {
    if (([_prefix,_x] call RRPClient_util_xString) or ((_prefix isEqualTo "all") and (_mod isEqualTo 0)) ) then {
      if !(_x in (getArray(missionConfigFile >> "RRPConfig_mapMarkers" >> "List_IgnorChangeAlpha")) OR (["death_marker_",_x] call RRPClient_util_xString)) then {

        if (_x isEqualTo getText(missionConfigFile >> "LifeCfgSettings" >> "zone_for_beginners")) then {
            _x setMarkerAlphaLocal 0.3;
        } else {
            _x setMarkerAlphaLocal _mod;
        };

      };
    };
  } forEach _allMapMarkers;

} forEach _allMarkersCategory;
saveProfileNamespace;

_ctrBackGround ctrlSetPosition [0.00205 * safezoneW + safezoneX,(_Ycoord + 0.04) * safezoneH + safezoneY,0.020 * safezoneW,(0.0405 * _numberCtrls) * safezoneH];
_ctrBackGround ctrlCommit 0;

_ctrFrame ctrlSetPosition [0.00205 * safezoneW + safezoneX,(_Ycoord + 0.04) * safezoneH + safezoneY,0.020 * safezoneW,(0.0405 * _numberCtrls) * safezoneH];
_ctrFrame ctrlCommit 0;

_ctrSlider ctrlSetPosition [0.00205 * safezoneW + safezoneX,(_Ycoord + 0.02) * safezoneH + safezoneY,0.020 * safezoneW,0.015 * safezoneH];
_ctrSlider ctrlCommit 0;

if ((call life_adminlevel) > 0) then {
RRPClient_debug_ctrlList pushBack _ctrBackGround;
RRPClient_debug_ctrlList pushBack _ctrFrame;
RRPClient_debug_ctrlList pushBack _ctrSlider};
