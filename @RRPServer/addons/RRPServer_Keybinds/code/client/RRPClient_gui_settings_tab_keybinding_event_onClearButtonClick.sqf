private["_display","_listbox","_index"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_listbox = _display displayCtrl 23108;
_index = -1;
{
	if ((_x select 0) isEqualTo RRPClientKeybindModifingID) exitWith
	{
		_index = _forEachIndex;
	};
}
forEach RRPClientKeybindModified;
if (_index isEqualTo -1) then
{
	RRPClientKeybindModified pushbackUnique [RRPClientKeybindModifingID,[-1,[false,false,false]]];
}
else
{
	(RRPClientKeybindModified select _index) set [1,[-1,[false,false,false]]];
};
_listbox lbSetTextRight [(lbCurSel _listbox),""];
_listbox ctrlEnable true;
RRPClientKeybindWaitingForKeypress = false;