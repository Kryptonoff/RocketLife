/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND

	Usage: It must be a call in scheduled environment!!!
*/

private["_display", "_ctrlButtonOK", "_ctrlButtonCancel", "_screenText", "_fakeButton"];
disableSerialization;
Length = _this;
PinCode = "";
createDialog "RRPDialogKeypad";
waitUntil
{
	!isNull (findDisplay 24010);
};
_display = uiNameSpace getVariable ["RRPDialogKeypad", displayNull];
_ctrlButtonOK = _display displayCtrl 4000;
_ctrlButtonCancel = _display displayCtrl 4002;
_screenText = _display displayCtrl 4001;
_screenText ctrlSetText "CODE";
_fakeButton = _display displayCtrl 4013;
_ctrlButtonOK ctrlSetEventHandler ["ButtonClick","'OK' call RRPClient_keyPad_evh"];
_ctrlButtonCancel ctrlSetEventHandler ["ButtonClick","'Cancel' call RRPClient_keyPad_evh"];
ctrlSetFocus _fakeButton;
call RRPClient_keyPad_updateControls;
waitUntil
{
	isNull (findDisplay 24010);
};
if((count PinCode) != Length)then
{
	PinCode = "";
};
PinCode
