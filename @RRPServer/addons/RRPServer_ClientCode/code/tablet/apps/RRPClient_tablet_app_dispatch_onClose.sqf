[] spawn {
	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 19000;
	private _ctrlMap = _slide controlsGroupCtrl 6944;
	waitUntil {ctrlCommitted _slide};
	_ctrlMap ctrlMapSetPosition [0.8 * safeZoneW, 0.198 * safeZoneH, 0.190796 * safeZoneW, 0.274978 * safeZoneH];
};
