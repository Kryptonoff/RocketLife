
private["_display", "_popup"];
disableSerialization;
_display = uiNameSpace getVariable ["RRPDialogTablet", displayNull];
_popup = _display displayCtrl 4030;
_popup ctrlSetFade 1;
_popup ctrlShow false;
_popup ctrlCommit 0;	
RRPClientTabletIsWarningVisible = false;