/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ["_mainTitle","_rightBg", "_leftBg","_titleBg","_mirrorPos","_totalLoad","_titleMoney","_structuredMoney","_comboMoney","_EditMoney","_GiveMoney","_titleLicense","_LBLicense","_curPosition","_BackgroundVirtItems","_vItemsLoad","_frameLoad","_btnDeleteVitems","_btnGiveVitems","_vItemsList","_display","_buttonCombMags","_selectUnit","_amount","_buttonShowInv","_buttonShowStatus"];
waitUntil {!(isNull(findDisplay 602))};
_display =  findDisplay 602;
statusCtrls = [];
vInvCtrls = [];
{
  _curPosition = ctrlPosition _x;
  _curPosition set [0, ((_curPosition select 0) - 0.20)];
  _x ctrlSetPosition _curPosition;
  _x ctrlCommit 0;
} forEach allControls _display;

_titleBg = _display displayCtrl 111;
_titleBg ctrlSetText format ["%1 | голод %2%4 | жажда %3%4 ",(ctrlText _titleBg),round(RRPClientHunger),round(RRPClientThirst),"%"];
_titleBg ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];

_totalLoad = _display displayCtrl 6308;
_curPosition = ctrlPosition (_display displayCtrl 6308);
_curPosition set [2, ((_curPosition select 2) * 0.5) - 0.024];
_totalLoad ctrlSetPosition _curPosition;
_totalLoad ctrlCommit 0;

_leftBg = _display displayCtrl 1001;
_rightBg = _display displayCtrl 1002;
_mainTitle = _display displayCtrl 1020;
_mainTitle ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_leftBg ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.8];
_rightBg ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.8];

_mirrorPos = ((((ctrlPosition _rightBg) select 0) - (((ctrlPosition _leftBg) select 0) + ((ctrlPosition _leftBg) select 2))) + ((ctrlPosition _rightBg) select 2) + ((ctrlPosition _rightBg) select 0));
_buttonCombMags = _display displayCtrl 2400;
_buttonCombMags ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_buttonCombMags ctrlSetText "Перабрать обоймы";
_curPosition = ctrlPosition (_display displayCtrl 6308);
_curPosition set [0, ((_curPosition select 0) + (_curPosition select 2) +  0.019)];
_curPosition set [2, ((_curPosition select 2)) + 0.029];
_buttonCombMags ctrlSetPosition _curPosition;
_buttonCombMags ctrlCommit 0;

_BackgroundVirtItems = _display ctrlCreate ["RRP_title", 2001];
_BackgroundVirtItems ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.8];
_curPosition = ctrlPosition (_display displayCtrl 1001);
_curPosition set [0, _mirrorPos];
_BackgroundVirtItems ctrlSetPosition _curPosition;
_BackgroundVirtItems ctrlCommit 0;
_mirrorPos = (((ctrlPosition _BackgroundVirtItems) select 0) - ((ctrlPosition _leftBg) select 0));

_vItemsLoad = _display ctrlCreate ["RscProgress", 2003];
_vItemsLoad ctrlSetTextColor [0.75, 0.75, 0.75, 0.75];
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_vItemsLoad ctrlSetPosition _curPosition;
_vItemsLoad progressSetPosition 0;
_vItemsLoad ctrlCommit 0;
vInvctrls pushBack _vItemsLoad;

_vItemsLoadText = _display ctrlCreate ["RRP_RscText_centerText", 2021];
_vItemsLoadText ctrlSetTextColor [1, 1, 1, 1];
_vItemsLoadText ctrlSetBackgroundColor [1, 1, 1,0];
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_vItemsLoadText ctrlSetPosition _curPosition;
_vItemsLoadText progressSetPosition 0;
_vItemsLoadText ctrlCommit 0;
vInvctrls pushBack _vItemsLoadText;

_frameLoad = _display ctrlCreate ["RscFrame", 2004];
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_frameLoad ctrlSetPosition _curPosition;
_frameLoad ctrlCommit 0;
vInvctrls pushBack _frameLoad;

_selectUnit = _display ctrlCreate ["RRP_RscCombo", 2105];
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1, ((_curPosition select 1) - 0.15)];
_curPosition set [2, ((_curPosition select 2)/1.2) * 0.98];
_selectUnit ctrlSetPosition _curPosition;
_selectUnit ctrlCommit 0;
vInvctrls pushBack _selectUnit;

_amount = _display ctrlCreate ["RscEdit", 2106];
_amount ctrlSetText "1";
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos + ((_curPosition select 2)/1.2))];
_curPosition set [1, ((_curPosition select 1) - 0.15)];
_curPosition set [2, ((_curPosition select 2)/6)];
_amount ctrlSetPosition _curPosition;
_amount ctrlCommit 0;
vInvctrls pushBack _amount;

_btnDeleteVitems = _display ctrlCreate ["RRP_btn_noLine", 2107];
_btnDeleteVitems ctrlSetText "Удалить";
_btnDeleteVitems buttonSetAction "call RRPClient_invExt_removeVitems";
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1, ((_curPosition select 1) - 0.05)];
_btnDeleteVitems ctrlSetPosition _curPosition;
_btnDeleteVitems ctrlCommit 0;
vInvctrls pushBack _btnDeleteVitems;

_btnGiveVitems = _display ctrlCreate ["RRP_btn_noLine", 2006];
_btnGiveVitems ctrlSetText "Передать";
_btnGiveVitems buttonSetAction "call RRPClient_invExt_giveVitems";
_curPosition = ctrlPosition (_display displayCtrl 6307);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1, ((_curPosition select 1) - 0.1)];
_btnGiveVitems ctrlSetPosition _curPosition;
_btnGiveVitems ctrlCommit 0;
vInvctrls pushBack _btnGiveVitems;

