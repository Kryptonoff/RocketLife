disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 35100;
private _page = _slide controlsGroupCtrl 35102;
private _background = _display displayCtrl 1206; 
_xPos = 0.005156;
_yPos = 0.011;

{
	if !(isNull (_display getVariable [format["CTRL_%1",configName _x], controlNull])) then { continue };

	_ctrl = [_page, 35110 + _forEachIndex,[
		_xPos*safezoneW, _yPos*safezoneH, 0.0515595 * safezoneW, 0.077 * safezoneH
	], getText(_x >> "path"),true, true ] call RRPClient_gui_util_makeStaticPicture;
	_display setVariable [format["CTRL_%1",configName _x],_ctrl];
	_ctrl setVariable ["image",configName _x];
	_xPos = _xPos + 0.056715;
	if ((_forEachIndex + 1) % 7 == 0) then {
		_yPos = _yPos + 0.088;
		_xPos = 0.005156;
	};
	_ctrl ctrlAddEventHandler ["MouseButtonClick",{
		params ["_control"];
		private _display = ctrlParent _control;
		private _background = _display displayCtrl 1206; 
		_image = _control getVariable ["image",life_myPadSkinID];
		if (_image isEqualTo life_myPadSkinID) exitWith {};
		life_myPadSkinID = _image;
		_background ctrlSetText (getText(getMissionConfig "CfgWallpaper" >> _image >> "path"));
		playSound "click";
		[["life_myPadSkinID",life_myPadSkinID,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
	}];

} forEach ("true" configClasses (missionConfigFile >> "CfgWallpaper"));
