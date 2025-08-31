/*
	Filename: 	RRPClient_system_dropAllAnimat.sqf
	Project: 	Rimas Altis Life RPG
*/
private ["_target","_canRob","_rober","_PID","_complete"];
_target = param [0,objNull,[objNull]];

try {
  if (isNull _target) throw "Такого игрока не существует!";
  if !(isPlayer _target) throw "??";
  if (player distance _target > 5) throw "Подойдите ближе к жертве на расстояние не более 5 метров";
  if (([player] call RRPClient_system_isSafeZone) # 0) throw "Вы находитесь в зеленой зоне!";
  if ([player] call RRPClient_system_isShopNear) throw "Вы находитесь рядом с продавцом!";
  if (player getVariable ["isBeginner",false]) throw format ["Вы не можете грабить! Необходимо отыграть еще %1 минут для открытия возможности грабежей",(getNumber(missionConfigFile >> "LifeCfgSettings" >> "beginnerTime") - (player getVariable ["PlayerTime",0]))];
  if (_target getVariable ["isBeginner",false]) throw "Нельзя грабить новобранцев!";

  _canRob = false;
  _rober = _target getVariable ["robber",""];
  _PID = getPlayerUID player;

  _canRob = if (_rober isEqualTo "") then {true} else {if (_rober isEqualTo _PID) then {true} else {false}};
  if !_canRob throw "Уже кто-то грабит";
  _target setVariable ["robber",getPlayerUID player,true];

  _complete = ["Выворачиваем карманы , ожидайте...",{
    !(speed player > 4) AND 
    ((player getVariable ["lifeState",""]) in ["HEALTHY","INCAPACITATED"]) AND 
    (alive player) AND 
    ((_target getVariable ["robber",""]) isEqualTo _PID) AND 
    (player distance _target < 5)
  },true,(["saveTimeAction",15] call RRPClient_system_VIP),false,true,{call RRPClient_animation_kneelWork;}] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw 'Действие прервано!';

  [player] remoteExec ["RRPClient_system_dropAll",_target];

  _target setVariable ["robber",nil,true];
  [20,"ограбление"] call addXP;
} catch {
  _target setVariable ["robber",nil,true];
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
