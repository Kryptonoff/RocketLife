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
private ["_recipe","_deletedItems","_finalItem","_finalItemName","_donatLvl","_time","_complete","_procObj","_amountFinalItem","_XP","_profession","_plrItemsList"];
try {
  _recipe = missionNamespace getVariable ['curRecipe',[]];
  _procObj = missionNamespace getVariable ['procObject',objNull];
  if ((_recipe isEqualTo []) or (isNull _procObj)) throw "Ошибка с определением данных, сообщите админу";

  closeDialog 0;
  if (missionNamespace getVariable ['activeProcessing',false]) throw "Вы уже выполняете это действие!";
  activeProcessing = true;

  uiSleep (selectRandom [0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5]);

  _deletedItems     = _recipe select 0;
  _finalItem        = (_recipe select 1) select 0;
  _amountFinalItem  = (_recipe select 3);
  _profession       = _recipe select 4;
  _finalItemName    = (getText(missionConfigFile >> 'VirtualItems' >> _finalItem >> 'displayName'));
  _donatLvl         = (call life_donator);
  _time             = [_deletedItems,_donatLvl,2.8] call RRPClient_processing_CalculateProcTime;
  _XP               = round(_amountFinalItem/2);
  _plrItemsList     = str(player getVariable ["plrTrunk",[]]);

  if (_finalItem call RRPClient_refinery_isRefineryRes) then {
      _time = round(_time * 0.7);
  };

  _time = ["saveTimeAction",_time] call RRPClient_system_VIP;
  _time = ["processing", _time] call RRPClient_perks_activatePerk;

  _complete = [format ['Перерабатываем %2%1%3, Ожидайте...',_finalItemName,"'","'"],{(str(player getVariable ["plrTrunk",[]]) isEqualTo _plrItemsList) AND {!(speed player > 4)} AND {((player getVariable ["lifeState",""]) isEqualTo "HEALTHY")} and {(alive player)}},true,_time,false,true,{player playActionNow "FT_Act_Craft_Thing";}] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw 'Действие прервано!';
  if !(_plrItemsList isEqualTo str(player getVariable ["plrTrunk",[]])) throw "Нельзя менять содержимое инвентаря во время переработки!";

  {
      [false,_x select 0,_x select 1] call RRPClient_system_handleInv;
  } forEach _deletedItems;
  [true,_finalItem,_amountFinalItem] call RRPClient_system_handleInv;

  if !(_profession isEqualTo "nonProf") then {[_profession,_XP] call RRPClient_skills_addXP};
  [_amountFinalItem, "переработку"] call addXP;
  [format["(%2) PROCESSED %3 IN %4 X%5 |MOD:player|VIP:%6|PROF:%7|XP:%8",(name player),(getPlayerUID player),_deletedItems,_finalItem,_amountFinalItem,(call life_donator),_profession,_XP],"ProcessingLog"] remoteExecCall ["RRPServer_system_logIt",2];
  activeProcessing = false;
} catch {
  ["ErrorTitleAndText", ["Действие прервано!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
  activeProcessing = false;
};
