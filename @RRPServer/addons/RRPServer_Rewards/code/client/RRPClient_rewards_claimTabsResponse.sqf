
private ["_responseCode", "_itemClassName", "_amount", "_dialog", "_listBox"];
_responseCode = _this select 0;
_itemClassName = _this select 1;
_amount = _this select 2;
RRPClientPlayerRewards = _this select 3;

RRPClientAtmWaitingResponse = false;
if (_responseCode isEqualTo 0) then
{
	["Тайник", "Средства были переведены на Ваш баланс!"] call toastSuccess;	
	_dialog = uiNameSpace getVariable ["RRPDialogReward", displayNull];
	if !(isNull _dialog) then
	{
		call RRPClient_gui_rewardsDialog_updateListBox;
		call RRPClient_gui_rewardsDialog_updateSelection;
		_listBox = _dialog displayCtrl 2003;
		[_listBox, lbCurSel _listBox] call RRPClient_gui_rewardsDialog_event_onListBoxSelectionChanged;
	};
}
else 
{
	["Тайник",format["Что то не так... Код ошибки '%1' сообщите о ней администратору!",_responseCode]] call toastError;
};
