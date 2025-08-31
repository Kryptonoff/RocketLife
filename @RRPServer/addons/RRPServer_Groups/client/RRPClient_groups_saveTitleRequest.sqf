/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_display","_page","_box","_value","_post","_ctName","_perms","_config","_cb","_countText"];

try
{
  _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
  if !(call RRPClient_groups_isPrem) throw "Эта функция доступна только для премиальных организаций";
  _page = _display displayCtrl 1039;
  _box = _page controlsGroupCtrl 13038;
  _value = _box lbValue (lbCurSel _box);
  _post = (getPlayerUID player) call RRPClient_groups_getPostGroup; 
  if !(_post in [1,2])  throw "Редактировать настройки доступа могут только глава и заместитель организации!";
  _ctName =_display displayCtrl 13036;
  
	private _charsCheck = [ctrlText _ctName,getText(missionConfigFile >> "CfgGroups" >> "allowAlphabet")] call RRPClient_util_containsForbiddenCharacter;
	if !(_charsCheck isEqualTo -1) throw format ["Нельзя использовать символ '%1'",_charsCheck];

  _countText = count(toArray(ctrlText _ctName));
  if (_countText > 17) throw "Допустимо не больше 10 символов";

  _perms = [];
  {
    _config = _x;
    _cb = _page controlsGroupCtrl (getNumber(_x >> "idcCB"));
    if (cbChecked _cb) then
    {
      _perms pushBackUnique (toUpper(configName _config));
    };
  }forEach ("true" configClasses (getMissionConfig "CfgGroups" >> "permissions"));
  ["saveTitle",[_value,ctrlText _ctName,_perms]] call RRPClient_system_send;

}catch{
  ["ErrorTitleAndText",["Организация!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
