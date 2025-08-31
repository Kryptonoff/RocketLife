
private ["_responseCode", "_itemClassName", "_containerType", "_containerNetID", "_containersBefore", "_vehicle", "_dialog", "_listBox"];
_responseCode = _this select 0;
_itemClassName = _this select 1;
_containerType = _this select 2;
_containerNetID = _this select 3;
RRPClientPlayerRewards = _this select 4;

RRPClientAtmWaitingResponse = false;
if (_responseCode isEqualTo 0) then
{
	switch (_containerType) do
	{
		case 1:
		{
			_containersBefore = [uniform player, vest player, backpack player];
			[player, _itemClassName] call RRPClient_util_playerCargo_add;
		};
		case 2:
		{
			_vehicle = objectFromNetId _containerNetID;
			[_vehicle, _itemClassName] call RRPClient_util_containerCargo_add;
		};
	};
	["Тайник","Отлично, вы забрали свою вещь!"] call toastSuccess;
	
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