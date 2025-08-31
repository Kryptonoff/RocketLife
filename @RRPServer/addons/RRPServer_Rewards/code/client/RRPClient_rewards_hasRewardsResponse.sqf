private ["_responseCode", "_rewardsData", "_dialog", "_listBox"];
_responseCode = _this select 0;
_rewardsData = _this select 1;


RRPClientAtmWaitingResponse = false;
if (_responseCode isEqualTo 0) then
{

	RRPClientPlayerRewards = _rewardsData;
	if(count RRPClientPlayerRewards != 0) then {
		playSound "money_in";
		["Тайник","У вас есть новые вещи в тайнике!"] call toastInfo;
	};
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
