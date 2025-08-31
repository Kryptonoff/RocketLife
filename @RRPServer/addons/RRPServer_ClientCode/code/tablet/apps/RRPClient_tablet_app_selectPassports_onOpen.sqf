
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 35400;
private _page = _slide controlsGroupCtrl 35402;

_xPos = 0.005156;
_yPos = 0.011;
_side = player call getSide;
{
	if !([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then { continue };
	if !(isNull (_display getVariable [format["CTRL_%1",configName _x], controlNull])) then { continue };

	_ctrl = [_page, 35410 + _forEachIndex,[
		_xPos*safezoneW, _yPos*safezoneH, 0.19077 * safezoneW, 0.176 * safezoneH
	], getText(_x >> "image"),false, true ] call RRPClient_gui_util_makeStaticPicture;
	_display setVariable [format["CTRL_%1",configName _x],_ctrl];
	_ctrl setVariable ["image",configName _x];
	_ctrl ctrlSetTooltip (getText(_x >> "title"));
	_xPos = _xPos + 0.201082;
	if ((_forEachIndex + 1) % 2 == 0) then {
		_yPos = _yPos + 0.187;
		_xPos = 0.005156;
	};
	_ctrl ctrlAddEventHandler ["MouseButtonClick",{
		params ["_control"];
		_image = _control getVariable ["image",life_myPassportID];
		if (_image isEqualTo life_myPassportID) exitWith {};
		life_myPassportID = _image;
		[["life_myPassportID",life_myPassportID,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
		playSound "click";
	}];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgPassports"));
