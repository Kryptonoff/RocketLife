/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params [
	["_up", false, [true]]
];

if (missionNamespace getVariable ["RRPClientSlotSpinning", false]) exitWith {
	["ErrorTitleOnly",["Вы не можете менять ставку во время розыгрыша!"]] call SmartClient_gui_toaster_addTemplateToast;	
};

private _display = (uiNamespace getVariable ["RRPDialogLTDslots", displayNull]);
private _bet_ctrl = _display displayCtrl 99994;

private _bets = getArray (missionConfigFile >> "CfgLtdSlots" >> "betAmounts");
private _cur_bet = _bet_ctrl getVariable ["current_bet", (_bets # 0)];

private _cur_index = _bets find _cur_bet;	
private _new_bet = if (_up) then 
{
	_cur_index + 1 min ((count _bets) - 1);
} else 
{
	_cur_index - 1 max 0;
};

_bet_ctrl ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='1' align='center' size='2'>$%1</t>", _bets # _new_bet];
_bet_ctrl setVariable ["current_bet", _bets # _new_bet];
