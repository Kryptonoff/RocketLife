/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
  private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
  private _pagePlayers = _display displayCtrl 1038;
  private _memberList = _pagePlayers controlsGroupCtrl 12036;
  private _uid = _memberList lnbData [lnbCurSelRow _memberList,0];
  private _invite = true;
  private _post = (getPlayerUID player) call RRPClient_groups_getPostGroup;
  if (_uid isEqualTo "") throw "Вы никого не выбрали!";
  private _postSel = _uid call RRPClient_groups_getPostGroup;
  if !(_post isEqualTo 1) throw "Назначать заместителем может только глава организации!";
  if (_postSel isEqualTo 1) throw "Вы и так глава организации, что Вам еще нужно?";
  if (_uid in (RRPClientGroupInfo get "deputys")) then {_invite = false;};
  if (_invite) then
  {
    if (count(RRPClientGroupInfo get "deputys") > 2) throw "Заместителей может быть не более 3х человек!";
  };
  _display setVariable ["temp",[_uid,_invite]];
  [
    (uiNamespace getVariable ["RRPDialogTablet",displayNull]),
    {
      ["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
      ["setDeputy",[_this#0,_this#1]] call RRPClient_system_send;
    },[_uid,_invite],
    if !(_uid in RRPClientGroupInfo get "deputys") then{"Назначить заместителем?"}else{"Разжаловать?"},
    if !(_uid in RRPClientGroupInfo get "deputys") then{format ["Назначить заместителем %1 организации %2?",([RRPClientGroupInfo,_uid] call RRPClient_groups_util_getPlayerName),RRPClientGroupInfo#0]}else{format ["Разжаловать %1 в организации %2?",([RRPClientGroupInfo,_uid] call RRPClient_groups_util_getPlayerName),RRPClientGroupInfo get "name"]}
  ] call RRPClient_util_prompt;

}catch{
  ["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
