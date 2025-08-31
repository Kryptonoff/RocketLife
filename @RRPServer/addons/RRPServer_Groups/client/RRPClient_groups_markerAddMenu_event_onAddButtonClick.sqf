/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_control", "_iconCombo", "_colorCombo", "_textControl", "_textSizeControl", "_iconSizeControl", "_ctrlText", "_marker", "_maxChars", "_alphabet", "_forbiddenCharacter", "_color", "_maxAmountOfMarkers", "_renderArray"];
_control = uiNamespace getVariable ['RscMapCreateMenu', controlNull];
if!(isNull _control)then
{
	_iconCombo = _control controlsGroupCtrl 4001;
	_colorCombo = _control controlsGroupCtrl 4002;
	_textControl = _control controlsGroupCtrl 4000;
	_textSizeControl  = _control controlsGroupCtrl 4005;
	_iconSizeControl = _control controlsGroupCtrl 4004;
	_ctrlText = ctrlText _textControl;
	_marker = _iconCombo lbPictureRight (lbCursel _iconCombo);
	if((_ctrlText isEqualTo "") && ((_marker isEqualTo "a3\ui_f\data\map\markers\system\dummy_ca.paa") || {_marker isEqualTo ""})) exitWith {};
	if(RRPClientMapPositionClick isEqualTo [0,0])exitWith{};
	try
	{
		_maxChars = getNumber (missionConfigFile >> "CfgGroups" >> "maximumIconText");
		if (count (toArray _ctrlText) > _maxChars) throw format ["Вы превысили допустимый лимит символов в маркере, максимум %1",_maxChars];
		_alphabet = getText (missionConfigFile >> "CfgGroups" >> "allowAlphabet");
		_forbiddenCharacter = [_ctrlText, _alphabet] call RRPClient_util_containsForbiddenCharacter;
		if !(_forbiddenCharacter isEqualTo -1) throw "Ошибка, возможно были использованы запрещенные символы";
		_color = _colorCombo lbColor (lbCursel _colorCombo);
		if !((count _color) isEqualTo 4) throw "Что-то пошло не так, попробуйте еще раз!";
		if !((count RRPClientMapPositionClick) isEqualTo 2) throw "Что-то пошло не так, попробуйте еще раз!";
		_maxAmountOfMarkers = getNumber(missionConfigFile >> "CfgGroups" >> "maximumIcons");
		if ((count (RRPClientGroupInfo get "markers")) >= _maxAmountOfMarkers) throw "Вы достигли максимального количества маркеров на карте!";
		_renderArray =
		[
			_marker,
			_color,
			RRPClientMapPositionClick,
			sliderPosition _iconSizeControl,
			_ctrlText,
			sliderPosition _textSizeControl
		];
		["addMarkerRequest", _renderArray] call RRPClient_system_send;
		_control call RRPClient_groups_markerAddMenu_event_onUnload;
	}
	catch
	{
		["ErrorTitleAndText", ["Организация", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	};
};
true
