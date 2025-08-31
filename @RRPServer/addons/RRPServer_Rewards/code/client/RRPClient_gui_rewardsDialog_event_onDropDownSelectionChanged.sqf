
private ["_listBox", "_index", "_dialog", "_rewardsListBox"];
disableSerialization;

_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];
_rewardsListBox = _dialog displayCtrl 2003;
_rewardsListBox lbSetCurSel -1;
call RRPClient_gui_rewardsDialog_updateSelection;
true