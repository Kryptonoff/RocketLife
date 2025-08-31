/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private["_digit", "_display", "_fakeButton"];
_digit = _this;
if ((count PinCode) < Length) then
{
	PinCode = PinCode + (str _digit);
};
_display = uiNameSpace getVariable ["RRPDialogKeypad", displayNull];
_fakeButton = _display displayCtrl 4013;
playSound "pressButtonKeyPad";
ctrlSetFocus _fakeButton;
call RRPClient_keyPad_updateControls;
