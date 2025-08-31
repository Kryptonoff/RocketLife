
private ['_coefBuff','_return','_display','_ctrlimage','_ctrlProgress','_ctrlupAmount','_image','_ctrlimageSpent','_ctrlprogressSpent','_time','_YcoordTitle','_YcoordIMG','_CurGuiBuffs'];
_image    = param [0,'',['']];
_time     = param [1,0,[0]];
_coefBuff =  param [2,'',['']];


if (_image isEqualTo '') exitWith {};
if (_time isEqualTo 0) exitWith {};
if ((count amountGuiBuffs) < 1) exitWith {};

_image = format ['\RRP_icons\buffs\%1.paa',_image];
_YcoordTitle   = 0.247;
_YcoordIMG     = 0.225;
_CurGuiBuffs   = (amountGuiBuffs select 0);
amountGuiBuffs = amountGuiBuffs - [_CurGuiBuffs];
amountGuiBuffs = amountGuiBuffs call BIS_fnc_sortNum;
_YcoordTitle   = _YcoordTitle + (_CurGuiBuffs * 0.075);
_YcoordIMG     = _YcoordIMG + (_CurGuiBuffs * 0.075);


_display = uiNamespace getVariable ['RRPDialogBuffs',displayNull];
if (isNull _display) then {
  ['RRPDialogBuffs'] call RRPClient_gui_CreateRscLayer;
  _display = uiNamespace getVariable ['RRPDialogBuffs',displayNull];
};

_ctrlimageSpent = _display ctrlCreate ['RRP_title', -1];
_ctrlimageSpent ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
_ctrlimageSpent ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];


_ctrlprogressSpent = _display ctrlCreate ['RscText', -1];
_ctrlprogressSpent ctrlSetBackgroundColor [0.0, 0.92, 0.99,1];
_ctrlprogressSpent ctrlSetPosition  [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];

_ctrlimage = _display ctrlCreate ['RscPictureKeepAspect', (parseNumber (format ['%1002',_CurGuiBuffs]))];
_ctrlimage ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];

_ctrlProgress = _display ctrlCreate ['RRP_title', (parseNumber (format ['%1003',_CurGuiBuffs]))];
_ctrlProgress ctrlSetPosition [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];
_ctrlProgress ctrlSetForegroundColor [0.35, 0.25, 0.56,1];

_ctrlupAmount = _display ctrlCreate ['RRP_title', (parseNumber (format ['%1004',_CurGuiBuffs]))];
_ctrlupAmount ctrlSetFont  'Overwatch';
_ctrlupAmount ctrlSetFontHeight 0.03;
_ctrlupAmount ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];
_ctrlupAmount ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];

_return = [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlProgress,_ctrlupAmount,_CurGuiBuffs];
{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlProgress,_ctrlupAmount];

_ctrlimageSpent    ctrlSetPosition [0.969219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlprogressSpent ctrlSetPosition [0.967063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];
_ctrlimage         ctrlSetPosition [0.969219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlProgress      ctrlSetPosition [0.967063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0 * safezoneH];
_ctrlupAmount      ctrlSetPosition [0.969219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];



{
  _x ctrlSetFade 0;
  _x ctrlCommit 0.7;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlProgress,_ctrlupAmount];
waitUntil {ctrlCommitted _ctrlimageSpent};

_ctrlimage ctrlSetText _image;
_ctrlupAmount ctrlSetText _coefBuff;

_ctrlProgress ctrlSetPositionH (0.066 * safezoneH);
_ctrlProgress ctrlCommit _time;
_return
