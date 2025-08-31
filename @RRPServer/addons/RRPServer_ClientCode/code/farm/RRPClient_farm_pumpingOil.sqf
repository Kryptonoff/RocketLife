/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

private ["_vehicle"];
try {
  private ["_prof","_amountDefault","_zone","_defaultTime","_item","_curWeight","_maxWeight","_userID"];
  _vehicle = param [0,objNull,[objNull]];
  if (player distance _vehicle > 25) throw "Вы должны быть рядом с техникой";
  if !(isNil "isOilPumping") throw ["Вы уже добываете!",true];
  if (isNull _vehicle) throw ["Техника не определена",false];
  if !(crew _vehicle isEqualTo []) throw ["Для старта добычи в технике не должно быть пассажиров!",false];
  if !(alive _vehicle) throw ["Ваша техника в непригодном состоянии!",false];
  if !(_vehicle in life_vehicles) throw ["У вас должны быть ключи от добытчика!",false];

  _zone = "";
  {
    {
      if ((player distance (getMarkerPos (_x select 0))) < (_x select 1)) exitWith {_zone = (_x select 0)};
    } forEach (getArray(_x >> 'zones'));

    if !(_zone isEqualTo "") Exitwith {
      _prof = (getText(_x >> 'prof'));
      _item = (getText(_x >> 'item'));
      _defaultTime = (getNumber(_x >> 'oneTick'));
      _amountDefault = (getNumber(_x >> 'amountEveryTick'));
    };
  } forEach ('true' configClasses (missionConfigFile >> 'RRPConfig_oilPumping'));
  if (_zone isEqualTo "") throw ["Вы находитесь не в зоне добычи!",false];

  [_vehicle,true] call RRPClient_system_lockvehicle;
  private _weight = [_vehicle] call RRPClient_system_vehicleWeight;
  if ((_weight # 1) >= (_weight # 0)) throw ["Недостаточно места в хранилище для начала добычи",false];

  _userID = _vehicle getVariable ["punpingVehAbuse","-1"];
	if ((_userID isEqualTo "-1") OR {!([_userID] call RRPClient_system_isUIDActive)} || {!(_userID isEqualTo getPlayerUID player)}) then {
	  _vehicle setVariable ["punpingVehAbuse",getPlayerUID player, true];
	} else {
    throw ["Данный автомобиль уже используется другим игроком!",true]
  };

  private ["_profName","_dataProf","_curlvl","_maxLVL","_time","_timeXP","_multiplierCombo","_chance","_isCombo","_amount"];
  _profName = "Oil_Prof";
  _dataProf = missionNamespace getVariable (_profName);
  _curlvl = _dataProf select 0;
  _maxLVL = getNumber(missionConfigFile >> "CfgSkills" >> _profName >> "maxLevel");

  _timeXP = [_maxLVL,_curlvl,_defaultTime] call RRPClient_util_countSavingTime;
  _time = _timeXP;

  if ((call (life_adminlevel) > 0) and {!((getPlayerUID player) isEqualTo "76561197984276591")}) then {
    systemChat format ["default:%1 | +XP:%2 | +VIP:%3 | Max-lvl:%4 | current-lvl:%5",_defaultTime,_timeXP,_time,_maxLVL,_curlvl];
    _time = 5;
  };

  isOilPumping = true;
  while
  {
      ((locked _vehicle) isEqualTo 2) AND
      {!(speed _vehicle > 3)} AND
      {!(isNull _vehicle)} AND
      {(crew _vehicle isEqualTo [])} AND
      {(alive _vehicle)} AND
      {((player getVariable ["lifeState",""]) isEqualTo "HEALTHY")} AND
      {(alive player)} AND
      {!(isNil "isOilPumping")}
  }
    do
  {
      if !((_vehicle getVariable ["punpingVehAbuse","-1"]) isEqualTo (getPlayerUID player)) throw ["Уже другой игрок использует данную техинку!",false];
      uiSleep _time;

      _amount = _amountDefault;
      _amount = [_amount] call RRPClient_util_countAmountItems;
      private _weight = [_vehicle] call RRPClient_system_vehicleWeight;
      _maxWeight = (_weight # 0);
      _curWeight = (_weight # 1);
      [_vehicle,"Trunk",([((_vehicle getVariable ["Trunk",[[],0]] )select 0),[],_item,_amount] call RRPClient_processing_addVirtualItems)] call CBA_fnc_setVarNet;

      private _addExpAmount = [_prof,3,_amount] call RRPClient_farm_countAddExp;
      [_prof,_addExpAmount] call RRPClient_skills_addXP;
      [(_amount * 2), "добычу"] call addXP;

      ["SuccessTitleAndText", [
        format ["+ «%1» %2 шт",(getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")),_amount],
        format ["Инвентарь %1%2",(100 * (([_vehicle] call RRPClient_system_vehicleWeight select 1) / ([_vehicle] call RRPClient_system_vehicleWeight select 0))),"%"]
      ]] call SmartClient_gui_toaster_addTemplateToast;
      if (_maxWeight <= _curWeight) throw ["Цистерна заполнена!",false];
  };

  isOilPumping = nil;
  _vehicle setVariable ["punpingVehAbuse",nil,true];
} catch {
  _exception params [["_t",""],["_d",true]];

  ["ErrorTitleAndText", ["Ошибка!", _t]] call SmartClient_gui_toaster_addTemplateToast;
  if !(_d) then
  {
    if ((_vehicle getVariable ["punpingVehAbuse","-1"]) isEqualTo getPlayerUID player) then {_vehicle setVariable ["punpingVehAbuse",nil,true]};
    _vehicle setVariable ["punpingVehAbuse",nil,true];
    isOilPumping = nil;
  };
};
