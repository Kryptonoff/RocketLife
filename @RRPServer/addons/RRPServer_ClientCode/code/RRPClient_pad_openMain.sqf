disableSerialization;
if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {};
params
[
	["_mode",false,[false]]
];
createDialog "UnionDialogPadMain";
PostProcessingBackgroundBlur ppEffectAdjust [2];
PostProcessingBackgroundBlur ppEffectEnable true;
PostProcessingBackgroundBlur ppEffectCommit 0;


waitUntil {!isNull (findDisplay 2000)};
_display = findDisplay 2000;

private _buttons = [
	[2010,2011],
	[2012,2013],
	[2014,2015],
	[2016,2017],
	[2018,2019],
	[2020,2021],

	[2022,2023],
	[2024,2025],
	[2026,2027],
	[2028,2029],
	[2030,2031],
	[2032,2033],

	[2034,2035],
	[2036,2037],
	[2038,2039],
	[2040,2041],
	[2042,2043],
	[2044,2045]
];
{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

if (_mode) then
{
	[_display, 2001, ctrlPosition (_display displayCtrl 2001), 1, 0] call RRPClient_gui_util_animateCtrl;
	[_display, 2001, ctrlPosition (_display displayCtrl 2001), 0, 0.5] call RRPClient_gui_util_animateCtrl;
};
ctrlSetText [2001, (getText (missionConfigFile >> "LifeCfgPadSkins" >> life_myPadSkinID >> "image"))];

private ["_imageID","_buttonID"];
private _index = 0;
_time = 0.3;
{
	if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then {

		_imageID = _display displayCtrl ((_buttons select _index) select 0);
		_buttonID = _display displayCtrl ((_buttons select _index) select 1);

		_imageID ctrlSetText getText(_x >> "image");
		_buttonID ctrlSetTooltip (getText(_x >> "tooltip"));
		_buttonID buttonSetAction getText(_x >> "action");

		_imageID ctrlShow true;
		_buttonID ctrlShow true;

		if (_mode) then
		{
			[_display, ((_buttons select _index) select 0), ctrlPosition _imageID, 1, 0] call RRPClient_gui_util_animateCtrl;
			[_display, ((_buttons select _index) select 0), ctrlPosition _imageID, 0, _time + 0.025] call RRPClient_gui_util_animateCtrl;

			[_display, ((_buttons select _index) select 1), ctrlPosition _buttonID, 1, 0] call RRPClient_gui_util_animateCtrl;
			[_display, ((_buttons select _index) select 1), ctrlPosition _buttonID, 0, _time + 0.025] call RRPClient_gui_util_animateCtrl;
		};
		_index = _index + 1;
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadIcons"));
