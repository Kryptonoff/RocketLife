/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ['_amount','_time','_FinalItem','_typeItem','_profName','_complete','_index','_curHerb','_curObjectList'];
try{
    _curHerb = cursorTarget;
    if !((typeOf _curHerb) isEqualTo (InfoList # 5)) throw "Ошибка при определении растения!";
    if (player distance _curHerb > 4) throw "Подойдите ближе к растению!";

    _amount    = InfoList # 6;
    _time      = InfoList # 7;
    _FinalItem = InfoList # 2;
    _typeItem  = InfoList # 3;
    _profName  = InfoList # 1;


    (_profName call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];
    private _time = ([_maxLvl,_curLvl,_time] call RRPClient_util_countSavingTime);

    life_action_inUse = true;
    player switchMove "medium_resource";
    _complete = ["Срываем растение...",{!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player) AND (player distance _curHerb < 4)},false,_time * RRPClientBuffs_CoefFarmTime,false,true,{}] call RRPClient_system_newProgressBar;
    if (isNil "_complete") throw "";
    if !(_complete) throw "";

    _Amount = ceil(random _Amount);
    _Amount = [_Amount] call RRPClient_util_countAmountItems;

    if (_typeItem isEqualto 'virtual') then {
      if !([true,_FinalItem,_Amount] call RRPClient_system_handleInv) then {
        ['WarningTitleAndText', ['Инвентарь', 'Ваш инвентарь переполнен!']] call SmartClient_gui_toaster_addTemplateToast;
      } else {
        [[[_FinalItem,_Amount]],'virtual',0] call RRPClient_farm_util_notificationADDitems;
        _xp = [5,_curLvl,_profName] call RRPClient_farm_util_countAmountXP;
        [_profName,_xp] call RRPClient_skills_addXP;
				[5, "добычу"] call addXP;
      };
    } else {
      for'_i' from 1 to _Amount step 1 do {[_FinalItem] call RRPClient_inventory_addItemToInventory};
      [[[_FinalItem,_Amount]],'',0] call RRPClient_farm_util_notificationADDitems;
    };

    {
    if ((_x select 0) isEqualTo _curHerb) ExitWith {_index = _forEachIndex};
    } forEach subArrHerbs;
    _curObjectList = subArrHerbs select _index;
    deleteVehicle (_curObjectList select 0);
    deleteMarkerLocal (_curObjectList select 1);
    subArrHerbs = subArrHerbs - [_curObjectList];

    life_action_inUse = false;
    player switchMove "";
} catch {
    player switchMove "";
    ['WarningTitleAndText', ['Травник', _exception]] call SmartClient_gui_toaster_addTemplateToast;
    life_action_inUse = false;
};
