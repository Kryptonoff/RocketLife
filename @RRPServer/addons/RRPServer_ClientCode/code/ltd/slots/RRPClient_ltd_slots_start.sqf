/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

RRPClientSpinLosses = 0;
_slotObject = param [0,objNull,[objNull]];
if (isNull _slotObject) exitWith {};
if ([_slotObject] call RRPClient_ltd_isShopInUse) exitWith {["ErrorTitleOnly",["На автомате уже кто-то играет!"]] call SmartClient_gui_toaster_addTemplateToast;};
if ((_slotObject getVariable ["ltdSBank",0]) <= 0) exitWith 
{
	["ErrorTitleOnly",["В автомате закончились деньги для выплат, попробуйте использовать другой или обратитесь к администрации казино за пополнением счета автомата!"]] call SmartClient_gui_toaster_addTemplateToast;
};
createDialog "RRPDialogLTDslots";
private _display = (uiNamespace getVariable ["RRPDialogLTDslots", displayNull]);
_display setVariable ["SlotObject",_slotObject];
[_slotObject,"shop_inUseBy",getPlayerUID player] call CBA_fnc_setVarNet;
private _spacer_ctrl = _display displayCtrl 99998;
private _slot_size_ctrl = _display displayCtrl 99999;
private _background = _display displayCtrl 99997;
private _group = _display displayCtrl 99995;
private _bet_ctrl = _display displayCtrl 99994;
private _name_ctrl = _display displayCtrl 99989;

_name_ctrl ctrlSetStructuredText parseText (format["<t font='PuristaBold' shadow='1' align='left' size='2'>%1</t>",_slotObject getVariable ["ltdName","Undefined"]]);
(ctrlPosition _spacer_ctrl) params ["", "", "_spacer_x", "_spacer_y"];
(ctrlPosition _background) params ["_bg_x", "_bg_y"];
(ctrlPosition _slot_size_ctrl) params ["", "", "_slot_w", "_slot_h"];

private _base_position = [_spacer_x, _spacer_y, _slot_w, _slot_h];

private _reels = 
[
	(getArray(missionConfigFile >> "CfgLtdSlots" >> "slots")),
	(getArray(missionConfigFile >> "CfgLtdSlots" >> "slots")),
	(getArray(missionConfigFile >> "CfgLtdSlots" >> "slots")),
	(getArray(missionConfigFile >> "CfgLtdSlots" >> "slots")),
	(getArray(missionConfigFile >> "CfgLtdSlots" >> "slots"))
];

private _bets = getArray (missionConfigFile >> "CfgLtdSlots" >> "betAmounts");

