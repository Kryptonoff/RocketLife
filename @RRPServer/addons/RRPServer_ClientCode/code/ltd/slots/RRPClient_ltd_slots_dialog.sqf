/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _display = _this select 0;
private _mode = _this select 1;
switch (_mode) do
{
	case "load": {
		uiNamespace setVariable ['RRPDialogLTDslots', _display select 0];
	};
	case "unload": {
		if (missionNamespace getVariable ["RRPClientSlotSpinning", false]) then {"unload" call RRPClient_ltd_slots_calcWinnings; };
		RRPClientSlotWaitRespond = false;
		uiNamespace setVariable ['RRPDialogLTDslots', displayNull];
	};
};
