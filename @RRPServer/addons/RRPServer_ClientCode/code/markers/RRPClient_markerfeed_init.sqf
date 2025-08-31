/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
private ["_scaleFactorCtrlH","_pH","_scaleFactorText","_txtSizeM","_fontM","_RRPClient_mapfeed_ExtendedUINormalizePos","_hintGroup"];

 _scaleFactorCtrlH = (getResolution select 1) / 1080;

 _pH = parseNumber(((pixelH * 5) * _scaleFactorCtrlH) toFixed 3);
 _scaleFactorText = 1 / (getResolution select 5);
 _txtSizeM = 0.65 * _scaleFactorText;
 _fontM = "RobotoCondensedLight";

 _RRPClient_mapfeed_ExtendedUINormalizePos = {
	params['_xP', '_yP', '_wP', '_hP'];
	_xP = _xP min(safeZoneWAbs + safeZoneX - _wP) max(safeZoneXAbs);
	_yP = _yP min(1 * safezoneH + safezoneY - _hP) max(0 * safezoneH + safezoneY);
	[_xP, _yP, _wP, _hP]
};

uiNamespace setVariable['RRPClient_mapfeed_ExtendedUINormalizePos', _RRPClient_mapfeed_ExtendedUINormalizePos];
_hintGroup = (findDisplay 12) ctrlCreate['RscControlsGroupNoScrollbars', 200];
_hintGroup ctrlSetPosition[0, 0, 0.14 * safeZoneW, 0.25 * safeZoneH];
_hintGroup setVariable['initialPosition', [0, 0, 0.14 * safeZoneW, 6 * _pH]];
_hintGroup ctrlCommit 0;
_hintGroup ctrlEnable false;


(ctrlPosition _hintGroup) params['_gX', '_gY', '_gW', '_gH'];
[_hintGroup, -1, [0, 0, _gW, 6 * _pH], '', "RobotoCondensedBold", _txtSizeM, "left", "#FFFFFF", "0", [0, 0, 0, 0.9]] call RRPClient_gui_util_makeStructuredText;
[_hintGroup, 201, [0, 0, _gW, 6 * _pH], "\A3\ui_f\data\igui\rsctitles\rscaannews\gradient_left_gs.paa", false, false, [0.1, 0.1, 0.1, 0.3], ""] call RRPClient_gui_util_makeStaticPicture;
[_hintGroup, 202, [0, 0, _gW, 6 * _pH], '', "RobotoCondensedBold", (0.65 * _scaleFactorText), "center", "#FFFFFF", "0", [0, 0, 0, 0]] call RRPClient_gui_util_makeStructuredText;
[_hintGroup, 203, [0, 6 * _pH, _gW, 6 * _pH], '', _fontM, (0.45 * _scaleFactorText), "center", "#FFFFFF", "0", [0, 0, 0, 0.75]] call RRPClient_gui_util_makeStructuredText;

evh_map_tooltip = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler['MouseMoving', {
	params['_ctrl'];
	private ["_display","_hintGroup","_targetData","_markerData","_textField","_markerColor","_index","_text","_textData"];

 	_display = ctrlParent _ctrl;
	_hintGroup = _display displayCtrl 200;
	_hintGroup ctrlSetFade 1;
	_hintGroup ctrlCommit 0;
	_targetData = ctrlMapMouseOver _ctrl;
	_targetData params[['_type', ''], ['_selectedMarker', '']];

	if !(_type isEqualTo 'marker') exitWith {};
	if (_selectedMarker isEqualTo '') exitWith {};
	if (_selectedMarker find "_USER_DEFINED" > -1) exitWith {};
	if ((markerAlpha _selectedMarker <= 0.1) or {markerText _selectedMarker isEqualTo ''}) exitWith {};

	 _markerData = call RRPClient_markerfeed_mapMarkerData;
	 _textField = _display displayCtrl 203;
	(_hintGroup getVariable ['initialPosition', []]) params['', '', '_gW', '_gH'];
	(getMousePosition) params['_mouseX', '_mouseY'];

	_hintGroup ctrlSetFade 0;
	_hintGroup ctrlSetPosition([_mouseX * 1.2, _mouseY * 1.2 - (ctrlTextHeight _textField), _gW, _gH + (ctrlTextHeight _textField)] call(uiNamespace getVariable['RRPClient_mapfeed_ExtendedUINormalizePos', {}]));
	_hintGroup ctrlCommit 0;

	_markerColor = (configfile >> "CfgMarkerColors" >> getMarkerColor _selectedMarker >> "color") call BIS_fnc_colorConfigToRGBA;
	_markerColor set [3, 0.75];
	if (getMarkerColor _selectedMarker isEqualTo "Default") then {_markerColor = [1, 1, 1, 0.5]};
	(_display displayCtrl 201) ctrlSetTextColor _markerColor;
	[_display displayCtrl 202,
		if (isLocalized markerText _selectedMarker) then {
			markerText _selectedMarker
		} else {
			markerText _selectedMarker
		}
	] call RRPClient_gui_util_updateStructuredText;

	_index = _markerData findIf {if (_x isEqualType '') then {(_selectedMarker find _x) > -1}};

	if (_index isEqualTo - 1) exitWith {
		_text = 'К этому маркеру нет описания, сообщите админу!';
		if ((call (life_adminlevel) > 0) and {!((getPlayerUID player) isEqualTo "76561197984276591")}) then
		{
			_text = _text + format["<br/><t align='center' color='#3B3B3B'>%1</t>", _selectedMarker];
		};

		[_textField, _text] call RRPClient_gui_util_updateStructuredText;
		(ctrlPosition _textField) params['_cX', '_cY', '_cW', ''];
		_textField ctrlSetPosition[_cX, _cY, _cW, ctrlTextHeight _textField];
		_textField ctrlCommit 0;
		nil
	};

	_textData = _markerData select(_index + 1);
	_textData = _textData joinString "<br/>";
	if ((call (life_adminlevel) > 0) and {!((getPlayerUID player) isEqualTo "76561197984276591")}) then
	{
		 _textData = _textData + format["<br/><t align='center' color='#3B3B3B'>%1</t>", _selectedMarker];
	};
	[_textField, _textData] call RRPClient_gui_util_updateStructuredText;
	(ctrlPosition _textField) params['_cX', '_cY', '_cW', ''];
	_textField ctrlSetPosition[_cX, _cY, _cW, ctrlTextHeight _textField];
	_textField ctrlCommit 0;
}];
