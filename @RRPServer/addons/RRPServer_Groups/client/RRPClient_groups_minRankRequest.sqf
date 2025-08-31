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
  private _uid = _memberList lnbData [lnbCurSelRow _memberList,0]; 
  if (_uid isEqualTo "") throw "Вы никого не выбрали"; 
  private _post = (getPlayerUID player) call RRPClient_groups_getPostGroup; 
  private _postSel = _uid call RRPClient_groups_getPostGroup; 
  private _players = RRPClientGroupInfo get "members";
  private _postsellvl = (_players select ([_players,_uid] call RRPClient_util_find)) select 2;
  if !(_post in [1,2]) then
  {
    if (_uid isEqualTo getPlayerUID player) throw "Вы не можете взаимодействовать сами с собой";
    if ("canDown" call RRPClient_groups_util_permCheck) then 
    { 
      if (RRPClientGroupLevel <= _postsellvl) then 
      { 
        throw "Вы не можете понизить в звании члена организации, который равен или старше Вас по званию!"; 
      };
    }else{
      throw "У вас нет на это разрешения";
    };
  };
  if (_post isEqualTo 2) then{
    if (_postSel in [1,2]) throw "Вы не можете изменить звание выбранному члену организации!"; 
  };
  ["minRank",[_uid]] call RRPClient_system_send; 
}catch{ 
  ["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast; 
};
