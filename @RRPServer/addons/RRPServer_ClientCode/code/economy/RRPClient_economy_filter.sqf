params ["_control","_checked","_mode"];

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 32000;

if (_mode isEqualTo "all") then {
	{
		_ctrl = _slide controlsGroupCtrl _x;
		_ctrl cbSetChecked (_checked isEqualTo 1);	
	} forEach [32005,32007,32009,32011,32013];
};

(_slide controlsGroupCtrl 32003) cbSetChecked !(false in 
[
	cbChecked (_slide controlsGroupCtrl 32005),
	cbChecked (_slide controlsGroupCtrl 32007),
	cbChecked (_slide controlsGroupCtrl 32009),
	cbChecked (_slide controlsGroupCtrl 32011),
	cbChecked (_slide controlsGroupCtrl 32013)
]);

call RRPClient_economy_refresh;
