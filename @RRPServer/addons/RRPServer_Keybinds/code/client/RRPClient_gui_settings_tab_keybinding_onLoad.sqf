private["_display","_keybinds","_listbox","_dropdown","_clearButton","_index"];
disableSerialization;
RRPClientKeybindLastSelected = "";
RRPClientKeybindWaitingForKeypress = false;
RRPClientKeybindModifingID = "";
RRPClientKeybindModified = [];
RRPClientKeybindCurrentBinds = [];
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_display displayAddEventHandler ["KeyDown","_this call RRPClient_gui_settings_tab_keybinding_event_onKeyDown"];
_display displayAddEventHandler ["KeyUp","_this call RRPClient_gui_settings_tab_keybinding_event_onKeyUp"];
_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",[]];
_listbox = _display displayCtrl 23108;
_dropdown = _display displayCtrl 23113;
_clearButton = _display displayCtrl 23112;
_listbox ctrlRemoveAllEventHandlers "KeyUp";
_dropdown ctrlRemoveAllEventHandlers "LBSelChanged";
_clearButton ctrlRemoveAllEventHandlers "ButtonClick";
lbClear _listbox;
lbClear _dropdown;
if !(_keybinds isEqualTo []) then
{
	{
		if (_x in (RRPClientKeybindActiveBinds select 0)) then
		{
			_index = _dropdown lbAdd format["%1", _x];
			_dropdown lbSetValue [_index,_forEachIndex];
		};
	}
	forEach (_keybinds select 0);
};
_listbox ctrlAddEventHandler ["LBDblClick", "call RRPClient_gui_settings_tab_keybinding_event_onLBDoubleClick"];
_listbox ctrlAddEventHandler ["LBSelChanged", "call RRPClient_gui_settings_tab_keybinding_event_onLBSelChanged"];
_dropdown ctrlAddEventHandler ["LBSelChanged","call RRPClient_gui_settings_tab_keybinding_event_onDropdownLBSelChanged"];
_clearButton ctrlAddEventHandler ["ButtonClick","call RRPClient_gui_settings_tab_keybinding_event_onClearButtonClick"];
_dropdown lbSetCurSel 0;