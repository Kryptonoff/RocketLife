
if !(canSuspend) exitWith {_this spawn RRPClient_notes_delete};
private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _mainGroup = _display displayCtrl 24001;
private _noteSlider = _mainGroup controlsGroupCtrl 18000;
private _noteEditor = _mainGroup controlsGroupCtrl 18100;
private _list = _noteSlider controlsGroupCtrl 18002;

private _selected = _display getVariable ["noteSelected",""];
if (_selected isEqualTo "") exitWith {
	["Вы ничего не выбрали","ОК"] call RRPClient_tablet_showWarning;
};

["Удалить заметку?", "Да", "Отмена"] call RRPClient_tablet_showConfirm;
waitUntil {!isNil "RRPClientTabletConfirmResult"};
if !(RRPClientTabletConfirmResult) exitWith {};
lbClear _list;
(_display getVariable ["notes",createHashMap]) deleteAt _selected;

{
	_list lbAdd _x;
} forEach (_display getVariable ["notes",createHashMap]);

lbSort [_list,"ASC"];

[	
	"Notes",
	str(_display getVariable ["notes",[]])
] call RRPClient_reg_write;