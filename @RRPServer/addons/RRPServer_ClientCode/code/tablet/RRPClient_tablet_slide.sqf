#include <macros.hpp>

private["_toSlideName", "_direction", "_display", "_config", "_toSlideControlID", "_toSlideControl", "_toSlideTitle", "_titleControl", "_toSlideOpenFunction", "_fromSlideControlID", "_fromSlideControl", "_fromSlideCloseFunction"];
disableSerialization;
_toSlideName = _this select 0;
_direction = _this select 1;
if (RRPClientTabletCurrentSlide isNotEqualTo _toSlideName) then
{
	_display = uiNameSpace getVariable ["RRPDialogTablet", displayNull];
	_group = _display displayCtrl 24001;
	_config = missionConfigFile >> "CfgMainMenu" >> "Tabs" >> _toSlideName;
	_toSlideControlID = getNumber (_config >> "controlID");
	_toSlideControl = _group controlsGroupCtrl _toSlideControlID;
	if (isNull _toSlideControl) then {
		_toSlideControl = _display ctrlCreate [getText(_config >> "resource"),_toSlideControlID,_group];
	};

	_toSlideOpenFunction = missionNamespace getVariable [format ["RRPClient_tablet_app_%1_onOpen", _toSlideName], ""];
	private _statusCtrl = _display displayCtrl 25401;
	_statusCtrl ctrlSetStructuredText parseText format [STATUS_TEXT, getText(_config >> "name"), player call getNickFullName];
	if !(_toSlideOpenFunction isEqualTo "") then
	{
		call _toSlideOpenFunction;
	};

	_config = missionConfigFile >> "CfgMainMenu" >> "Tabs" >> RRPClientTabletCurrentSlide;
	_fromSlideControlID = getNumber (_config >> "controlID");
	_fromSlideControl = _display displayCtrl _fromSlideControlID;
	_fromSlideCloseFunction = missionNamespace getVariable [format ["RRPClient_tablet_app_%1_onClose", RRPClientTabletCurrentSlide], ""];
	if !(_fromSlideCloseFunction isEqualTo "") then
	{
		call _fromSlideCloseFunction;
	};

	_x = (0 * 0.05);
	_y = (0 * 0.05);
	_toSlide = 28;
	_fromSlide = -28;
	_commit = 0.25;
	playSound "AppJump";
	if (_direction isEqualTo 1) then
	{
		_toSlideControl ctrlSetPosition [(_toSlide * 0.05), _y];
		_toSlideControl ctrlShow true;
		_toSlideControl ctrlCommit 0;
		_toSlideControl ctrlSetPosition [_x, _y];
		_toSlideControl ctrlCommit _commit;
		_fromSlideControl ctrlSetPosition [(_fromSlide * 0.05), _y];
		_fromSlideControl ctrlCommit _commit;
	}
	else 
	{
		_toSlideControl ctrlSetPosition [(_fromSlide * 0.05), _y];
		_toSlideControl ctrlShow true;
		_toSlideControl ctrlCommit 0;
		_toSlideControl ctrlSetPosition [_x, _y];
		_toSlideControl ctrlCommit _commit;
		_fromSlideControl ctrlSetPosition [(_toSlide * 0.05), _y];
		_fromSlideControl ctrlCommit _commit;
	};
	RRPClientTabletCurrentSlide = _toSlideName;
};