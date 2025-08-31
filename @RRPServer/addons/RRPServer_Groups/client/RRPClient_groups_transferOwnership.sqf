try{
  if (call RRPClient_groups_isPrem) throw "Нельзя переназначить главу в официальной организации!";
  private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
  private _pagePlayers = _display displayCtrl 1038;
  private _memberList = _pagePlayers controlsGroupCtrl 12036;
  private _uid = _memberList lnbData [lnbCurSelRow _memberList,0];
  private _leader = RRPClientGroupInfo get "leader";
  if (getPlayerUID player isNotEqualTo _leader) throw "Вы не можете переназначить лидера организации!";
  private _post = (getPlayerUID player) call RRPClient_groups_getPostGroup;
  if (_uid isEqualTo "") throw "Вы никого не выбрали!";
  private _postSel = _uid call RRPClient_groups_getPostGroup;
  if (_postSel isEqualTo 1) throw "Вы и так глава организации, что Вам еще нужно?";
  if (_uid isEqualTo (RRPClientGroupInfo get "leader")) throw "Вы и так глава организации, что Вам еще нужно?";
  [
    (uiNamespace getVariable ["RRPDialogTablet",displayNull]),
    {
      ["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
	  ["transferOwnership",[_this#0]] call RRPClient_system_send;
	},[_uid],
	"Передать управление организацией?",
	format ["Вы хотите передать %1 управление организации %2?",([RRPClientGroupInfo,_uid] call RRPClient_groups_util_getPlayerName),RRPClientGroupInfo get "name"]
  ] call RRPClient_util_prompt;

}catch{
  ["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
