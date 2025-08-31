/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_ControlList','_ctrlimage','_ctrlProgress','_ctrlupAmount','_ctrlimageSpent','_ctrlprogressSpent','_YcoordTitle','_YcoordIMG','_CurGuiBuffs'];
_ControlList = param [0,[],[[]]];
_ctrlimageSpent    =  _ControlList select 0;
_ctrlprogressSpent =  _ControlList select 1;
_ctrlimage         =  _ControlList select 2;
_ctrlProgress      = _ControlList select 3;
_ctrlupAmount      = _ControlList select 4;
_CurGuiBuffs       = _ControlList select 5;

_YcoordTitle = 0.247;
_YcoordIMG   = 0.225;
_YcoordTitle = _YcoordTitle + (_CurGuiBuffs * 0.075);
_YcoordIMG   = _YcoordIMG + (_CurGuiBuffs * 0.075);

_ctrlimageSpent    ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlprogressSpent ctrlSetPosition [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];
_ctrlimage         ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordTitle * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
_ctrlProgress      ctrlSetPosition [1.027063 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.002125 * safezoneW,0.066 * safezoneH];
_ctrlupAmount      ctrlSetPosition [1.029219 * safezoneW + safezoneX,_YcoordIMG * safezoneH + safezoneY,0.0257812 * safezoneW,0.022 * safezoneH];

{
  _x ctrlSetFade 0;
  _x ctrlCommit 0.7;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlProgress,_ctrlupAmount];
waitUntil {ctrlCommitted _ctrlimageSpent;};

{
  ctrlDelete _x;
} forEach [_ctrlimageSpent,_ctrlprogressSpent,_ctrlimage,_ctrlProgress,_ctrlupAmount];
amountGuiBuffs = amountGuiBuffs + [_CurGuiBuffs];
amountGuiBuffs = amountGuiBuffs call BIS_fnc_sortNum;
