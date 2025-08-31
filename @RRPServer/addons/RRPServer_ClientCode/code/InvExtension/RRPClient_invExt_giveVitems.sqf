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
private ["_unit","_item","_val","_display","_btnGiveVitems","_ctrEditAmount","_ctrlSelectPlayer","_vItemsList"];
_display = findDisplay 602;
_btnGiveVitems = _display displayCtrl 2006;
_ctrEditAmount = _display displayCtrl 2106;
_ctrlSelectPlayer = _display displayCtrl 2105;
_vItemsList = _display displayCtrl 2007;
_btnGiveVitems ctrlEnable false;

try {
  if ((lbCurSel _ctrlSelectPlayer) isEqualTo -1) throw "Вы не выбрали игрока для взаимодействия!";
  _unit = (objectFromNetId (_ctrlSelectPlayer lbData (lbCurSel _ctrlSelectPlayer)));

  if (isNil "_unit") throw "Игрока не существует!";
  if (isNull _unit) throw "Игрока не существует!";
  if (_unit isEqualTo player) throw "Вы не можете передать ресурс себе!";
  if ((lbCurSel _vItemsList) isEqualTo -1) throw "Вы не выбрали ресурс для передачи!";

  _item = (_vItemsList lbData (lbCurSel _vItemsList));
  _val = ctrlText _ctrEditAmount;

  if !([_val] call RRPClient_system_isnumber) throw "Вы ввели некорректное число!";
  if (parseNumber(_val) <= 0) throw "Введите число более 0!";
  if !([false,_item,(parseNumber _val)] call RRPClient_system_handleInv) throw "У вас нет такого количества предметов которые вы пытаетесь передать!";

  [_unit,_val,_item,player] remoteExecCall ["RRPClient_invExt_receiveItem",_unit];
  ["InfoTitleAndText", ["- Инвентарь", format["Вы передали %1 %2 %3",_unit getVariable ["realname",""],_val,getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")]]] call SmartClient_gui_toaster_addTemplateToast;
  _btnGiveVitems ctrlEnable true;
  call RRPClient_invExt_updateVirtInv;
} catch {
  _btnGiveVitems ctrlEnable true;
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
