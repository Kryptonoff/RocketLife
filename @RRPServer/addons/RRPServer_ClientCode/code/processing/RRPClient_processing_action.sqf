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

private ["_vItemSpace","_useCar","_userID","_donatLvl","_recipe","_deletedItems","_finalItem","_typeFinalitem","_complete","_finalItemName","_time","_curvehicle","_oldTrunkVeh","_AllRec","_XP","_profession"];
try {
_recipe  = missionNamespace getVariable ["curRecipe",[]];
_AllRec  = missionNamespace getVariable ["readyRecipes",[]];
_procObj = missionNamespace getVariable ["procObject",objNull];
if ((_recipe isEqualTo []) or (_AllRec isEqualTo []) or (isNull _procObj)) throw "Ошибка с определением данных, сообщите админу";

if !([getText(missionConfigFile >> "CFGProcessing" >> str _procObj >> "proccessingInVehicle")] call RRPClient_util_conditionsCheck) Exitwith {
    ["WarningTitleAndText", ["Переработка!",getText(missionConfigFile >> "CFGProcessing" >> str _procObj >> "proccessingInVehicleMsg")]] call SmartClient_gui_toaster_addTemplateToast;
};

closeDialog 0;
if (missionNamespace getVariable ["activeProcessing",false]) throw "Вы уже выполняете это действие!";
activeProcessing = true;

uiSleep (selectRandom [0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5]);

_deletedItems    = _recipe select 0;
_finalItem       = (_recipe select 1) select 0;
_typeFinalitem   = (_recipe select 1) select 1;
_amountFinalItem = (_recipe select 3);
_curvehicle      = _AllRec select 1;
_oldTrunkVeh     = _AllRec select 2;
_profession      = _recipe select 4;
_finalItemName   = (getText(missionConfigFile >> "VirtualItems" >> _finalItem >> "displayName"));

_donatLvl = (call life_donator);
_time = [_deletedItems,_donatLvl,2.5] call RRPClient_processing_CalculateProcTime;
_XP = if !(_profession isEqualTo "nonProf") then {round(_amountFinalItem/2)} else {-1};



if (_finalItem call RRPClient_refinery_isRefineryRes) then {
    _time = round(_time * 0.7);
};

_time = ["saveTimeAction",_time] call RRPClient_system_VIP;

[_curvehicle,true] call RRPClient_system_lockvehicle;

_userID = _curvehicle getVariable ["ProcCarUserUID","-1"];
if (_userID isEqualTo "-1") then {
  _curvehicle setVariable ["ProcCarUserUID",getPlayerUID player, true];
  _useCar = false;
} else {
  if (_userID isEqualTo (getPlayerUID player)) then {_useCar = false} else {
   _useCar = if ([_userID] call RRPClient_system_isUIDActive) then {true} else {false};
  };
};
_userID = _curvehicle getVariable ["ProcCarUserUID","-1"];

_newTrunk = [(_oldTrunkVeh select 0),_deletedItems,_finalItem,_amountFinalItem] call RRPClient_processing_addVirtualItems;
_vItemSpace = (([_curvehicle] call RRPClient_system_vehicleWeight) select 0);

if ((_newTrunk select 1) > _vItemSpace) throw format ["После переработки будет недостаточно места в инвентаре вашего авто. Найдите авто на %1 слотов что бы продолжить",((_newTrunk select 1) - _vItemSpace)];
if (_useCar) throw "Данный автомобиль уже используется другим игроком!";
if !(locked _curvehicle isEqualTo 2) throw "Во время переработки автомобиль должен быть закрытым";
if (speed _curvehicle > 1) throw "Во время переработки автомобиль должен быть не на ходу";
if (isNull _curvehicle) throw "??";
if !(crew _curvehicle isEqualTo []) throw "Во время переработки в салоне не должно быть игроков";
if !(alive _curvehicle) throw "Во время переработки автомобиль должен быть целым";
if (life_inwarzone) throw "В регионе введено военное положение, переработка ресурса невозможна!";

["infoTitleAndText", ["Важно!", "Во время переработки не отходите от переработчика на более чем 50м, иначе действие прервется"]] call SmartClient_gui_toaster_addTemplateToast;
_complete = [
  format ["Перерабатываем %2%1%3, Ожидайте...",_finalItemName,"'","'"],
  {((locked _curvehicle) isEqualTo 2) and {!(speed _curvehicle > 3)} and {!(isNull _curvehicle)} and {(crew _curvehicle isEqualTo [])} and {(alive _curvehicle)} and {(_userID isEqualTo (getPlayerUID player))} and {((player getVariable ["lifeState",""]) isEqualTo "HEALTHY")} and {(alive player)} and {((player distance _procObj) < 50)}},
  true,
  _time,
  false,
  true,
  {}
] call RRPClient_system_newProgressBar;
if (isNil "_complete") throw "Действие прервано";
if !(_complete) throw "Действие прервано!";

if !(_profession isEqualTo "nonProf") then {[_profession,_XP] call RRPClient_skills_addXP};
if !((_curvehicle getVariable ["Trunk",[[],0]]) isEqualto _oldTrunkVeh) throw "Во время переработки нельзя взаимодействовать с багажником и изменять его содержимое!";
if (_typeFinalitem isEqualTo "VirtualItem") then {[_curvehicle,"Trunk",_newTrunk] call CBA_fnc_setVarNet;["successTitleAndText", ["Переработка", format ["%1 кол-ве %2 произведены...",_finalItemName,_recipe select 3]]] call SmartClient_gui_toaster_addTemplateToast};
_curvehicle setVariable ["ProcCarUserUID",nil, true];
activeProcessing = nil;
[_amountFinalItem, "переработку"] call addXP;
[format["(%2) PROCESSED %3 IN %4 X%5 |MOD:car|VIP:%6|PROF:%7|XP:%8",(name player),(getPlayerUID player),_deletedItems,_finalItem,_amountFinalItem,(call life_donator),_profession,_XP],"ProcessingLog"] remoteExecCall ["RRPServer_system_logIt",2];
} catch {
  if ((_curvehicle getVariable ["ProcCarUserUID","-1"]) isEqualTo getPlayerUID player) then {_curvehicle setVariable ["ProcCarUserUID",nil,true]};
  ["ErrorTitleAndText", ["Действие прервано!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
  activeProcessing = nil;
};
