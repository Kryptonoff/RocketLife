
private ['_display','_pIdc','_parentBtn','_yPos','_mod','_parentPatch','_ctrlCursor','_conditionMod'];
params [
  ["_config",missionConfigFile]
];
try {
  if !(createDialog 'RRPDialogEmpty') throw "Ошибка при создании диалога";
  _display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
  _display displayAddEventHandler ["unload","uiNamespace setVariable ['RRPDialogEmpty', displayNull]; false call RRPClient_gui_util_blur;"];

  _pIdc = 1001;
  _yPos = 0.4;

  _parentPatch = ("true" configClasses _config);
  if (_parentPatch isEqualTo []) throw "Неизвестные тип диалога, сообщите админу!";

  private _btnCreated = 0;
  {
    private _condition = (getText (_x >> "condition"));
    if (_condition isEqualTo "") then {_condition = "true";};
    if (call (compile _condition)) then 
    {
      _btnCreated = _btnCreated + 1;
      private _icon = (getText (_x >> "icon"));
      _icon = if (_icon isEqualTo "") then {"\RRP_icons\interaction\default.paa"} else {_icon};
      private _title = (getText (_x >> "title"));
      _parentBtn = _display ctrlCreate ['RRP_btn_interaction',(_pIdc + 1)];
      _parentBtn ctrlSetFont 'RobotoCondensedBold';
      _parentBtn buttonSetAction format ["['%1'] call RRPClient_anims_pose;closeDialog 0",configName _x];
      _parentBtn setVariable ["path",("true" configClasses _x)];
      _parentBtn setVariable ["isParentBtn", true];
      private _empty = if !((_parentBtn getVariable ["path",[]]) isEqualTo []) then {""} else {"	"};
      _parentBtn ctrlSetStructuredText parseText format ["<t size='1' align='center' valign='middle'>%2%4<t align = 'right'><img image = '%3'></ img></t></t><t><img image = '%1'></ img></t>",_icon,_title,(if ((_parentBtn getVariable ["path",[]]) isEqualTo []) then {""} else {"\RRP_icons\interaction\subButton.paa"}),_empty];
      _parentBtn ctrlSetPosition [0.56,_yPos,0.275,0.054];
      _parentBtn ctrlSetFade 0;
      _parentBtn ctrlCommit 0;
      _parentBtn ctrlSetPixelPrecision 1;
      _yPos = _yPos + 0.0575;
    };
  } forEach _parentPatch;
  if (_btnCreated isEqualTo 0) throw "";
} catch {
    if !(_exception isEqualTo "") then {["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast};
    closeDialog 0;
};
