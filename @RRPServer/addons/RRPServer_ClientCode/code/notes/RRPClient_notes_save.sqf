
private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 18100;
private _themeEdit = _slide controlsGroupCtrl 18103;
private _textEdit = _slide controlsGroupCtrl 18105;

_themeText = ctrlText _themeEdit;
if (_themeText isEqualTo "") exitWith {["Вы не ввели тему заметки", "ОК"] call RRPClient_tablet_showWarning}; 
_text = ctrlText _textEdit;
_text = _text splitString endl joinString "<br/>";

(_display getVariable ["notes",[]]) set [_themeText, _text];

[	
	"Notes",
	str(_display getVariable ["notes",[]])
] call RRPClient_reg_write;
["notes",0] call RRPClient_tablet_slide;
["Заметка сохранена!", "ОК"] call RRPClient_tablet_showWarning;
