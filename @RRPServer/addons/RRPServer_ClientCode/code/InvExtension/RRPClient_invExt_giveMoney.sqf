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
private ["_display","_selectPlayer","_btnGiveMoney","_moneyEmount","_amount","_unit"];
try {
  _display = findDisplay 602;
  _selectPlayer = _display displayCtrl 3003;
  _moneyEmount  = _display displayCtrl 3004;
  _btnGiveMoney = _display displayCtrl 3005;
  _btnGiveMoney ctrlEnable false;
  _amount = ctrlText _moneyEmount;

  if (time - life_atm_timer < 2) throw "Предыдущее действие еще не завершено!!";
  if (!life_use_atm) throw "Вы недавно кого-то ограбили. Не можете передать деньги другому человеку";
  if ((lbCurSel _selectPlayer) isEqualTo -1) throw "Необходимо выбрать имя получателя";
  _unit = (objectFromNetId (_selectPlayer lbData (lbCurSel _selectPlayer)));

  if (isNil "_unit") throw "Такой игрок, кажется, не существует?";
  if (isNull _unit) throw "Такой игрок, кажется, не существует?";
  if (_unit isEqualTo player) throw "";
  if !([_amount] call RRPClient_system_isnumber) throw "Введите корректное число!";
  if ((parseNumber _amount) <= 0)  throw "Введите значение больше нуля";
  if ((parseNumber _amount) > RRPClientCashMoney) throw "У вас нет такого количества денег";
  if (_unit getVariable ["realname",""] isEqualTo "") throw "Не удается определить имя получателя.";

  [_unit,_amount,player] remoteExecCall ["RRPClient_invExt_receiveMoney",_unit];
  life_atm_timer = time;
  [player,"cash","take",_amount,[format["Отправил %1 (%2) - %3 (%4) - денег %5",name player,getPlayerUID player,name _unit,getPlayerUID _unit,_amount],"TransferLog"]] remoteExecCall ["RRPServer_system_moneyChange",2];
  ["successTitleAndText", ["- Финансы",format["Вы передали $%1 игроку %2",[(parseNumber _amount)] call RRPClient_util_numberText,_unit getVariable ["realname",""]]]] call SmartClient_gui_toaster_addTemplateToast;
  _btnGiveMoney ctrlEnable true;
  call RRPClient_invExt_updateStatus;
} catch {
  _btnGiveMoney ctrlEnable true;
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
