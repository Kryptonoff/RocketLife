/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/
disableSerialization;
if(isNull (findDisplay 2900)) then {
	if !(createDialog "UnionDialogSettings") exitWith {};
};

private _display = findDisplay 2900;
ctrlSetText[2903, getText(missionConfigFile >> "LifeCfgPadSkins" >> life_myPadSkinID >> "image")];

ctrlSetText[2902, format["%1", life_viewDistanceFoot]];
ctrlSetText[2912, format["%1", life_viewDistanceCar]];
ctrlSetText[2922, format["%1", life_viewDistanceAir]];

slidersetRange [2901,100,2000];
slidersetRange [2911,100,2000];
slidersetRange [2921,100,5000];
{ (_display displayCtrl _x) sliderSetSpeed [50,50,100]; } foreach [2901,2911,2921];

{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,life_viewDistanceFoot],[2911,life_viewDistanceCar],[2921,life_viewDistanceAir]];

_display displayCtrl 2991 cbSetChecked enableTags;
_display displayCtrl 2992 cbSetChecked enableGrass;
_display displayCtrl 2993 cbSetChecked enableSoundAmbient;
_display displayCtrl 2994 cbSetChecked enableHUD;

private ["_colorSelect","_passSelect"];
_colorSelect = _display displayCtrl 2973;
_passSelect = _display displayCtrl 2977;

call RRPClient_system_padSkinConfig;
lbClear _colorSelect;
{
	if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then {
		_colorSelect lbAdd format["%1",getText(_x >> "title")];
		_colorSelect lbSetData [(lbSize _colorSelect)-1,configName _x];

		if (life_myPadSkinID isEqualTo (configName _x)) then {
			_colorSelect lbSetCurSel ((lbSize _colorSelect)-1);
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadSkins"));

call RRPClient_system_passportConfig;
lbClear _passSelect;
private _side = player call getSide;

{
	if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then {
		_passSelect lbAdd format["%1",getText(_x >> "title")];
		_passSelect lbSetData [(lbSize _passSelect)-1,configName _x];

		if (life_myPassportID isEqualTo (configName _x)) then {
			_passSelect lbSetCurSel ((lbSize _passSelect)-1);
		};
	};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgPassports"));

call RRPClient_ptags_settingList;
