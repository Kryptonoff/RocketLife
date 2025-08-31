
params ["_mode"];

private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _mainGroup = _display displayCtrl 24001;
private _noteEditor = _mainGroup controlsGroupCtrl 18100;

switch _mode do 
{
	case "new":
	{
		["notesEditor",1] call RRPClient_tablet_slide;
	};
	case "edit":
	{
		_selected = _display getVariable ["noteSelected",""];
		if (_selected isEqualTo "") exitWith {["Вы ничего не выбрали","ОК"] call RRPClient_tablet_showWarning};
		["notesEditor",1] call RRPClient_tablet_slide;
		_themeEdit = _noteEditor controlsGroupCtrl 18103;		
		_textEdit = _noteEditor controlsGroupCtrl 18105;
		_themeEdit ctrlSetText _selected;
		_textEdit ctrlSetText ((_display getVariable ["notes",createHashMap]) get _selected);
	};
};
