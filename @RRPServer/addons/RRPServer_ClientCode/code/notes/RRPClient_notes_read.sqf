
disableSerialization;
params ["_control","_index"];
private _text = _control lbText _index;
private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _notes = _display getVariable ["notes",createHashMap];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 18000;
private _textControl = _slide controlsGroupCtrl 18004;
_display setVariable ["noteSelected",_text];
[_textControl] apply {
	_x ctrlSetFade 1;
	_x ctrlCommit 0;
	_textControl ctrlSetStructuredText parseText format ["<t size='1.2'>%1</t>",_notes get _text];
	_height = ctrlTextHeight _textControl;
	_textControl ctrlSetPositionH _height;
	_x ctrlSetFade 0;
	_x ctrlCommit 0.35;
};
