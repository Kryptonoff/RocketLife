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

disableSerialization;
private ["_data","_value","_index"];
_data = (lbData[2007,lbCurSel 2007]);
_value = ctrlText 2106;

try {
  if !(isNull objectParent player) throw "Нельзя избавляться от ресурсов находясь в технике!";
  if (_data isEqualTo "") throw "Вы не выбрали ресурс!";
  if !([_value] call RRPClient_system_isnumber) throw "Вы ввели некорректное число!";
  if (parseNumber(_value) <= 0) throw "Введите число более 0!";

  _index = [_data,RRPPublicEconomyIlegalItems] call RRPClient_system_index;
  if (!(_index isEqualTo -1) and (["cop",getPosWorld player,150] call RRPClient_system_nearUnits)) throw "На хвосте копы, скиньте их что бы удалить нелегальный ресурс!";
  if !([false,_data,(parseNumber _value)] call RRPClient_system_handleInv) throw "У вас такого количества, которое вы пытаетесь удалить!";
  ["InfoTitleAndText", ["- Инвентарь", format["Вы выкинули %1 %2 из своего инвентаря.",(parseNumber _value), getText(missionConfigFile >> "VirtualItems" >> _data >> "displayName")]]] call SmartClient_gui_toaster_addTemplateToast;
  call RRPClient_invExt_updateVirtInv;
} catch {
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
