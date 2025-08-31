/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

try
{
    private _uid = getPlayerUID player;
    private _post = _uid call RRPClient_groups_getPostGroup;
    if !("canMarker" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
    [
      (uiNamespace getVariable ["RRPDialogTablet",displayNull]),
      {
        ["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
        ["removeAllMarkers",[]] call RRPClient_system_send;
      },[],
      "Удалить?",
      "Удалить все маркеры и линии на карте?"
    ] call RRPClient_util_prompt;
  }catch{
    ["ErrorTitleAndText",["Организация!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
