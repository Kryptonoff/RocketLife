/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_display","_slide","_mainGroup","_pagePlayers","_memberList","_post","_leave"];
try 
{ 
  _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
  _mainGroup = _display displayCtrl 24001;
  _slide = _mainGroup controlsGroupCtrl 37000;
  _pagePlayers = _slide controlsGroupCtrl 1038; 
  _memberList = _pagePlayers controlsGroupCtrl 12036; 
  _uid = _memberList lnbData [lnbCurSelRow _memberList,0]; 
  _post = (getPlayerUID player) call RRPClient_groups_getPostGroup; 
  if (_uid isEqualTo "") throw "Вы никого не выбрали"; 
  if (getPlayerUID player isEqualTo _uid) throw "Вы не можете выгнать самого себя, чтобы покинуть организацию перейдите в раздел Настройки";
  if !("canKick" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!"; 
  if ((_uid call RRPClient_groups_getPostGroup) isEqualTo 2) throw "Выбранный член организации является заместителем!";
  
  [ 
    findDisplay 46, 
    { 
      ["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast; 
      ["kickPlayer",[_this select 0]] call RRPClient_system_send; 
    },[_uid],
    "Выгнать?", 
    format["Вы уверены что хотите выгнать '%1'?",[RRPClientGroupInfo,_uid] call RRPClient_groups_util_getPlayerName] 
  ] call RRPClient_util_prompt; 
}catch{ 
  ["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast; 
}; 