_vItemsList = _display ctrlCreate ["RRP_RscListBoxBigTiles_vInv", 2007];
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [3, ((_curPosition select 3) + (((ctrlPosition (_display displayCtrl 2106)) select 1) - ((ctrlPosition (_display displayCtrl 6554)) select 1)) - ((ctrlPosition (_display displayCtrl 6554)) select 3))];
_vItemsList ctrlSetPosition _curPosition;
_vItemsList ctrlAddEventHandler ["LBDblClick",{_this call RRPClient_system_useItem}];
_vItemsList ctrlCommit 0;
vInvctrls pushBack _vItemsList;

_buttonShowInv = _display ctrlCreate ["RRP_btn_noLine", 2008];
_buttonShowInv ctrlSetText "Ресурсы";
_buttonShowInv buttonSetAction "'vInvctrls' call RRPClient_invExt_switchTab";
_curPosition = ctrlPosition (_display displayCtrl 6321);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_buttonShowInv ctrlSetPosition _curPosition;
_buttonShowInv ctrlCommit 0;

_buttonShowStatus = _display ctrlCreate ["RRP_btn_noLine", 2011];
_buttonShowStatus ctrlSetText "Статус";
_buttonShowStatus buttonSetAction "'statusCtrls' call RRPClient_invExt_switchTab";
_curPosition = ctrlPosition (_display displayCtrl 6321);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos + (_curPosition select 2))];
_buttonShowStatus ctrlSetPosition _curPosition;
_buttonShowStatus ctrlCommit 0;

_titleMoney = _display ctrlCreate ["RRP_title", 3001];
_titleMoney ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_titleMoney ctrlSetText "Финансы";
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_titleMoney ctrlSetPosition _curPosition;
_titleMoney ctrlCommit 0;
statusCtrls pushBack _titleMoney;


_comboMoney = _display ctrlCreate ["RRP_RscCombo", 3003];
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + ((_curPosition select 2) * 0.3) + _mirrorPos)];
_curPosition set [2, ((_curPosition select 2) * 0.7)];
_curPosition set [1, ((_curPosition select 3) + 0.3)];
_comboMoney ctrlSetPosition _curPosition;
_comboMoney ctrlCommit 0;
statusCtrls pushBack _comboMoney;

_EditMoney = _display ctrlCreate ["RscEdit", 3004];
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [2, ((_curPosition select 2) * 0.3)];
_curPosition set [1, ((_curPosition select 3) + 0.3)];
_EditMoney ctrlSetPosition _curPosition;
_EditMoney ctrlCommit 0;
statusCtrls pushBack _EditMoney;

_structuredMoney = _display ctrlCreate ["RRP_RscStructuredText", 3002];
_structuredMoney ctrlSetBackgroundColor [0.26, 0.24, 0.31,1];
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1, ((_curPosition select 1) + (_curPosition select 3))];
_curPosition set [3,  ((_curPosition select 3) + (((ctrlPosition (_display displayCtrl 3004)) select 1) - ((ctrlPosition (_display displayCtrl 3004)) select 3)  - ((ctrlPosition (_display displayCtrl 3001)) select 1)) - ((ctrlPosition (_display displayCtrl 3001)) select 3))];
_structuredMoney ctrlSetPosition _curPosition;
_structuredMoney ctrlCommit 0;
statusCtrls pushBack _structuredMoney;

_GiveMoney = _display ctrlCreate ["RRP_btn_noLine", 3005];
_GiveMoney ctrlSetText "Передать";
_GiveMoney buttonSetAction "call RRPClient_invExt_giveMoney";
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1, ((_curPosition select 3) + 0.345)];
_curPosition set [3, ((_curPosition select 3) * 1.6)];
_GiveMoney ctrlSetPosition _curPosition;
_GiveMoney ctrlCommit 0;
statusCtrls pushBack _GiveMoney;

_titleLicense = _display ctrlCreate ["RRP_title", 3006];
_titleLicense ctrlSetText "Лицензии";
_titleLicense ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1, ((_curPosition select 3) + 0.415)];
_titleLicense ctrlSetPosition _curPosition;
_titleLicense ctrlCommit 0;
statusCtrls pushBack _titleLicense;

_LBLicense = _display ctrlCreate ["RscListBox_forStatus", 3007];
_curPosition = ctrlPosition (_display displayCtrl 6554);
_curPosition set [0, ((_curPosition select 0) + _mirrorPos)];
_curPosition set [1,(((ctrlPosition (_display displayCtrl 3006)) select 1) + ((ctrlPosition (_display displayCtrl 3006)) select 3))];
_curPosition set [3, ((_curPosition select 3) + (((ctrlPosition (_display displayCtrl 2400)) select 1) - ((ctrlPosition (_display displayCtrl 3006)) select 1)) - ((ctrlPosition (_display displayCtrl 3006)) select 3))];
_LBLicense ctrlSetPosition _curPosition;
_LBLicense ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
_LBLicense ctrlCommit 0;
statusCtrls pushBack _LBLicense;

call RRPClient_invExt_updateVirtInv;
call RRPClient_invExt_updateStatus;
call RRPClient_invExt_nearUnits;
(missionNameSpace getVariable ["extInv_tabe","statusCtrls"]) call RRPClient_invExt_switchTab;
