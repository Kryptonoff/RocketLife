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

if (life_action_inUse) exitWith {};
life_action_inUse = true;
closeDialog 0;

private ["_curvehicle","_Trunk","_IllegalItems","_curItem","_curAmount","_result","_complete","_vehInv","_weight","_time","_totalAmount","_totalPrice","_finalText","_displayName","_location","_TextForLOG"];
try {
  _curvehicle = cursorObject;
  if (isNull _curvehicle) throw "Техника неопределена!";
  if !([_curvehicle] call RRPClient_system_isVehicleKind) throw "Это не транспортное средство!";
  _vehInv = _curvehicle getVariable ["Trunk",[[],0]];
  _Trunk = _vehInv select 0;
  _weight = _vehInv select 1;
  if (_Trunk isEqualTo []) throw "Инвентарь пустой!";
  _result = call RRPClient_system_canSearch;
  if (!(_result select 0) and ((getTerrainHeightASL (getPosATL player)) > -1)) throw format ["Обыскать транспорт можно только на территории<br/><br/><t size='20' font='RobotoCondensedBold'>%1</t><br/>Или техинку <t size='20' font='RobotoCondensedBold'>погруженую у воду </t>",_result select 1];

  _totalAmount = 0;
  _IllegalItems = [];
  _ecoIllegalItems = createHashMapFromArray (RRPPublicEconomyArray select {!(_x select 5)});
  
  {
    _curItem = _x select 0;
    _curAmount = _x select 1;

    if (_curItem in (keys _ecoIllegalItems)) then {
      _IllegalItems pushBack [_curItem,_curAmount];
      _totalAmount = _totalAmount  + _curAmount;
    };
  } forEach _Trunk;
  if (_IllegalItems isEqualTo []) throw "В данном ТС нету нелегальных ресурсов";

  _time = round(_weight/10);
  _complete = ["Ищем что-то запрещенное...",{!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},true,_time,false,true,{player playActionNow "FT_Act_Craft_Thing";}] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw 'Действие прервано!';

  _finalText = "";
  _TextForLOG = "";
  {
    if !([_curvehicle,(_x select 0),(_x select 1),false] call RRPClient_system_vehicleInv) throw "Что-то пошло не так";
    _displayName = (getText(missionconfigfile >> 'VirtualItems' >> (_x select 0) >> 'displayName'));
    _finalText   = _finalText + _displayName + " X" + (str (_x select 1)) + "<br/>";
    _TextForLOG  = _TextForLOG + _displayName + " X" + (str (_x select 1)) + " ";
  } forEach _IllegalItems;

  _totalPrice = _totalAmount * getNumber(missionConfigFile >> "LifeCfgSettings" >> "rewardForSearch");
  [[player,"cash","add",_totalPrice],"system_moneyChange"] call RRPClient_system_hcExec;

  ['WarningTitleAndText',["Обыск техники",format["В данном ТС найдено:<br/><t size='20' font='RobotoCondensedBold'>%1</t><br/><br/>За изъятие наркотических средств в крупном размере, государство перечислило вам на счет <t size='20' font='RobotoCondensedBold'>%2$</t>",_finalText,_totalPrice]]] call SmartClient_gui_toaster_addTemplateToast;

  _location = if !((getTerrainHeightASL (getPosATL player)) > -1) then {"В воде"} else {_result select 1};
  [format["%1 CONFISCATE %2 FOR %3 | Location: %4",(getPlayerUID player),_TextForLOG,_totalPrice,_location],"ConfiscateVehLog"] remoteExecCall ["RRPServer_system_logIt",2];
  life_action_inUse = false;
} catch {
  life_action_inUse = false;
  ['WarningTitleAndText',["Обыск техники",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
