disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 18000;

private _list = _slide controlsGroupCtrl 18002;
_list ctrlAddEventHandler ["LbSelChanged","_this call RRPClient_notes_read"];
lbClear _list;
private _notes = parseSimpleArray (["Notes","[]"] call RRPClient_reg_read);
_notes = createHashMapFromArray _notes;

_display setVariable ["notes", _notes];

if (_notes isEqualTo []) exitWith {};

{
	_list lbAdd _x;
} forEach _notes;
lbSort [_list,"ASC"];
