/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
  private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
  private _mainGroup = _display displayCtrl 24001;
  private _slide = _mainGroup controlsGroupCtrl 37000;
  private _pagePlayers = _slide controlsGroupCtrl 1038;
  private _memberList = _pagePlayers controlsGroupCtrl 12036;
  private _post = (getPlayerUID player) call RRPClient_groups_getPostGroup;
  if (_post isEqualTo 1) throw "Прежде чем покинуть организации Вам нужно передать должность лидера!";
  if (_post isEqualTo 2) throw "Прежде чем покинуть организации, необходимо снять должность заместителя!";
  if ("canLeave" call RRPClient_groups_util_permCheck) throw "Вы не можете самостоятельно покинуть организацию!";
  [ 
    findDisplay 46, 
    { 
      ["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast; 
      ["leaveFromGroup",[]] call RRPClient_system_send; 
    },[_uid],
    "Уходите?", 
    format["Вы уверены что хотите покинуть организацию '%1'? Это действие необратимо!",RRPClientGroupInfo get "name"] 
  ] call RRPClient_util_prompt; 
}catch{
  ["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
