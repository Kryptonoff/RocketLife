/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private ['_display','_pIdc','_parentBtn','_yPos','_mod','_parentPatch','_ctrlCursor','_conditionMod'];
try {
  _mod = param [0,"",[""]];
  if (_mod isEqualTo "")  throw "Не задан тип диалога, сообщите админу!";
  _conditionMod = getText (missionConfigFile >> "winkey_interaction" >> _mod >> "condition");
  if (_conditionMod isEqualTo "") then {_conditionMod = "true";};
  if !(call (compile _conditionMod)) throw "";

  if !(isNull (uiNamespace getVariable ['RRPDialogEmpty',displayNull])) throw "";
  if !(createDialog 'RRPDialogEmpty') throw "Ошибка при создании диалога";
  _display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
  _display displayAddEventHandler ["unload","uiNamespace setVariable ['RRPDialogEmpty', displayNull]; false call RRPClient_gui_util_blur;evh_mouseEnter = nil; evh_mouseExit = nil; chealdCtrlsList = nil"];

  _pIdc = 1001;
  _yPos = 0.4;
  chealdCtrlsList = [];

  _parentPatch = ("true" configClasses (missionconfigFile >> "winkey_interaction" >> _mod));
  if (_parentPatch isEqualTo []) throw "Неизвестные тип диалога, сообщите админу!";

  evh_mouseEnter = {
    params ["_control"];
    private _parentPos = ctrlPosition _control;
    _yPos = (_parentPos select 1);
    if (!(_control isEqualTo ((uiNamespace getVariable ['RRPDialogEmpty',displayNull]) getVariable ["ctrlActive",controlNull])) AND (_control getVariable ["isParentBtn",false])) then {
      if (!(chealdCtrlsList isEqualTo [])) then {{ctrlDelete _x;} forEach chealdCtrlsList;chealdCtrlsList = []};
      _display setVariable ["ctrlActive", _control];
      {
        private _condition = (getText (_x >> "condition"));
        if (_condition isEqualTo "") then {_condition = "true";};
        if ([_condition] call RRPClient_util_conditionsCheck) then {
          private _ChealdBtn = (ctrlParent _control) ctrlCreate ['RRP_btn_interaction',-1];
          private _icon = (getText (_x >> "icon"));
          _icon = if (_icon isEqualTo "") then {"\RRP_icons\interaction\default.paa"} else {_icon};
          private _title = (getText (_x >> "title"));
          chealdCtrlsList pushBack _ChealdBtn;
          _ChealdBtn ctrlSetPosition [((_parentPos select 0) + (_parentPos select 2) +  0.01),_yPos,(_parentPos select 2),(_parentPos select 3)];
          _ChealdBtn ctrlSetFont 'RobotoCondensedBold';
          _ChealdBtn ctrlCommit 0;
          private _empty = if !((_ChealdBtn getVariable ["path",[]]) isEqualTo []) then {""} else {"      "};
          _ChealdBtn ctrlSetStructuredText parseText format ["<t size='1' align='center' valign='middle'>%2%4<t align = 'right'><img image = '%3'></ img></t></t><t><img image = '%1'></ img></t>",_icon,_title,(if ((_ChealdBtn getVariable ["path",[]]) isEqualTo []) then {""} else {"\RRP_icons\interaction\subButton.paa"}),_empty];
          _ChealdBtn buttonSetAction (getText (_x >> "action"));
          _ChealdBtn setVariable ["path", _x];
          _yPos = _yPos + 0.0575;
          _ChealdBtn ctrlAddEventHandler ['MouseEnter',evh_mouseEnter];
          _ChealdBtn ctrlAddEventHandler ['MouseExit',evh_mouseExit];
          _ChealdBtn ctrlSetPixelPrecision 1;
        };
      } forEach (_control getVariable ["path",[]]);
    };
    _ctrlCursor =  (ctrlParent _control) ctrlCreate ['RscText',1999];
    _ctrlCursor ctrlSetPosition [(_parentPos select 0),(_parentPos select 1),0.0055,(_parentPos select 3)];
    _ctrlCursor ctrlSetBackgroundColor [0.0, 0.92, 0.99,1];
    _ctrlCursor ctrlCommit 0;
  };
  evh_mouseExit = {ctrlDelete ((uiNamespace getVariable ['RRPDialogEmpty',displayNull]) displayCtrl 1999)};
  private _btnCreated = 0;
  {
    private _condition = (getText (_x >> "condition"));
    if (_condition isEqualTo "") then {_condition = "true";};
    if (call (compile _condition)) then {
      _btnCreated = _btnCreated + 1;
      private _icon = (getText (_x >> "icon"));
      _icon = if (_icon isEqualTo "") then {"\RRP_icons\interaction\default.paa"} else {_icon};
      private _title = (getText (_x >> "title"));
      _parentBtn = _display ctrlCreate ['RRP_btn_interaction',(_pIdc + 1)];
      _parentBtn ctrlSetFont 'RobotoCondensedBold';
      _parentBtn buttonSetAction (getText (_x >> "action"));
      _parentBtn setVariable ["path",("true" configClasses _x)];
      _parentBtn setVariable ["isParentBtn", true];
      private _empty = if !((_parentBtn getVariable ["path",[]]) isEqualTo []) then {""} else {"      "};
      _parentBtn ctrlSetStructuredText parseText format ["<t size='1' align='center' valign='middle'>%2%4<t align = 'right'><img image = '%3'></ img></t></t><t><img image = '%1'></ img></t>",_icon,_title,(if ((_parentBtn getVariable ["path",[]]) isEqualTo []) then {""} else {"\RRP_icons\interaction\subButton.paa"}),_empty];
      _parentBtn ctrlSetPosition [0.56,_yPos,0.275,0.054];
      _parentBtn ctrlSetFade 0;
      _parentBtn ctrlCommit 0;
      _parentBtn ctrlAddEventHandler ['MouseEnter',evh_mouseEnter];
      _parentBtn ctrlAddEventHandler ['MouseExit',evh_mouseExit];
      _parentBtn ctrlSetPixelPrecision 1;
      _yPos = _yPos + 0.0575;
    };
  } forEach _parentPatch;
  if (_btnCreated isEqualTo 0) throw "";
} catch {
    if !(_exception isEqualTo "") then {["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast};
    closeDialog 0;
};

