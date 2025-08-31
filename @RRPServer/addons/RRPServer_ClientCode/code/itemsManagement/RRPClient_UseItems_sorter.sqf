/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_fill','_fillCond','_fillMsg','_drugAddict','_wait','_title','_curcd','_cd','_FoodAmount','_complete','_actionList','_sound','_animation','_titleText','_usedItem','_thirstAmount','_FoodAmount','_diareaChance','_newItem','_SprintCoef','_StaminaCoef','_CargoCoef','_healCoef','_gHealCoef','_BoostFarmCoef'];
_usedItem = param [0,'',['']];
_title    = '';

try
{
  if (_usedItem isEqualto '') throw 'Неопределенный предмет, сообщите админу!';
  if (life_action_inUse OR {(call RRPClient_system_isInterrupted)}) throw 'Вы уже чем-то заняты!';
  // if !((currentWeapon player) isEqualTo '') throw 'Ваши руки должны быть свободными!';

  _cd = getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'CD');
  _curcd = 0;

  if (_cd > 0) then {
      _curcd = [_usedItem,_cd] call RRPClient_UseItems_buffs_checkCD;
  };

  _wait = _cd - _curcd;
  if (_curcd > 0) then {_title = format ['Осталось %1 мин',([_wait,'MM:SS'] call BIS_fnc_secondsToString)]};
  if (_curcd > 0) throw format ['Этот предмет можно использовать раз в %1 мин',([_cd,'MM:SS'] call BIS_fnc_secondsToString)];


  _thirstAmount  = ['otherBuffoutEffects',getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'thirst')] call RRPClient_system_VIP;
  _FoodAmount    = ['otherBuffoutEffects',getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'hunger')] call RRPClient_system_VIP;
  _diareaChance  = getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'diareaChance');
  _drugAddict    = getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'drugAddict');

  _SprintCoef = getArray(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'Sprint');
  // _SprintCoef    = [['otherBuffoutEffects', _SprintCoef # 0] call RRPClient_system_VIP, ['otherBuffoutEffects', _SprintCoef # 1] call RRPClient_system_VIP];

  _StaminaCoef   = ['otherBuffoutEffects',getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'Stamina')] call RRPClient_system_VIP;

  _CargoCoef = getArray(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'Cargo');
  _CargoCoef     = [['otherBuffoutEffects', _CargoCoef # 0] call RRPClient_system_VIP,['otherBuffoutEffects', _CargoCoef # 1] call RRPClient_system_VIP];

  _healCoef      = ['otherBuffoutEffects', getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'Heal')] call RRPClient_system_VIP;

  _gHealCoef = getArray(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'Gheal');
  _gHealCoef     = [['otherBuffoutEffects', _gHealCoef # 0] call RRPClient_system_VIP,['otherBuffoutEffects', _gHealCoef # 1] call RRPClient_system_VIP];

  _BoostFarmCoef = getArray(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'BoostFarm');
  _BoostFarmCoef = [['otherBuffoutEffects',_BoostFarmCoef # 0] call RRPClient_system_VIP,['otherBuffoutEffects',_BoostFarmCoef # 1] call RRPClient_system_VIP];

  _effectScript = getText(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'visualEffest');

  _newItem       = getText(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'newItem');
  _fill       = getNumber(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'fill');
  _fillCond   = getText(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'fillCondition');
  _fillMsg    = getText(missionConfigFile >> 'cfgItemUse' >> _usedItem >> 'Interactions' >> 'fillMessage');

   if ((_thirstAmount isEqualTo 0)
   and (_FoodAmount    isEqualTo 0)
   and (_SprintCoef    isEqualTo [])
   and (_StaminaCoef   isEqualTo 0)
   and (_CargoCoef     isEqualTo [])
   and (_healCoef      isEqualTo 0)
   and (_gHealCoef     isEqualTo [])
   and (_BoostFarmCoef isEqualTo [])) throw 'Данный предмет не дает никаких еффектов';

   if (_fill isEqualTo 1 AND ([_fillCond] call RRPClient_util_conditionsCheck)) exitWith {
       private _complete = ["Набираю воду...",{true},true,6,false,true,{call RRPClient_animation_kneelWork}] call RRPClient_system_newProgressBar;
       if (isNil "_complete") throw "Действие прервано";
       if !(_complete) throw 'Действие прервано!';
       if (_complete) then {
         _usedItem call RRPClient_useItems_fillWater;
       };
   };

   RRPClientDiarrhea = if ([_diareaChance] call RRPClient_farm_util_randomizer) then {true} else {false};
   if (RRPClientDiarrhea) then {
      call RRPClient_session_saveStats;
   };

   RRPClientNarcomania = if ([_drugAddict] call RRPClient_farm_util_randomizer) then {ceil(random 2)} else {0};
   if (RRPClientNarcomania > 0) then {
       call RRPClient_session_saveStats
   };

  _actionList = [_usedItem] call RRPClient_UseItems_defineActionType;
  _sound      = _ActionList select 0;
  _animation  = _ActionList select 1;
  _titleText  = _ActionList select 3;


  player say3D _sound;
  player playAction _animation;

  if (call RRPClient_system_isInterrupted) throw '';
  if !([_usedItem] call RRPClient_system_removeItem) throw 'Не удалось удалить предмет';

  if !(_newItem isEqualto '') then {
      [_newItem] call RRPClient_inventory_addItemToInventory;
  };

  _complete = [_titleText,{true},true,6,false,true,{}] call RRPClient_system_newProgressBar;
    if (isNil "_complete") throw "Действие прервано";
    if !(_complete) throw 'Действие прервано!';


  if !(_FoodAmount isEqualTo 0) then {
    ['food',_FoodAmount] call RRPClient_UseItems_buffs_eatingUP
  };
  if !(_thirstAmount isEqualTo 0)  then {
    ['drink',_thirstAmount] call RRPClient_UseItems_buffs_eatingUP
  };
  if !((_SprintCoef # 0) isEqualTo 0) then {
    [_SprintCoef # 0,_SprintCoef # 1] spawn RRPClient_UseItems_buffs_SprintUP;
  };
  if !((_CargoCoef # 0) isEqualTo 0) then {
    [_CargoCoef # 0,_CargoCoef # 1] call RRPClient_UseItems_buffs_CargoUP;
  };
  if !((_gHealCoef # 0) isEqualTo 0) then {
    [_gHealCoef # 0,_gHealCoef # 1] spawn RRPClient_UseItems_buffs_gHealUP
  };
  if !(_healCoef isEqualTo 0) then {
    [_healCoef] call RRPClient_UseItems_buffs_healUP
  };
  if !(_StaminaCoef isEqualTo 0) then {
     [_StaminaCoef] spawn RRPClient_UseItems_buffs_StaminaUP
   };
  if !((_BoostFarmCoef # 0) isEqualTo 0) then {
     [_BoostFarmCoef # 0,_BoostFarmCoef # 1] spawn RRPClient_UseItems_buffs_boostFarmUP
  };
  if (_effectScript isNotEqualTo "") then {
    [] spawn (missionNamespace getVariable [_effectScript,{true}]);
  };



} catch {
    life_action_inUse = false;
    _title = if (_title isEqualto '') then {'Внимание!'} else {_title};
	 ['WarningTitleAndText',[_title,_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
