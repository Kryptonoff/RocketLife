
createDialog "RRPDialogEventRadiation";
_display = uiNamespace getVariable ["RRPDialogEventRadiation",displayNull];

_radius = _display displayCtrl 8807;
_radius ctrlAddEventHandler ["SliderPosChanged",{
	params ["_control", "_newValue"];
	_display = ctrlParent _control;
	_text = _display displayCtrl 8808;
	_text ctrlSetText format["%1 метров",_newValue];
}];

_steps = _display displayCtrl 8809;
_steps ctrlAddEventHandler ["SliderPosChanged",{
	params ["_control", "_newValue"];
	_display = ctrlParent _control;
	_text = _display displayCtrl 8810;
	_text ctrlSetText format["Шаг %1 сек",_newValue];
}];