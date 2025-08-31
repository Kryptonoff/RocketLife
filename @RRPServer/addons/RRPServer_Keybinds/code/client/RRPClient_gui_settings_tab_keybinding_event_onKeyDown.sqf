private["_keyCode","_result","_display","_listbox","_index"];
disableSerialization;
_keyCode = _this select 1;
_result = false;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_listbox = _display displayCtrl 23108;
_index = lbCurSel _listbox;
if (_keyCode == 0x01) then
{
	if (RRPClientKeybindWaitingForKeypress) then
	{
		_listbox lbSetTextRight [_index,RRPClientKeybindLastSelected];
		_listbox ctrlRemoveAllEventHandlers "KeyUp";
		_listbox ctrlEnable true;
		RRPClientKeybindModifingID = "";
		_result = true;
	};
};
_result