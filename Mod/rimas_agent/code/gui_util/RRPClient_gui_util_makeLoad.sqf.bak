/*
	File: fn_makeLoad.sqf
	Author: KamiGun

	Description:
	Create loading control in given ctrlGroup
*/

disableSerialization;
params[
	['_display',(findDisplay 46),[displayNull]],
	['_group',controlNull,[controlNull]],
	['_idc',-1,[0]],
	['_position',[0,0,1.16,1],[[]],4], // 58:50 default
	['_color',[1,1,1,1],[[]],4],
	['_timeLoading',2.4,[0]],
	['_animationTime',0.53,[0]]
];

private _DT_fnc_createBG = {
	params ['_group',['_position',[0,0,1,1]],['_colorBG',[0,0,0,0],[[]]]];
	private _ctrl = _display ctrlCreate ['RscText',-1,_group];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetBackgroundColor _colorBG;
	_ctrl ctrlCommit 0;
	_ctrl
};

private _DT_fnc_animLoad = {
	disableSerialization;
	params['_ctrl','_pos','_animationTime','_animPause','_barW','_lgH'];
	_ctrl ctrlSetPosition [(_pos select 0),0,_barW,_lgH];
	_ctrl ctrlCommit _animPause;
	uiSleep _animPause;
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlCommit _animationTime;
};

private _loadingGroup = if(isNull _group) then {
	_display ctrlCreate ["RscControlsGroupNoScrollbars",_idc];
} else {
	_display ctrlCreate ["RscControlsGroupNoScrollbars",_idc,_group];
};
_loadingGroup ctrlSetPosition _position;
_loadingGroup ctrlCommit 0;
(ctrlPosition _loadingGroup) params ['_lgX','_lgY','_lgW','_lgH'];

//animation params
private _xW = _lgW / 58;
private _xH = _lgH / 50;
private _barW = _xW * 8;
private _barH = _xH * 6;
private _xOffset = _xW * 2;
private _yOffset = (_lgH / 2) - (_barH / 2);
private _xO = 0;

private _posBar1 = +[_xO,_yOffset,_barW,_barH];
private _bar1 = [_loadingGroup,_posBar1,_color] call _DT_fnc_createBG;
_xO = _xO + _barW + _xOffset;
private _posBar2 = +[_xO,_yOffset,_barW,_barH];
private _bar2 = [_loadingGroup,_posBar2,_color] call _DT_fnc_createBG;
_xO = _xO + _barW + _xOffset;
private _posBar3 = +[_xO,_yOffset,_barW,_barH];
private _bar3 = [_loadingGroup,_posBar3,_color] call _DT_fnc_createBG;
_xO = _xO + _barW + _xOffset;
private _posBar4 = +[_xO,_yOffset,_barW,_barH];
private _bar4 = [_loadingGroup,_posBar4,_color] call _DT_fnc_createBG;
_xO = _xO + _barW + _xOffset;
private _posBar5 = +[_xO,_yOffset,_barW,_barH];
private _bar5 = [_loadingGroup,_posBar5,_color] call _DT_fnc_createBG;
_xO = _xO + _barW + _xOffset;
private _posBar6 = +[_xO,_yOffset,_barW,_barH];
private _bar6 = [_loadingGroup,_posBar6,_color] call _DT_fnc_createBG;

private _start = diag_tickTime;
private _animCoef = 0.377;
private _animPause = _animationTime * _animCoef;
while{!isNull _display && (diag_tickTime - _start) < _timeLoading} do {
	uiSleep _animPause;
	[_bar1,_posBar1,_animationTime,_animPause,_barW,_lgH] spawn _DT_fnc_animLoad;
	uiSleep _animPause;
	[_bar2,_posBar2,_animationTime,_animPause,_barW,_lgH] spawn _DT_fnc_animLoad;
	uiSleep _animPause;
	[_bar3,_posBar3,_animationTime,_animPause,_barW,_lgH] spawn _DT_fnc_animLoad;
	uiSleep _animPause;
	[_bar4,_posBar4,_animationTime,_animPause,_barW,_lgH] spawn _DT_fnc_animLoad;
	uiSleep _animPause;
	[_bar5,_posBar5,_animationTime,_animPause,_barW,_lgH] spawn _DT_fnc_animLoad;
	uiSleep _animPause;
	[_bar6,_posBar6,_animationTime,_animPause,_barW,_lgH] spawn _DT_fnc_animLoad;
};

if(true) then {
	[_loadingGroup] spawn {
		disableSerialization;
		params ['_loadingGroup'];
		_loadingGroup ctrlSetFade 1;
		_loadingGroup ctrlCommit 1;
		uiSleep 1;
		ctrlDelete _loadingGroup;
	};
};

_loadingGroup