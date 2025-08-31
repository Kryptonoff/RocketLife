/* #Razyty
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2300,"group",[0,"",[1.3125,-0.28,0.3625,0.52],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1000,"background",[2300,"",[0,0.06,0.3625,0.46],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[-1100,"text",[2300,"Marker settings",[0,0,0.362499,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"markerText",[2300,"Select marker:",[0.0125,0.08,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"markerCombo",[2300,"",[0.0125,0.14,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1900,"bSlider",[2300,"",[0.0625,0.4,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"bText",[2300,"B",[0.0125,0.4,0.0375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1901,"gSlider",[2300,"",[0.0625,0.34,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"gText",[2300,"G",[0.0125,0.34,0.0375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1902,"rSlider",[2300,"",[0.0625,0.28,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1106,"rText",[2300,"R",[0.0125,0.28,0.0375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"aText",[2300,"A",[0.0125,0.46,0.0375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1903,"aSlider",[2300,"",[0.0625,0.46,0.2875,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"exampleText",[2300,"Example",[0.0125,0.2,0.3375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

private ["_display","_group","_background","_title","_markerText","_markerList","_colorText","_colorList","_button","_sizeText","_slider","_cur","_name","_picture","_index"];

disableSerialization;
waitUntil {!isNull (findDisplay 12)};
private _display = findDisplay 12;
private _group = _display ctrlCreate ["RscControlsGroupNoScrollbars",63000];
_group ctrlSetPosition [0,0,0.3625,0.52];

private _background = _display ctrlCreate ["RRP_background", 63001,_group];
_background ctrlSetPosition [0,0.06,0.3625,0.46];
_background ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", 63002,_group];
_title ctrlSetStructuredText parseText "<t align='center' size='1.5' font='RobotoCondensedBold' >Настройка цветов</t>";
_title ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_title ctrlSetPosition [0,0,0.362499,0.06];
_title ctrlCommit 0;

_vText = [_group,63003,[0.0125,0.08,0.3375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_vText ctrlSetStructuredText parseText "Выберите настройку:";
_vList = [_group,63005,[0.0125,0.14,0.3375,0.04],"RRP_RscCombo"] call RRPClient_gui_util_makeCustom;
_vList ctrlAddEventHandler ["LBSelChanged",{['var',_this] call ((findDisplay 46) getVariable ["ColorChangeSliderFnc",{}]) }];

_colorText = [_group,63004,[0.0125,0.2,0.3375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_colorText ctrlSetStructuredText parseText "<t align='center' size='1.3' font='RobotoCondensedBold' >Выберите цвет ниже</t>";

_rText = [_group,63008,[0.0125,0.28,0.0375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_rText ctrlSetStructuredText parseText "R";
_rSlider = [_group,63009,[0.0625,0.28,0.2875,0.04],"RRP_RscXSliderH"] call RRPClient_gui_util_makeCustom;
_rSlider ctrlAddEventHandler ["SliderPosChanged",{['r',_this] call ((findDisplay 46) getVariable ["ColorChangeSliderFnc",{}]) }];
_rSlider ctrlSetForegroundColor  [1,0,0,1];
_rSlider ctrlSetActiveColor  [1,0,0,1];
_rSlider sliderSetRange [0, 1];
_rSlider sliderSetSpeed [1/256, 1];

_gText = [_group,63010,[0.0125,0.34,0.0375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_gText ctrlSetStructuredText parseText "G";
_gSlider = [_group,63011,[0.0625,0.34,0.2875,0.04],"RRP_RscXSliderH"] call RRPClient_gui_util_makeCustom;
_gSlider ctrlAddEventHandler ["SliderPosChanged",{['g',_this] call ((findDisplay 46) getVariable ["ColorChangeSliderFnc",{}]) }];
_gSlider ctrlSetForegroundColor  [0,1,0,1];
_gSlider ctrlSetActiveColor  [0,1,0,1];
_gSlider sliderSetRange [0, 1];
_gSlider sliderSetSpeed [1/256, 1];

_bText = [_group,63012,[0.0125,0.4,0.0375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_bText ctrlSetStructuredText parseText "B";
_bSlider = [_group,63013,[0.0625,0.4,0.2875,0.04],"RRP_RscXSliderH"] call RRPClient_gui_util_makeCustom;
_bSlider ctrlAddEventHandler ["SliderPosChanged",{['b',_this] call ((findDisplay 46) getVariable ["ColorChangeSliderFnc",{}]) }];
_bSlider ctrlSetForegroundColor  [0.26,0.6,1,1];
_bSlider ctrlSetActiveColor  [0.26,0.6,1,1];
_bSlider sliderSetRange [0, 1];
_bSlider sliderSetSpeed [1/256, 1];

_aText = [_group,63014,[0.0125,0.46,0.0375,0.04],"RscStructuredText"] call RRPClient_gui_util_makeCustom;
_aText ctrlSetStructuredText parseText "A";
_aSlider = [_group,63015,[0.0625,0.46,0.2875,0.04],"RRP_RscXSliderH"] call RRPClient_gui_util_makeCustom;
_aSlider ctrlAddEventHandler ["SliderPosChanged",{['a',_this] call ((findDisplay 46) getVariable ["ColorChangeSliderFnc",{}]) }];
_aSlider ctrlSetForegroundColor  [1,1,1,1];
_aSlider ctrlSetActiveColor  [1,1,1,1];
_aSlider sliderSetRange [0.5,  1];
_aSlider sliderSetSpeed [1/256, 1];

_group ctrlCommit 0;

[_title,_group,"ColorsPos"] call RRPClient_gui_util_extendedUI;

_config = [configFile >> "CfgLifeColors",getMissionConfig "CfgLifeColors"] select (isClass(missionConfigFile >> "CfgLifeColors"));

(findDisplay 46) setVariable ["ColorChangeSliderFnc",
{
	private ["_config","_listbox","_index","_var","_conf","_v"];
	params ["_t","_c"];
	_config = [configFile >> "CfgLifeColors",getMissionConfig "CfgLifeColors"] select (isClass(missionConfigFile >> "CfgLifeColors"));


	private _defaultColors = {
		private _var = _this;
		private _conf = format ["getText(_x >> 'variable') == %1",_var] configClasses _config; 
		getArray(_conf#0 >> "defaultColors")
	};


	switch (_t) do
	{
		case "var":{
			_listbox = _c select 0;
			_index = _c select 1;
			_var = _listbox lbData _index;
			_v = profileNamespace getVariable [_var,_var call _defaultColors];

			(findDisplay 46) setVariable ["selVal",_var];
			_v params ["_r","_g","_b","_a"];
			((findDisplay 12) displayCtrl 63009) sliderSetPosition _r;
			((findDisplay 12) displayCtrl 63011) sliderSetPosition _g;
			((findDisplay 12) displayCtrl 63013) sliderSetPosition _b;
			((findDisplay 12) displayCtrl 63015) sliderSetPosition _a;
			break;
		};
		case "r":{
			_var = (findDisplay 46) getVariable ["selVal",""];
			if (_var isEqualTo "") exitWith {};
			_v = profileNamespace getVariable [_var,[]];
			_v set [0,_c#1];
			profileNamespace setVariable [_var,_v];
			
		};
		case "g":{
			_var = (findDisplay 46) getVariable ["selVal",""];
			if (_var isEqualTo "") exitWith {};
			_v = profileNamespace getVariable [_var,[]];
			_v set [1,_c#1];
			profileNamespace setVariable [_var,_v];
			
		};
		case "b":{
			_var = (findDisplay 46) getVariable ["selVal",""];
			if (_var isEqualTo "") exitWith {};
			_v = profileNamespace getVariable [_var,[]];
			_v set [2,_c#1];
			profileNamespace setVariable [_var,_v];

		};
		case "a":{
			_var = (findDisplay 46) getVariable ["selVal",""];
			if (_var isEqualTo "") exitWith {};
			_v = profileNamespace getVariable [_var,[]];
			_v set [3,_c#1];
			profileNamespace setVariable [_var,_v];

		};
	};
	_var = (findDisplay 46) getVariable ["selVal",""];
	((findDisplay 12) displayCtrl 63004) ctrlSetTextColor (profileNamespace getVariable [_var,_var call _defaultColors]);
	saveProfileNamespace;
}];

private _validateVars = {
	params ["_var","_col"];
	private _v = profileNamespace getVariable _var;
	if (isNil "_v" or {!(count _v isEqualTo count _col)}) then 
	{
		profileNamespace setVariable [_var,_col];
	};
	{
		if (_x isEqualType "") then {
			(profileNamespace getVariable [_var,[]]) set [_forEachIndex,parseNumber(_x)];	
		};
	}forEach (profileNamespace getVariable [_var,[]]);
	saveProfileNamespace;
	true
};

{
	_name = getText(_x >> "displayName");
	_variable = getText(_x >> "variable");
	_defaultC = getArray(_x >> "defaultColors");
	[_variable,_defaultC] call _validateVars;
	_index = _vList lbAdd _name;
	_vList lbSetData [_index,_variable];
}forEach ("true" configClasses _config);
_vList lbSetCurSel 0;

true
