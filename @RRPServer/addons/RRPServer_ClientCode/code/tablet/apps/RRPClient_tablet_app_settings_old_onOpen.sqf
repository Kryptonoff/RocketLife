
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 35000;

ctrlSetText[35006, format["%1", life_viewDistanceFoot]];
ctrlSetText[35008, format["%1", life_viewDistanceCar]];
ctrlSetText[35010, format["%1", life_viewDistanceAir]];

slidersetRange [35005,100,2000];
slidersetRange [35007,100,2000];
slidersetRange [35009,100,5000];
{ (_slide controlsGroupCtrl _x) sliderSetSpeed [50,50,100]; } foreach [35007,35005,35009];

{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [
	[35005,life_viewDistanceFoot],
	[35007,life_viewDistanceCar],
	[35009,life_viewDistanceAir]];


((_slide controlsGroupCtrl 35012) getVariable ["Toggle",controlNull]) cbSetChecked enableTags;[(_slide controlsGroupCtrl 35012), enableTags] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35014) getVariable ["Toggle",controlNull]) cbSetChecked enableGrass;[(_slide controlsGroupCtrl 35014), enableGrass] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35016) getVariable ["Toggle",controlNull]) cbSetChecked enableSoundAmbient;[(_slide controlsGroupCtrl 35016), enableSoundAmbient] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35018) getVariable ["Toggle",controlNull]) cbSetChecked enableHUD;[(_slide controlsGroupCtrl 35018), enableHUD] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35028) getVariable ["Toggle",controlNull]) cbSetChecked openApp;[(_slide controlsGroupCtrl 35028), openApp] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35030) getVariable ["Toggle",controlNull]) cbSetChecked life_saveBind;[(_slide controlsGroupCtrl 35030), life_saveBind] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35032) getVariable ["Toggle",controlNull]) cbSetChecked life_showWeaponHud;[(_slide controlsGroupCtrl 35032), life_showWeaponHud] call RRPClient_tablet_toggle;
((_slide controlsGroupCtrl 35034) getVariable ["Toggle",controlNull]) cbSetChecked life_showCaseTimer;[(_slide controlsGroupCtrl 35034), life_showCaseTimer] call RRPClient_tablet_toggle;

private ["_colorSelect","_passSelect"];
_colorSelect = _slide controlsGroupCtrl 35020;
_passSelect =  _slide controlsGroupCtrl 35022;

call RRPClient_system_padSkinConfig;
lbClear _colorSelect;
{
	_index = _colorSelect lbAdd format["%1",getText(_x >> "displayName")];
	_colorSelect lbSetData [(lbSize _colorSelect)-1,configName _x];

	if (life_myPadSkinID isEqualTo (configName _x)) then 
	{
		_colorSelect lbSetCurSel ((lbSize _colorSelect)-1);
	};

} forEach ("true" configClasses (missionConfigFile >> "CfgWallpaper"));

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