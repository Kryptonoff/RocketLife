/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = findDisplay 46;
private _wO = 2;
private _hO = 0;
private _scaleFactorText = (1 / (getResolution select 5));
private _fontS = "RobotoRegular";
private _txtSizeXS = 0.45 * _scaleFactorText;
private _maxMembers = 10;
private _pW = pixelW * 5 * (getResolution select 0) / 1920;
private _pH = pixelH * 5 * (getResolution select 1) / 1080;
private _titleH = 4;
private _barH = 1;
private _ctrls = [];
private _ctrlsName = [];
private _ctrlsPic = [];
private _ctrlsHealthBar = [];

nearGroupUnitsOld = [];
nearGroupUnitsOldDamage = [];
nearGroupUnitsOldRole = [];
oldGroupLeader = objNull;

private _backgroundColor = [(profilenamespace getvariable ['IGUI_BCG_RGB_R',0]),(profilenamespace getvariable ['IGUI_BCG_RGB_G',1]),(profilenamespace getvariable ['IGUI_BCG_RGB_B',1]),(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])];
_backgroundColor params ['_bR','_bG','_bB','_bA'];
private _textColor = [(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0]),(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1]),(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1]),(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])];
_textColor params ['_tR','_tG','_tB','_tA'];
private _textColorHEX = [_tR,_tG,_tB,_tA] call BIS_fnc_colorRGBtoHTML;

private _membersGroup = _display ctrlCreate ['RscControlsGroupNoScrollbars',252200];
_membersGroup ctrlSetPosition [0 * safezoneW + safezoneX, 0.13 * safezoneH + safezoneY,0.136 * safezoneW,0.47 * safezoneH];
_membersGroup ctrlCommit 0;
(ctrlPosition _membersGroup) params ['_gX','_gY','_gW','_gH'];
private _allGroup = _display ctrlCreate ['RscControlsGroupNoScrollbars',252201,_membersGroup];
_allGroup ctrlSetPosition [0,0,_gW,_gH];
_allGroup ctrlSetFade 0.25;
_allGroup ctrlCommit 0;
(ctrlPosition _allGroup) params ['_gX','_gY','_gW','_gH'];

for "_x" from 1 to _maxMembers do {
	private _tempGroup = _display ctrlCreate ['RscControlsGroupNoScrollbars',252202,_allGroup];
	_ctrls pushBack _tempGroup;
	_tempGroup ctrlSetPosition [_wO * _pW,_hO * _pH,_gW,(_titleH + _barH) * _pH];
	_tempGroup ctrlSetFade 1;
	_tempGroup ctrlCommit 0;
	(ctrlPosition _tempGroup) params ['_tX','_tY','_tW','_tH'];

	[_tempGroup,-1,[0,0,(_titleH + _barH) * _pW,(_titleH + _barH) * _pH],'',_fontS,_txtSizeXS,"left","#FFFFFF","1",[_bR,_bG,_bB,_bA]] call RRPClient_gui_util_makeStructuredText;
	[_tempGroup,-1,[(_titleH + _barH) * _pW,(_titleH * _pH),_tW - ((_wO*2) * _pW) - ((_titleH + _barH) * _pW),_barH * _pH],'',_fontS,_txtSizeXS,"left","#FFFFFF","1",[_bR,_bG,_bB,_bA]] call RRPClient_gui_util_makeStructuredText;
	_ctrlsPic pushBack ([_tempGroup,-1,[0,0,(_titleH + _barH) * _pW,(_titleH + _barH) * _pH],'',true] call RRPClient_gui_util_makeStaticPicture);
	_ctrlsName pushBack ([_tempGroup,-1,[(_titleH + _barH) * _pW,0,_tW - ((_wO*2) * _pW) - ((_titleH + _barH) * _pW),_titleH * _pH],' ',_fontS,_txtSizeXS,"left",_textColorHEX,"1",[_bR,_bG,_bB,_bA]] call RRPClient_gui_util_makeStructuredText);
	_ctrlsHealthBar pushBack ([_tempGroup,-1,[(_titleH + _barH) * _pW,(_titleH * _pH),_tW - ((_wO*2) * _pW) - ((_titleH + _barH) * _pW),_barH * _pH	],[1,1,1,1],[0.1,0.1,0.1,0]] call RRPClient_gui_util_makeProgress);

	_hO = _hO + _barH + _titleH + 2;
};
_display setVariable ["groupBarCtrlInfo",[_ctrls,_ctrlsName,_ctrlsPic,_ctrlsHealthBar]];
