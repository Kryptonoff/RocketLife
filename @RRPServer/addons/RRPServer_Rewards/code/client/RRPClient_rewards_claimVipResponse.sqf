#define COMPIL(var1,var2) var1 = compile (if(var2 isEqualType "") then {var2} else {str(var2)})

private ["_responseCode", "_itemClassName", "_amount", "_dialog", "_listBox"];
_responseCode = _this select 0;
_vip = _this select 1;
RRPClientPlayerRewards = _this select 2;

RRPClientAtmWaitingResponse = false;
if (_responseCode isEqualTo 0) then
{
	["Тайник", "VIP уровень активирован!"] call toastSuccess;
	COMPIL(life_donator,_vip);
	_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];
	if !(isNull _dialog) then
	{
		call RRPClient_gui_rewardsDialog_updateListBox;
		call RRPClient_gui_rewardsDialog_updateSelection;
		private _listBox = _dialog displayCtrl 2003;
		[_listBox, lbCurSel _listBox] call RRPClient_gui_rewardsDialog_event_onListBoxSelectionChanged;
	};
}
else 
{
	["Тайник",format["Что то не так... Код ошибки '%1' сообщите о ней администратору!",_responseCode]] call toastError;
};