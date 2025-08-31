params ["_table", "_hands", "_mode"];
_table params [
	["_card1",[10,"H"]],
	["_card2",[10,"H"]],
	["_card3",[10,"H"]],
	["_card4",[10,"H"]],
	["_card5",[10,"H"]]
];

private _display = uiNamespace getVariable ["RRPDialogPoker",displayNull];
private _tableGroup = _display displayCtrl 25300;
private _t_card_1 = _tableGroup controlsGroupCtrl 25301;
private _t_card_2 = _tableGroup controlsGroupCtrl 25302;
private _t_card_3 = _tableGroup controlsGroupCtrl 25303;
private _t_card_4 = _tableGroup controlsGroupCtrl 25304;
private _t_card_5 = _tableGroup controlsGroupCtrl 25305;

private _handGroup = _display displayCtrl 25200;
private _p_card_1 = _handGroup controlsGroupCtrl 25201;
private _p_card_2 = _handGroup controlsGroupCtrl 25202;

private _groupPlayers = _display displayCtrl 25500; 

if (_mode isEqualTo "HIDE") exitWith {
	_t_card_1 ctrlSetText "\RRP_icons\poker\shirt.paa";
	_t_card_2 ctrlSetText "\RRP_icons\poker\shirt.paa";
	_t_card_3 ctrlSetText "\RRP_icons\poker\shirt.paa";
	_t_card_4 ctrlSetText "\RRP_icons\poker\shirt.paa";
	_t_card_5 ctrlSetText "\RRP_icons\poker\shirt.paa";

	for "_i" from 1 to 6 do {
		(_groupPlayers controlsGroupCtrl (62150 + _i)) ctrlSetStructuredText parseText "";
		(_groupPlayers controlsGroupCtrl (62160 + _i)) ctrlSetStructuredText parseText "Место свободно";
		(_groupPlayers controlsGroupCtrl (62180 + _i)) ctrlSetStructuredText parseText "";
		(_groupPlayers controlsGroupCtrl (62190 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
		(_groupPlayers controlsGroupCtrl (62200 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
		_p_card_4 ctrlSetText "\RRP_icons\poker\shirt.paa";
		_p_card_5 ctrlSetText "\RRP_icons\poker\shirt.paa";
	};

	[objNull, "clear"] call RRPClient_poker_showMove;
};

if (_mode isEqualTo "SHOWDOWN") then 
{
	for "_i" from 1 to 6 do 
	{
		_player = life_poker_table getVariable [format ["%1_player_%2",life_poker_id,_i],objNull];
		if !(isNull _player) then 
		{
			{
				_x params ["_player_x","_cards"];
				if (_player_x isEqualTo _player) then {
					(_groupPlayers controlsGroupCtrl (62190 + _i)) ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",(_cards select 0) select 0,(_cards select 0) select 1];
					(_groupPlayers controlsGroupCtrl (62200 + _i)) ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",(_cards select 1) select 0,(_cards select 1) select 1];
				};
			} forEach _hands;
		};
		_t_card_1 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card1 select 0, _card1 select 1];
		_t_card_2 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card2 select 0, _card2 select 1];
		_t_card_3 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card3 select 0, _card3 select 1];
		_t_card_4 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card4 select 0, _card4 select 1];
		_t_card_5 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card5 select 0, _card5 select 1];
	};
};

if (_mode isEqualTo "PREFLOP") then {
	for "_i" from 1 to 6 do {
		_player = life_poker_table getVariable [format ["%1_player_%2",life_poker_id,_i],objNull];
		if !(isNull _player) then {
			_player_hand_index = [_player,_hands] call RRPClient_system_index;
			
			(_groupPlayers controlsGroupCtrl (62160 + _i)) ctrlSetStructuredText 
				parseText 
					format ["<t align='left' color='#ffffff'>%3%1</t>",
						(_player call getNickName),
						(["","[D] "] select (_player getVariable ["dealer",false]))
					];
					
			(_groupPlayers controlsGroupCtrl (62150 + _i)) ctrlSetText format["$%1",[(_player getVariable ["stack",0])] call RRPClient_util_numberText];

			if (_player_hand_index != -1) then {
				if (_i isEqualTo life_poker_index) then {
					_cards_array = (_hands select _player_hand_index) select 1;
					(_groupPlayers controlsGroupCtrl (62190 + _i)) ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",(_cards_array select 0) select 0,(_cards_array select 0) select 1];
					(_groupPlayers controlsGroupCtrl (62200 + _i)) ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",(_cards_array select 1) select 0,(_cards_array select 1) select 1];
					
					_p_card_1 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",(_cards_array select 0) select 0,(_cards_array select 0) select 1];
					_p_card_2 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",(_cards_array select 1) select 0,(_cards_array select 1) select 1];
				} else {
					(_groupPlayers controlsGroupCtrl (62190 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
					(_groupPlayers controlsGroupCtrl (62200 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
				};
			} else {
				(_groupPlayers controlsGroupCtrl (62190 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
				(_groupPlayers controlsGroupCtrl (62200 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
			};
		} else {
			(_groupPlayers controlsGroupCtrl (62160 + _i)) ctrlSetStructuredText parseText "Место свободно";
			(_groupPlayers controlsGroupCtrl (62150 + _i)) ctrlSetStructuredText parseText "";
			(_groupPlayers controlsGroupCtrl (62180 + _i)) ctrlSetStructuredText parseText "";
			(_groupPlayers controlsGroupCtrl (62190 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
			(_groupPlayers controlsGroupCtrl (62200 + _i)) ctrlSetText "\RRP_icons\poker\shirt.paa";
		};
	};
};


if (_mode isEqualTo "FLOP") then {
	[objNull, "flop"] call RRPClient_poker_showMove;
	_t_card_1 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card1 select 0,_card1 select 1];
	_t_card_2 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card2 select 0,_card2 select 1];
	_t_card_3 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card3 select 0,_card3 select 1];
};

if (_mode isEqualTo "TURN") then {
	[objNull, "turn"] call RRPClient_poker_showMove;
	_t_card_4 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card4 select 0,_card4 select 1];
};


if (_mode isEqualTo "RIVER") exitWith {
	[objNull, "river"] call RRPClient_poker_showMove;
	_t_card_5 ctrlSetText format ["\RRP_icons\poker\%1_%2.paa",_card5 select 0,_card5 select 1];
};
