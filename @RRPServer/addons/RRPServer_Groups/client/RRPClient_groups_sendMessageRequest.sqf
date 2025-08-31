/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
  if (RRPClientGroupInfo isEqualTo []) throw "Данные организации бракованы, обратитесь к администратору!";
  if !("sendMessage" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
  private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
  private _pageSettings = _display displayCtrl 1040;
  private _broadcastEdit =_pageSettings controlsGroupCtrl 14030;
  private _text = ctrlText _broadcastEdit;
  if (_text isEqualTo "") throw "Сообщение не может быть пустым!";
  _text = _text splitString endl joinString "<br/>"; 
  private _countName = count (toArray _text);
	if (_countName < 2) throw "Слишком короткое!";
	if (_countName > 120) throw "Слишком длинное!";
  ["broadcastGroupMessage",[_text]] call RRPClient_system_send;
}catch{
  ["ErrorTitleAndText",["Организация!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
