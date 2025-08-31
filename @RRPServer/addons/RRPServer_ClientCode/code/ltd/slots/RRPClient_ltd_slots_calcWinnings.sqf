/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _display = (uiNamespace getVariable ["RRPDialogLTDslots", displayNull]); 
if (_this isEqualTo "unload") exitWith {
	["ErrorTitleOnly",["Вы отсоединись от автомата, ваша ставка была потрачена в пустую!"]] call SmartClient_gui_toaster_addTemplateToast;
};
if (_this isEqualTo "respond") exitWith 
{
	RRPClientSlotWaitRespond = false;
	if (cbChecked (_display displayCtrl 99988)) then 
	{
		call RRPClient_ltd_slots_spin;
	};
};
if !(canSuspend) exitWith {_this spawn RRPClient_ltd_slots_calcWinnings};
params [
	["_slot_arr", [], [[]]]
];

diag_log _slot_arr;

if (isNull (uiNamespace getVariable ["RRPDialogLTDslots", displayNull])) exitWith 
{
	["ErrorTitleOnly",["Вы отсоединись от автомата, ваша ставка была потрачена в пустую!"]] call SmartClient_gui_toaster_addTemplateToast;
};
private _slotObject = _display getVariable ["SlotObject",objNull];
if (isNull _slotObject) exitWith 
{
	["ErrorTitleOnly",["Автомат не был определен!"]] call SmartClient_gui_toaster_addTemplateToast;
	closeDialog 0;
};
private _bet = (_display displayCtrl 99994) getVariable ["current_bet", (getArray (missionConfigFile >> "CfgLtdSlots" >> "betAmounts")) # 0];
private _total_winnings = 0;

(_slot_arr # 0) apply 
{
	private _icon = _x;
	(getArray(missionConfigFile >> "CfgLtdSlots" >> "winChances")) apply 
	{
		private _in_row = 0;
		_x apply 
		{
			_x params ["_c", "_r"];
			if !(_icon isEqualTo ((_slot_arr select _r) select _c)) exitWith {};

			_in_row = _in_row + 1;
		};

		((getArray(missionConfigFile >> "CfgLtdSlots" >> "winCfg")) select _icon) params [
			["_icon", -1, [-1]],
			["_min_icons", -1, [-1]],
			["_multiplier", -1, [-1]],
			["_per_missing_icon", 10, [10]]
		];

		if !(_icon isEqualTo -1) then 
		{
			if (_in_row >= _min_icons) then
			{
				private _math = (_bet * _multiplier);
				private _remove = (_math / 100) * (_per_missing_icon * (5 - _in_row));
				private _winnings = floor(_math - _remove);
				_total_winnings = floor (_total_winnings + _winnings);

				["SuccessTitleAndText",["Поздравляем!",format["%2 %3<br/>Ваш выигрыш составил $%1.", [_winnings] call RRPClient_util_numberText, _in_row, (getText (missionConfigFile >> "CfgLtdSlots" >> "slot_names" >> (str _icon) >> "displayName"))]]] call SmartClient_gui_toaster_addTemplateToast;
			};
		};
	};
};
["spinCasino",1] call RRPClient_ach_gateway;
if (_total_winnings isEqualTo 0) then
{
	["lose",[_slotObject,_bet],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
}else{
	["win",[_slotObject,_total_winnings,_bet],netId player] remoteExecCall ["RRPServer_ltd_slots_updateRequest",2];
	private _old = RRPClientCashMoney; 
	[player,"cash","add",_total_winnings] remoteExecCall ["RRPServer_system_moneyChange",2];
	waitUntil {_old != RRPClientCashMoney};
};

(_display displayCtrl 99991) ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='1' align='center' size='2'>$%1</t>", [_total_winnings] call RRPClient_util_numberText];
(_display displayCtrl 99990) ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='1' align='right' size='1.25'>%1</t><br/><t font='PuristaBold' shadow='1' align='right' size='1.25'>Баланс : $%2</t>", player call getNickName, [RRPClientCashMoney] call RRPClient_util_numberText];

if (_total_winnings isEqualTo 0) then 
{
	RRPClientSpinLosses = RRPClientSpinLosses + 1;
};
