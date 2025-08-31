//RRPServer_slots_run
params [
	["_slots_machine", objNull, [objNull]],
	["_bet", -1, [-1]],
	["_player", objNull, [objNull]]
];
_slots_machine setVariable ["SlotsRunning", true, true];

[_player, "cash", "take", _bet] call RRPServer_system_moneyChange;

_slots_machine animateSource ["slot1", 0, true]; 
_slots_machine animateSource ["slot2", 0, true]; 
_slots_machine animateSource ["slot3", 0, true]; 

_slots_machine animateSource ["ruchka", 1];
[{_this animateSource ["ruchka", 0]}, _slots_machine, 1] call CBA_fnc_waitAndExecute;

private _slots_array = [0,0.7,0.3,0.5,0.4,0.2,0.9,0.6,0.8,0.1];
private _slots_probabilites = [0.037675,0.06028,0.078775,0.099325,0.119875,0.19865,0.400725,0.6028,0.804875,1];
private _slots_combination = [nil, nil, nil] apply {
	_random = random 1;
	_slots_probabilites findIf {_random <= _x};
};

private _win_factor = switch (true) do {
	case (_slots_combination isEqualTo [0,0,0]): {50};
	case (_slots_combination isEqualTo [1,1,1]): {40};
	case (_slots_combination isEqualTo [2,2,2]): {30};
	case (_slots_combination isEqualTo [3,3,3]): {20};
	case (_slots_combination isEqualTo [4,4,4]): {10};

	case (_slots_combination isEqualTo [5,5,5]): {6};
	case (_slots_combination isEqualTo [6,6,6]): {5};
	case (_slots_combination isEqualTo [7,7,7]): {4};
	case (_slots_combination isEqualTo [8,8,8]): {3};
	case (_slots_combination isEqualTo [9,9,9]): {2};

	case (({0 isEqualTo _x} count _slots_combination) isEqualTo 2): {10};
	case (({1 isEqualTo _x} count _slots_combination) isEqualTo 2): {9};
	case (({2 isEqualTo _x} count _slots_combination) isEqualTo 2): {8};
	case (({3 isEqualTo _x} count _slots_combination) isEqualTo 2): {7};
	case (({4 isEqualTo _x} count _slots_combination) isEqualTo 2): {6};

	case (({5 isEqualTo _x} count _slots_combination) isEqualTo 2): {1.5};
	case (({6 isEqualTo _x} count _slots_combination) isEqualTo 2): {1.25};
	case (({7 isEqualTo _x} count _slots_combination) isEqualTo 2): {1};
	case (({8 isEqualTo _x} count _slots_combination) isEqualTo 2): {0.75};
	case (({9 isEqualTo _x} count _slots_combination) isEqualTo 2): {0.5};

	default {0}
};

private _win_text = "";
if (_win_factor isNotEqualTo 0) then {
	_amount = _bet * _win_factor;
	[_player, "cash", "add", _amount] call RRPServer_system_moneyChange;
	_win_text = format["Вы выиграли $%1", [_amount] call RRPClient_util_numberText];
} else {
	_win_text = "Вы проиграли, может в следующий раз Вам улыбнется удача...";
};

_slots_machine animateSource ["slot1", 2 + (_slots_array select (_slots_combination select 0))];
_slots_machine animateSource ["slot2", 4 + (_slots_array select (_slots_combination select 1))];
_slots_machine animateSource ["slot3", 6 + (_slots_array select (_slots_combination select 2))];

private _final_animationPhase = 6 + (_slots_array select (_slots_combination select 2)) - 0.01;

[_slots_machine, _final_animationPhase, _player, _win_text] spawn {
	[
		{(_this#0) animationPhase "slot3" >= (_this#1)}, 
		{
			["Однорукий бандит", _this#3] remoteExecCall ["toastInfo", _this#2]; _this#0 setVariable ["SlotsRunning", false, true]; 
			diag_log ((_this#0) animationPhase "slot3"); 
			diag_log (_this#1)
		}, _this
	] call CBA_fnc_waitUntilAndExecute;
};