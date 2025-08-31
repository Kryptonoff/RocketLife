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
private ["_vehicle","_weight","_zonesArray","_ratedproductivity","_prof","_curZone","_radius","_item","_DefaultTime","_curlvl","_maxLVL","_xp","_amountItems","_time","_FNC_saveTime","_FNC_complete","_FNC_calculateProductivity","_curProductivity","_FNC_condition"];
_vehicle = vehicle player;
if (missionNamespace getVariable ["CombineIsActive",false]) exitWith {};
try {
  if (isNull _vehicle) throw "??";
  if (_vehicle isEqualTo player) throw "Вы должны находится в технике";
  if !((typeOf _vehicle) in ["New_Holland_TC590_civ","New_Holland_TC590_civ_BE"]) throw "Данная техника не подходит для сбора урожая";
  if !(alive _vehicle) throw "Во время переработки автомобиль должен быть целым";
  if (((speed _vehicle) < 5) or ((speed _vehicle) > 22)) throw "Для сбора урожая скорость комбайна должна быть более 5км/ч и менее 20км/ч";
  if ((_vehicle animationPhase 'jatka' < 0.5) and (_vehicle animationPhase 'tank' > 0.95)) throw "Сначала включите жатку";
  _weight = [_vehicle] call RRPClient_system_vehicleWeight;

  _zonesArray = getArray (missionConfigFile >> "RRPConfig_Combine" >> "zones");
  _curZone = "";
    {
      if ((player distance (getMarkerPos (_x select 0))) < (_x select 1)) exitWith {
        _curZone = (_x select 0);
        _radius  = (_x select 1);
        _item    = (_x select 2);
        };
    } forEach _zonesArray;
    if (_curZone isEqualto "") throw "Для сбора ресурсов комбайн должен находится в зоне добычи";

  _ratedproductivity = getNumber (missionConfigFile >> "RRPConfig_Combine" >> "ratedproductivity");
  _prof = getText (missionConfigFile >> "RRPConfig_Combine" >> "prof");
  _DefaultTime = round(60 / _ratedproductivity);
  _amountItems = 1;
  _amountItems = [_amountItems] call RRPClient_util_countAmountItems;

  (_prof call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];

  _FNC_saveTime = {
    _time = [_maxLvl,_curLvl,_DefaultTime] call RRPClient_util_countSavingTime;
    _time
  };

  _FNC_complete = {
    if ([_vehicle,_item,_amountItems,true] call RRPClient_system_vehicleInv) then {
      [[[_item,_amountItems]],'virtual'] call RRPClient_farm_util_notificationADDitems;
    };
  };

  _FNC_calculateProductivity = {
    _time = call _fnc_saveTime;
    _curProductivity = round(60/_time);
    _curProductivity
  };

  _FNC_condition = {(!(isNull _vehicle) and !(_vehicle isEqualTo player) and (alive _vehicle) and !((speed _vehicle) < 5) and !((speed _vehicle) > 22) and (player distance (getMarkerPos _curZone)) < _radius)};

  CombineIsActive = true;
  ["InfoTitleAndText", ["Подсказка!",  format ["Соблюдайте скоростной режим, зажимая <t font='RobotoCondensedBold'>CTRL</t>, ограничение: <t font='RobotoCondensedBold'>5-22км/ч</t>.<br/><br/>Заполненность: %2/%1<br/>Продуктивность: %3 шт/мин<br/>",_weight select 0, _weight select 1,call _FNC_calculateProductivity]]] call SmartClient_gui_toaster_addTemplateToast;


  while {call _FNC_condition} do {

  uiSleep (call _fnc_saveTime);

    if ((call (life_adminlevel) > 0) and !((getPlayerUID player) isEqualTo "76561197984276591")) then {
      hint parseText format ["<t size='2.0'>DEBUG</t><br/><br/><t font='RobotoCondensedBold'>Продуктивность:</t> %1 предмета/мин<br/><t font='RobotoCondensedBold'>Текущий уровень:</t> [%2lVL, %3XP]<br/><t font='RobotoCondensedBold'>VIP:</t> %4 LVL<br/>",call _FNC_calculateProductivity,(missionNamespace getVariable (_prof) select 0),(missionNamespace getVariable (_prof) select 1),(call life_donator)]
    };

    if (call _FNC_condition) then  {
      _time = call _fnc_saveTime;
      call _fnc_complete;
      (_prof call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];
      _xp = [3,_curLvl,_prof] call RRPClient_farm_util_countAmountXP;
      [_prof, _xp] call RRPClient_skills_addXP;
    };
  };
      CombineIsActive = nil;
      ["WarningTitleAndText", ["Сбор остановлен!", ""]] call SmartClient_gui_toaster_addTemplateToast;
} catch {
    CombineIsActive = nil;
    ["ErrorTitleAndText", ["Сбор прерван!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
