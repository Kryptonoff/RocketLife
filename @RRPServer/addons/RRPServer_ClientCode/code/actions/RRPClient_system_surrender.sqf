#define LSNOTALIVE(unit1) unit1 getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]

if ( player getVariable ["restrained",false] ) exitWith {};
if ( player getVariable ["Escorting",false] ) exitWith {};
if (player getVariable ["surrender",false]) exitWith {[player,"surrender",false] call CBA_fnc_setVarNet;};
if ( vehicle player != player ) exitWith {};
if ((time - life_action_delay) < 2) exitWith {};
life_action_delay = time;

[player,"surrender",true] call CBA_fnc_setVarNet;
// ["info","","Вы сдались и закинули руки за голову! Нажмите Shift+B, чтобы опустить руки.",true] call life_fnc_message;

if !(currentWeapon player isEqualTo "") then {
	_sleep_time = switch (currentWeapon player) do {
		case (primaryWeapon player): {2.7};
		case (handgunWeapon player): {2.2};
		case (secondaryWeapon player): {2.9};
		default {2.7};
	};
	player action ["SwitchWeapon", player, player, 100];
    uiSleep _sleep_time;
};

player playAction "ag_handsUp_in";
uiSleep 1;

{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction","Action"];
private _anim_state = false;

waituntil {
    if (isNull objectParent player) then {
		if (((animationState player) select [0, 12]) isEqualTo "amovppnemstp") then {
			player playActionNow "ag_handsUp_prone_loop";
			player allowSprint false;
			_anim_state = true;
		} else {
			player playActionNow "ag_handsUp_loop";
			player allowSprint false;
			_anim_state = false;
		};
    };
	(!alive player || ((vehicle player) != player) || (LSNOTALIVE(player)) || (player getVariable ["restrained",false]) || !(player getVariable ["surrender",false]) || !(currentWeapon player isEqualTo ""))
};

[player,"surrender",false] call CBA_fnc_setVarNet;

if !(player getVariable ["restrained",false]) then {{inGameUISetEventHandler [_x, "false"]} forEach ["PrevAction", "NextAction","Action"];};
if (_anim_state) then {
	player playAction "ag_handsUp_prone_out";
	player allowSprint true;
} else {
	player playAction "ag_handsUp_out";
	player allowSprint true;
};
