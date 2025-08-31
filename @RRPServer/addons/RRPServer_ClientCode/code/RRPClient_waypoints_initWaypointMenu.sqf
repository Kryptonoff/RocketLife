/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: FairyTale#5571
*/
/* #Fybyfo
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2300,"group",[0,"",[0.4625,0.1,0.3625,0.52],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1100,"text",[2300,"Marker settings",[0,0,0.362499,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"background",[2300,"",[0,0.06,0.3625,0.46],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"markerText",[2300,"Select marker:",[0.0125,0.08,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"markerCombo",[2300,"",[0.0125,0.14,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"colorText",[2300,"Select color:",[0.0125,0.2,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2101,"colorCombo",[2300,"",[0.0125,0.26,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"sizeText",[2300,"Select size:",[0.0125,0.32,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1900,"sizeSlider",[2300,"",[0.0125,0.38,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"DeleteAll",[2300,"delete all",[0.0125,0.44,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

private ["_display","_group","_background","_title","_markerText","_markerList","_colorText","_colorList","_button","_sizeText","_slider","_cur","_name","_picture","_index"];

disableSerialization;
private _display = findDisplay 12;
private _group = _display ctrlCreate ["RscControlsGroupNoScrollbars",62000];
_group ctrlSetPosition [0.4625,0.1,0.3625,0.52];

private _background = _display ctrlCreate ["RRP_background", 62001,_group];
_background ctrlSetPosition [0,0.06,0.3625,0.46];
_background ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", 62002,_group];
_title ctrlSetStructuredText parseText "<t align='center' size='1.5' font='RobotoCondensedBold' >Настройка маркера</t>";
_title ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_title ctrlSetPosition [0,0,0.362499,0.06];
_title ctrlCommit 0;

_markerText = [_group,62003,[0.0125,0.08,0.3375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_markerText ctrlSetStructuredText parseText "Выберите маркер:";
_markerList = [_group,62005,[0.0125,0.14,0.3375,0.04],"RRP_RscCombo"] call RRPClient_gui_util_makeCustom;
_markerList ctrlAddEventHandler ["LBSelChanged",{['marker',_this] call RRPClient_waypoints_onLbSelection}];

_colorText = [_group,62004,[0.0125,0.2,0.3375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_colorText ctrlSetStructuredText parseText "Выберите цвет:";
_colorList = [_group,62006,[0.0125,0.26,0.3375,0.04],"RRP_RscCombo"] call RRPClient_gui_util_makeCustom;
_colorList ctrlAddEventHandler ["LBSelChanged",{['color',_this] call RRPClient_waypoints_onLbSelection}];

private _button = _display ctrlCreate ["RRP_btn_blue", 62007,_group]; 
_button ctrlSetText "Удалить все маркеры"; 
_button ctrlSetPosition [0.0125,0.44,0.3375,0.06]; 
_button buttonSetAction "SmartClientWaypoints = [];profileNamespace setVariable ['PRNS_Waypoints',[]];saveProfileNamespace;";
_button ctrlCommit 0;

_sizeText = [_group,62008,[0.0125,0.32,0.3375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_sizeText ctrlSetStructuredText parseText "Установите размер:";
_slider = [_group,62009,[0.0125,0.38,0.3375,0.04],"RRP_RscXSliderH"] call RRPClient_gui_util_makeCustom;
_slider ctrlAddEventHandler ["SliderPosChanged",{['size',_this] call RRPClient_waypoints_onLbSelection}];
_group ctrlCommit 0;

[_title,_group,"e4tswy45"] call RRPClient_gui_util_extendedUI;

_cur = 0;
{
	_name = getText(_x >> "displayName");
	_picture = getText(_x >> "fileName");
	_index = _markerList lbAdd _name;
	_markerList lbSetPictureRight [_index,_picture];
	_markerList lbSetData [_index,_picture];
	if (_picture isEqualTo (profileNameSpace getVariable ["PRNS_WaypointPic","\a3\ui_f\data\Map\MapControl\custommark_CA.paa"])) then {_cur = _forEachIndex};
}forEach ("true" configClasses (getMissionConfig "CfgWaypoints" >> "WaypoitnsMarkers"));
_markerList lbSetCurSel _cur;

_cur = 0;
{
	_name = getText(_x >> "displayName");
	_color = getArray(_x >> "colors");
	_index = _colorList lbAdd _name;
	_colorList lbSetColor [_index,_color];
	_colorList lbSetData [_index,str(_color)];
	if (_color isEqualTo (profileNameSpace getVariable ["PRNS_WaypointColor",[0.5,0.5,0.5,1]])) then {_cur = _forEachIndex};
}forEach ("true" configClasses (getMissionConfig "CfgWaypoints" >> "WaypointsColors"));
_colorList lbSetCurSel _cur;

_slider sliderSetRange [0.01,1];
_slider sliderSetSpeed [0.05, 1];
_slider sliderSetPosition (profileNamespace getVariable ["PRNS_WaypointSize",0.65]);
true
