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
uiSleep 0.5;
private ["_chanceCombo","_multiplierCombo","_zonesArray","_curZone","_RandomItem","_DefaultTime","_DefaultAmount","_itemsArray","_addItemsArray","_FinalItem","_amountItems","_complete","_curlvl","_time","_Amount","_amountEXP","_profName","_dataProf","_maxLVL"];
try {
  if !(
    (vehicle player isKindOf "Ship") OR
    ((typeOf(vehicle player) isEqualTo "d3s_uaz_3907") AND surfaceIsWater position player)
  ) throw "Рыбачить можно нахотясь в лодке";

  if (player getVariable ['lifeState',''] in ['RESPAWN','INCAPACITATED','DEAD']) throw "Вы находитесь в агонии!";
  if (player getVariable "restrained")      throw "";
  if (player getVariable "surrender") throw "";

  _zonesArray    = getArray(missionConfigFile >> "RRPConfig_Fishing" >> "zones");
  _DefaultTime   = getNumber(missionConfigFile >> "RRPConfig_Fishing" >> "time");
  _DefaultAmount = getNumber(missionConfigFile >> "RRPConfig_Fishing" >> "Amount");
  _profName      = getText(missionConfigFile >> "RRPConfig_Fishing" >> "prof");

  _curZone       = "";
  {
    if ((player distance (getMarkerPos (_x select 0))) < (_x select 1)) exitWith {_curZone = (_x select 0)};
  } forEach _zonesArray;

  if (_curZone isEqualto "") throw "Вы не в зоне рыбылки!";

  _dataProf = missionNamespace getVariable (_profName);
  _curlvl = _dataProf select 0;
  _maxLVL = 30;

  _time = [_maxLVL,_curlvl,_DefaultTime] call RRPClient_util_countSavingTime;


  if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
    hint format ["DEBUG | time: %1",_time];
    _time = 3;
  };

	_complete = ["Устанавливаем рыболовные снасти...",{(speed player < 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},true,_time,false,true,{}] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw "Действие прерванно";

 _DefaultAmount = ceil (_DefaultAmount);
 if (_DefaultAmount isEqualTo 0) throw "К сожалению, сеть пустая... Попробуйте еще раз";

  _itemsArray   = [];
  for "_i" from 1 to _DefaultAmount step 1  do {
    _RandomItem = [(getArray (missionConfigFile >> "RRPConfig_Fishing" >> "Items"))]  call RRPClient_util_selectRandom;
    _itemsArray pushBack _RandomItem;
  };
  _addItemsArray = _itemsArray call BIS_fnc_consolidateArray;

  {
    _FinalItem   = _x select 0;
    _amountItems = _x select 1;
    for"_i" from 1 to _amountItems step 1 do {[_FinalItem] call RRPClient_inventory_addItemToInventory};
  } forEach _addItemsArray;

  _Amount    = count _itemsArray;
  _amountEXP = [12,_curlvl,_profName] call RRPClient_farm_util_countAmountXP;
  [_profName,_amountEXP] call RRPClient_skills_addXP;

  [_addItemsArray,"physical"] call RRPClient_farm_util_notificationADDitems;
  life_action_inUse = false;
} catch {
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
  life_action_inUse = false;
};
