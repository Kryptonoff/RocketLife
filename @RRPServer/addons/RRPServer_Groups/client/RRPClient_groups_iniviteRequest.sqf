/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_selectedID","_selected","_selectedUID"];
try
{
  if !("canInvite" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
  _selected = param [0,objNull];
  if (isNull _selected) throw "Выбранный Null";
  if !(isPlayer _selected) throw "Это не игрок";
  _selectedID = netId _selected;
  if (_selectedID isEqualTo "") throw "Странная ошибка, netId отсутствует!";
  _selectedUID = getPlayerUID _selected;
  if ((_selected call getSide isEqualTo "reb") and {(RRPClientGroupInfo get "side") in ["cop","med"]}) throw "У него нет паспорта! Возможно, он его сжег...";
  
  if (!((_selected call getSide) isEqualTo (RRPClientGroupInfo get "side")) and {!((RRPClientGroupInfo get "side") in ["cop","med"])}) throw "Фракция игрока не соответствует вашей организации";

  if !(([RRPClientGroupInfo get "members",_selectedUID] call RRPClient_util_find) isEqualTo -1) throw "Выбранный игрок уже состоит в этой организации!";
  ["inviteRequest",[_selectedID]] call RRPClient_system_send;
}catch{
  ["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
