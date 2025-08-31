/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private["_display"];
disableSerialization;
_display = uiNameSpace getVariable ["RRPDialogKeypad", displayNull];

switch (_this) do
{
	case "OK":
	{
		_display closeDisplay 0;
	};
	case "Cancel":
	{
		PinCode = "";
		_display closeDisplay 0;
	};
};
true