_bet_ctrl ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='1' align='center' size='2'>$%1</t>", _bets # 0];
_bet_ctrl setVariable ["current_bet", _bets # 0];

_background setVariable ["reels", _reels];


private _slot_x = _base_position # 0;
private _positions = [];

{	
	private _sub_positions = [];
	private _reel_array = call RRPClient_ltd_slots_generateWheel;
	private _first_show = floor (random ((count _reel_array) - 1));

	private _show_array = [_reel_array, _first_show] call RRPClient_ltd_slots_findNextIcons;

	private _slot_y = _base_position # 1;
	private _slots = [];

	_show_array apply 
	{
		private _slot = _display ctrlCreate ["RscPicture", -1, _group];
	private _slot_image = format ["\rimas_ltds\assets\slots\icon_%1.paa", _x];

		_slot ctrlSetText _slot_image;
		_slot ctrlSetPosition [_slot_x, _slot_y, _base_position # 2, _base_position # 3];
		_slot ctrlCommit 0;

		_slot_y = _slot_y + (_base_position # 3);

		_slots pushBack _slot;
		_sub_positions pushBack (ctrlPosition _slot);
	};

	_positions pushBack _sub_positions;
	_slot_x = _slot_x + ( _base_position # 2) + (_spacer_x);

	_background setVariable [format ["showing_%1", _forEachIndex], _show_array];
	_background setVariable [format ["reel_%1", _forEachIndex], _reel_array];
	_background setVariable [format ["slots_%1", _forEachIndex], _slots];
	
} forEach _reels;

_background setVariable ["positions", _positions];

if (missionNamespace getVariable ["RRPClientSlotDebug",false]) then
{
	[] spawn 
	{
		diag_log format ["===========Starting Debug==========="];
		systemChat format ["===========Starting Debug==========="];
		
		private _runs = 0;
		private _wins = [];

		for "_i" from 0 to 5 do 
		{
			
			wins_debug = 0;
			diag_log format ["===========Debugging 10 Spins==========="];
			private _rolls = 0;
			private _starting_cash = 100000;
			RRPClientCashMoney = 100000;
			private _bet = 100;

			for "_i" from 0 to 10 do 
			{
				_runs = _runs + 1;
				systemChat str _runs;
				
				waitUntil {!RRPClientSlotSpinning};
			};

			_wins pushBack wins_debug;
			diag_log format ["Wins Out Of 10", wins_debug];
			diag_log format ["Debugging Starting Cash : %1", _starting_cash];
			diag_log format ["Debugging Finishing Cash : %1", RRPClientCashMoney];
			diag_log format ["Debugging Difference : %1", RRPClientCashMoney - _starting_cash];
			diag_log format ["===========Round Complete==========="];
		};

		private _average = 0;
		_wins apply {_average = _average + _x};
		_average = _average / (count _wins);

		diag_log format ["Average Wins Per 10 Spins ---- %1", _average];
		systemChat format ["===========Finished Debug==========="];
		diag_log format ["===========Finished Debug==========="];
	};
};


(_display displayCtrl 99996) ctrlAddEventHandler ["MouseButtonUp", 
{
	call RRPClient_ltd_slots_spin;
}];
(_display displayCtrl 99992) ctrlAddEventHandler ["MouseButtonUp", 
{	
	[true] call RRPClient_ltd_slots_changeBet; 
}];
(_display displayCtrl 99993) ctrlAddEventHandler ["MouseButtonUp", 
{
	[false] call RRPClient_ltd_slots_changeBet; 
}];
_display displayAddEventHandler ["KeyDown",
{
	params ["","_code"];
	_stopPropagation = false;
	switch (_code) do
	{
		//left
		case 0xCD: {
			[true] call RRPClient_ltd_slots_changeBet;
			_stopPropagation = true;
		};
		//right
		case 0xCB: {
			[false] call RRPClient_ltd_slots_changeBet; 
			_stopPropagation = true;
		};
	};
	_stopPropagation
}];

_display displayAddEventHandler ["KeyUp",
{
	params ["","_code"];
	_stopPropagation = false;
	switch (_code) do
	{
		//Space
		case 0x39: {
			call RRPClient_ltd_slots_spin;
			_stopPropagation = true;
		};
		case 0x01: {
			closeDialog 0;
			_stopPropagation = true;
		};
	};
	_stopPropagation
}];

(_display displayCtrl 99990) ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='1' align='right' size='1.25'>%1</t><br/><t font='PuristaBold' align='right' shadow='1' size='1.25'>Баланс : $%2</t>", profileName, RRPClientCashMoney];
(_display displayCtrl 99988) ctrlAddEventHandler ["CheckedChanged",{
	params ["_control", "_checked"];
	if (cbChecked _control) then {
		["InfoTitleOnly",["Вы активировали автоматическую прокрутку!"]] call SmartClient_gui_toaster_addTemplateToast;
	}else{
		["InfoTitleOnly",["Автопрокрутка деактивирована!"]] call SmartClient_gui_toaster_addTemplateToast;
	};
}];
_slotObject spawn 
{
	while {true} do 
	{
		if (_this getVariable ["shop_inUseBy",""] != getPlayerUID player) exitWith 
		{
			[_this,"shop_inUseBy"] call RRPClient_system_clearGlobalVar;
			["ErrorTitleOnly",["На автомате уже кто-то играет!"]] call SmartClient_gui_toaster_addTemplateToast;
			closeDialog 0;
		};
		if (isNull (uiNamespace getVariable ["RRPDialogLTDslots", displayNull])) exitWith 
		{
			[_this,"shop_inUseBy"] call RRPClient_system_clearGlobalVar;
		};
		uiSleep 0.03;
	};
};
