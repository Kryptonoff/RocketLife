/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
	(RRPClientSpinLosses >= 10);

*/

if !(canSuspend) exitWith {_this spawn RRPClient_ltd_slots_spin};
private _display = (uiNamespace getVariable ["RRPDialogLTDslots", displayNull]);
private _slotObject = _display getVariable ["SlotObject",objNull];
if (isNull _slotObject) exitWith {
	["ErrorTitleOnly",["WAT? ¯\_(ツ)_/¯"]] call SmartClient_gui_toaster_addTemplateToast;
	closeDialog 0;
};
if ((_slotObject getVariable ["ltdSBank",0]) <= 0) exitWith 
{
	["ErrorTitleOnly",["В автомате закончились деньги для выплат, попробуйте использовать другой или обратитесь к администрации казино за пополнением счета автомата!"]] call SmartClient_gui_toaster_addTemplateToast;
	closeDialog 0;
};
private _spacer_ctrl = _display displayCtrl 99998;
private _slot_size_ctrl = _display displayCtrl 99999;
private _background = _display displayCtrl 99997;
private _bet = (_display displayCtrl 99994) getVariable ["current_bet", (getArray (missionConfigFile >> "CfgLtdSlots" >> "betAmounts")) # 0];
private _reel_no = 1;
if (missionNamespace getVariable ["RRPClientSlotSpinning", false]) exitWith {};
if (missionNamespace getVariable ["RRPClientSlotWaitRespond",false]) exitWith {["ErrorTitleOnly",["Ожидаю сервер..."]] call SmartClient_gui_toaster_addTemplateToast;};
if (RRPClientCashMoney < _bet) exitWith {
	["ErrorTitleOnly",["У вас недостаточно средств чтобы сделать ставку!"]] call SmartClient_gui_toaster_addTemplateToast;
	(_display displayCtrl 99988) cbSetChecked false;
};
_old = RRPClientCashMoney;
[player,"cash","take",_bet] remoteExecCall ["RRPServer_system_moneyChange",2];
RRPClientSlotDebug = (getNumber(getMissionConfig "CfgLtdSlots" >> "debug") isEqualTo 1);
RRPClientSlotSpinning = true;
RRPClientSlotWaitRespond = true;
RRPClientSlotArray = [];
waitUntil {_old != RRPClientCashMoney};

private _winning_icon = [-1, selectRandom ((_background getVariable ["reels", []]) # 0)] select (RRPClientSpinLosses >= (getNumber (missionConfigFile >> "CfgLtdSlots" >> "lossPrevention")));

private _win_line = selectRandom (getArray(missionConfigFile >> "CfgLtdSlots" >> "winChances"));

(_display displayCtrl 99990) ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='1' align='right' size='1.25'>%1</t><br/><t font='PuristaBold' shadow='1' align='right' size='1.25'>Баланс : $%2</t>", player call getNickName, [RRPClientCashMoney] call RRPClient_util_numberText];

for "_i" from 0 to ((count (_background getVariable ["reels", []])) - 1) do 
{
	_reel_no = _reel_no + 1;
	private _showing = (_background getVariable [format ["showing_%1", _i], []]);
	private _reel = (_background getVariable [format ["reel_%1", _i], []]);
	private _slots = (_background getVariable [format ["slots_%1", _i], []]);

	private _next_showing = [_reel, (floor (random ((count _reel) - 1)))] call RRPClient_ltd_slots_findNextIcons;

	if !(_winning_icon isEqualTo -1) then 
	{
		RRPClientSpinLosses = 0;

		if !((_next_showing find _winning_icon) isEqualTo -1) then 
		{
			_next_showing set [(_next_showing find _winning_icon), (_next_showing # ((_win_line # _i) # 0))];
		};

		_next_showing set [((_win_line # _i) # 0), _winning_icon];
	};

	private _tmp = [];
	for "_j" from 0 to (_reel_no * (random 2)) do 
	{
		{_tmp pushBack _x} forEach _reel;
	};

	private _tmp = _tmp + _next_showing;
	[_tmp, _slots, _i] spawn 
	{
		params ["_tmp", "_slots", "_index"];
		_commit_time = 1;
		reverse _slots;
		private _display = (uiNamespace getVariable ["RRPDialogLTDslots", displayNull]);
		private _background = _display displayCtrl 99997;
		private _spacer_ctrl = _display displayCtrl 99998;
		private _slot_size_ctrl = _display displayCtrl 99999;
		private _group = _display displayCtrl 99995;
		(ctrlPosition _slot_size_ctrl) params ["", "", "_slot_w", "_slot_h"];
		(ctrlPosition _spacer_ctrl) params ["", "", "_spacer_x", "_spacer_y"];
		missionNamespace setVariable [ (format ["RRPClientSlotcontrols_%1", _index]), _slots];
		missionNamespace setVariable [ (format ["RRPClientSlottmp_%1", _index]), _tmp];
		private _first_pos = ctrlPosition (_slots # 0);
		private _top_pos = ctrlPosition (_slots # 2);
		private _x_pos = _first_pos # 0;
		while {!(count (missionNamespace getVariable [format ["RRPClientSlottmp_%1", _index], []]) isEqualTo 3)} do 
		{
			{
				private _this_pos = ctrlPosition _x;
				private _new_pos = [
					[_this_pos # 0, (_this_pos # 1) + _slot_h,(_this_pos # 2), _slot_h],
					[_this_pos # 0, (_this_pos # 1) + (_slot_h * 0.8),(_this_pos # 2), _slot_h / 3]
				] select (_forEachIndex isEqualTo 0);

				if ((_new_pos # 3) < _slot_h) then 
				{
					_x spawn 
					{
						waitUntil {ctrlCommitted _this};
						ctrlDelete _this;
					}
				};

				_x ctrlSetPosition _new_pos;
				_x ctrlCommit _commit_time;
				
			} forEach _slots;

			_tmp deleteAt 0;
			_slots deleteAt 0;

			private _slot = _display ctrlCreate ["RscPicture", -1, _group];
			private _slot_image = format ["\rimas_ltds\assets\slots\icon_%1.paa", _tmp # 2];

			_slot setVariable ["slot", _tmp # 2];
			_slot ctrlSetPosition [_top_pos # 0, _top_pos # 1, _slot_w, 0]; 
			_slot ctrlCommit 0;
			_slot ctrlSetPosition [_top_pos # 0, _top_pos # 1, _slot_w, _slot_h];
			_slot ctrlCommit _commit_time;
			_slot ctrlSetText _slot_image;

			_slots pushBack _slot;

			missionNamespace setVariable [format["RRPClientSlotcontrols_%1", _index], _slots];
			missionNamespace setVariable [format["RRPClientSlottmp_%1", _index], _tmp];

			comment "waitUntil {ctrlCommitted _slot};";
		};

		reverse _slots;
		_slot_arr = [];

		{
			_x ctrlSetPosition ((_background getVariable ["positions", []]) # _index) # _forEachIndex;
			_x ctrlCommit 0;
			_slot_arr pushBack (_x getVariable ["slot", -1]);
		} forEach _slots;

		private _last_y = 0;
		private _last_h = 0;

		{
			(ctrlPosition _x) params ["_last_x", "_last_y", "_last_w", "_last_h"]; 

			private _this_y = [_last_y, (_last_y + _last_h)] select (_last_y isEqualTo 0);
			private _this_h = [_last_h, _last_h] select (_last_y isEqualTo 0);
			_x ctrlSetPosition [_last_x, _this_y, _last_w, _this_h];
			_x ctrlCommit 0;
		} forEach _slots;

		RRPClientSlotArray set [_index, _slot_arr];
	};
};
waitUntil {(count (RRPClientSlotArray select {!isNil "_x"})) isEqualTo 5};
[RRPClientSlotArray] call RRPClient_ltd_slots_calcWinnings;
RRPClientSlotSpinning = false;
