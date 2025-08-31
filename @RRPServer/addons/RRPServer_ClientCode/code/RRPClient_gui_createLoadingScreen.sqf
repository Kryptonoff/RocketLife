/*
  File: fn_createLoadingScreen.sqf
  Function: RRPClient_gui_createLoadingScreen
  Author: LoboArdiente
*/

#define HORZ_LEFT ( safeZoneX )
#define HORZ_CENTER ( safeZoneX + ( safeZoneW / 2 ))
#define HORZ_RIGHT ( safeZoneX + safeZoneW )
#define VERT_TOP ( safeZoneY )
#define VERT_CENTER ( safeZoneY + ( safeZoneH / 2 ))
#define VERT_BOTTOM ( safeZoneY + safeZoneH )
#define w(NUM) ( safeZoneWAbs * NUM)
#define h(NUM) ( safeZoneH * NUM)
waitUntil {!(isNull (findDisplay 46))};

if !(canSuspend) exitWith {_this spawn RRPClient_gui_createLoadingScreen};
params[
	["_title", "", [""]],
	["_desc", "", [""]],
	["_color", [1,1,1,1], [[]]],
	["_icon", "", [""]],
	["_condition", {}, [{}]],
	["_conditioncode", {}, [{}]],
    ["_args", []],
	["_timeout", 0, [0]],
	["_timeoutcode", {}, [{}]]
];

if (!isNull (uiNamespace getVariable ["Loading_Display", displayNull])) exitwith {};

disableSerialization;
private _display = (findDisplay 46) createDisplay 'RscDisplayEmpty';
uiNamespace setVariable ["Loading_Display", _display];
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 0.25;

_display displayAddEventHandler ['KeyDown',{true}];

private _background = _display ctrlCreate ["RscStructuredText", -1];
_background ctrlSetPosition [safeZoneXAbs,safeZoneY,safeZoneWAbs,safeZoneH];
_background ctrlSetBackgroundColor [0,0,0,0.75];
_background ctrlEnable false;
_background ctrlSetFade 1;
_background ctrlCommit 0;
_background ctrlSetFade 0;
_background ctrlCommit 0.5;

private _barra = _display ctrlCreate ["RscStructuredText", -1];
_barra ctrlSetPosition [
	HORZ_CENTER - w(0.3 / 2),
	VERT_CENTER,
	w(0.3),
	h(0.001)
];
_barra ctrlSetBackgroundColor _color;
_barra ctrlEnable false;
_barra ctrlSetFade 1;
_barra ctrlCommit 0;
_barra ctrlSetFade 0;
_barra ctrlCommit 0.5;
(ctrlPosition _barra) params ['_X','_Y','_W','_H'];

private _titleCtrl = _display ctrlCreate ["RscStructuredText", -1];
_titleCtrl ctrlSetStructuredText parseText format ["<t font='RobotoCondensedBold' size='2' align='center'>%1</t>", _title];
_titleCtrl ctrlSetPosition [
	_X,
	_Y - h(0.06),
	w(0.3),
	h(0.06)
];
_titleCtrl ctrlEnable false;
_titleCtrl ctrlSetFade 1;
_titleCtrl ctrlCommit 0;
_titleCtrl ctrlSetFade 0;
_titleCtrl ctrlCommit 0.5;

private _descCtrl = _display ctrlCreate ["RscStructuredText", -1];
uiNamespace setVariable ["loading_desc_text",_desc];
_descCtrl ctrlSetStructuredText parseText format ["<t font='RobotoCondensedLight' color='#d9d9d9' size='1.3' align='center'>%1</t>", uiNamespace getVariable ["loading_desc_text",""]];
_descCtrl ctrlSetPosition [
	_X,
	_Y + h(0.009),
	w(0.3),
	(ctrlTextHeight _descCtrl) + h(0.006)
];
uiNamespace setVariable ["desc_control",_descCtrl];
_descCtrl ctrlEnable false;
_descCtrl ctrlSetFade 1;
_descCtrl ctrlCommit 0;
_descCtrl ctrlSetFade 0;
_descCtrl ctrlCommit 0.5;

private _logo = _display ctrlCreate ["RscPictureKeepAspect", -1];
_logo ctrlSetPosition [
	_X,
	_Y + h(0.215),
	w(0.3),
	h(0.06)
];	
_logo ctrlEnable false;
_logo ctrlSetText _icon;
_logo ctrlSetFade 1;
_logo ctrlCommit 0;
_logo ctrlSetFade 0;
_logo ctrlCommit 0.5;

with uiNamespace do
{
	ctrl = _display ctrlCreate ["RscPictureKeepAspect", -1];
	ctrl ctrlSetTextColor _color;
	ctrl ctrlSetPosition [
		_X,
		_Y + h(0.2),
		w(0.3),
		h(0.1)
	];
	ctrl ctrlSetText "\rimas_agent\assets\progress.paa";
	ctrl ctrlCommit 0;
	angle = 0;

	stamp = uiNamespace getVariable ["loading_desc_text",""];
	descCtrl = uiNamespace getVariable ["desc_control",controlNull];
	onEachFrame
	{
		with uiNamespace do
		{
			if (angle > 359) then {angle = 0};
			ctrl ctrlSetAngle [angle, 0.5, 0.5];
			angle = angle + 1;
			if (stamp isNotEqualTo (uiNamespace getVariable ["loading_desc_text",""])) then 
			{
				stamp = uiNamespace getVariable ["loading_desc_text",""];
				descCtrl ctrlSetStructuredText parseText format ["<t font='RobotoCondensedLight' color='#d9d9d9' size='1.3' align='center'>%1</t>", uiNamespace getVariable ["loading_desc_text",""]];
			};
		};
	};
};

if (_timeout <= 0) then {
	
	waitUntil{
		if (_args call _condition) exitwith {
			call RRPClient_gui_hideLoadingScreen;
			_args call _conditioncode;
			true
		};
		false
	};

}else{

	private _startTime = diag_tickTime;
	waitUntil{
		if (diag_tickTime - _startTime > _timeout) exitwith {
			call RRPClient_gui_hideLoadingScreen;
			_args call _timeoutcode;
			true
		};

		if (_args call _condition) exitwith {
			call RRPClient_gui_hideLoadingScreen;
			_args call _conditioncode;
			true
		};
		false
	};
};