/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd

    Syntax:
    [MainImage,TopImage,BotText,'isGoodEffect??] spawn RRPClient_UseItems_buffs_instantCreateUI

    Parameters:
    MainImage    : STR
    TopImage     : STR
    BotText      : STR
    isGoodEffect : BOOL

    Верхняя часть инферфейса, будет отображать текст или картинку в зависимости от TopImage или BotText. Эти два параметра не работают вместе, TopImage для заполнения верхней части картинкой или же BotText - для текста

    Приминение:
    Используем при получении мгновенных еффектов. еда/вода/хилл
*/
private ['_isGoodEffect','_Topimage','_coefBuff','_display','_ctrlimage','_ctrlupAmount','_image','_ctrlimageSpent','_ctrlprogressSpent','_time','_YcoordTitle','_YcoordIMG','_CurGuiBuffs'];
_image      = param [0,'',['']];
_Topimage   = param [1,'',['']];
_coefBuff   = param [2,'',['']];
_isGoodEffect = param [3,true,[true]];

if (_image isEqualTo '') exitWith {};
if ((count amountGuiBuffs) < 1) exitWith {};

_image    = format ['\RRP_icons\buffs\%1.paa',_image];
_Topimage = if !(_Topimage isEqualTo '') then {format ['\RRP_icons\buffs\%1.paa',_Topimage]} else {''};

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
_ctrlimageSpent ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.066 * safezoneH];

_ctrlprogressSpent = _display ctrlCreate ['RscText', -1];
if (_isGoodEffect) then {
  _ctrlprogressSpent ctrlSetBackgroundColor [0.0, 0.92, 0.99, 1];
} else {
  _ctrlprogressSpent ctrlSetBackgroundColor [0.0, 1.0, 0.5,1];
};
_ctrlprogressSpent ctrlSetPosition  [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];

_ctrlimage = _display ctrlCreate ['RscPicture', (parseNumber (format ['%1002',_CurGuiBuffs]))];
_ctrlimage ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlimage ctrlSetText _image;

if !(_Topimage isEqualTo '') then {
      _ctrlupAmount = _display ctrlCreate ['RscPicture', (parseNumber (format ['%1004',_CurGuiBuffs]))];
      _ctrlupAmount ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];
      _ctrlupAmount ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
      _ctrlupAmount ctrlSetText _Topimage;
  } else {
      _ctrlupAmount = _display ctrlCreate ['RRP_title', (parseNumber (format ['%1004',_CurGuiBuffs]))];
      _ctrlupAmount ctrlSetFont  'Overwatch';
      _ctrlupAmount ctrlSetFontHeight 0.03;
      _ctrlupAmount ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];
      _ctrlupAmount ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
      _ctrlupAmount ctrlSetText _coefBuff;
  };

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlupAmount];


_ctrlimageSpent    ctrlSetPosition [0.969219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.066 * safezoneH];
_ctrlprogressSpent ctrlSetPosition [0.967063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];
_ctrlimage         ctrlSetPosition [0.969219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlupAmount      ctrlSetPosition [0.969219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];

{
      _x ctrlSetFade 0;
      _x ctrlCommit 0.7;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlupAmount];
waitUntil {ctrlCommitted _ctrlimageSpent};

uiSleep 2;

_ctrlimageSpent    ctrlSetPosition [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.066 * safezoneH];
_ctrlprogressSpent ctrlSetPosition [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];
_ctrlimage         ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlupAmount      ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];

{
    _x ctrlSetFade 0;
    _x ctrlCommit 0.7;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlupAmount];
waitUntil {ctrlCommitted _ctrlimageSpent;};

{
      ctrlDelete _x;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage];
amountGuiBuffs = amountGuiBuffs + [_CurGuiBuffs];
amountGuiBuffs = amountGuiBuffs call BIS_fnc_sortNum;
