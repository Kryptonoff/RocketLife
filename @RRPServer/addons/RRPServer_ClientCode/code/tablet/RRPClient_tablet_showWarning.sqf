
private["_warning", "_buttonCaption", "_display", "_button", "_warningLine", "_popup"];
disableSerialization;
playSound "AppError";
_warning = _this select 0;
_buttonCaption = _this select 1;
_display = uiNameSpace getVariable ["RRPDialogTablet", displayNull];
_button = _display displayCtrl 4031;
_button ctrlSetText _buttonCaption;
_warningLine = _display displayCtrl 4032;
_warningLine ctrlSetStructuredText (parseText format ["<t align='center' shadow='1'><t color='#e14141'>Ой!</t><br/><t color='#fcfdff' size='1.4'>%1</t></t>", _warning]);
_popup = _display displayCtrl 4030;
_popup ctrlSetFade 0;
_popup ctrlShow true;
_popup ctrlCommit 0;	
ctrlSetFocus _popup;
RRPClientTabletIsWarningVisible = true;
