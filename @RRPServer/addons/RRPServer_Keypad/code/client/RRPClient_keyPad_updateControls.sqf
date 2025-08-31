/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private["_display", "_screenText", "_text", "_i", "_okayButton"];
disableSerialization;
_display = uiNameSpace getVariable ["RRPDialogKeypad", displayNull];
_screenText = _display displayCtrl 4001;
if (PinCode isEqualTo "") then
{
	_text = "CODE";
}
else
{
	_text = PinCode;
};
_screenText ctrlSetText _text;
_okayButton = _display displayCtrl 4000;
_okayButton ctrlEnable ((count PinCode) isEqualTo Length);
true
