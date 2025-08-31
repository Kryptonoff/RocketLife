
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 38000;

[controlNull,0] call RRPClient_ltds_onToolBoxChanged;
["refresh","main"] call RRPClient_ltds_ltd_actions;
