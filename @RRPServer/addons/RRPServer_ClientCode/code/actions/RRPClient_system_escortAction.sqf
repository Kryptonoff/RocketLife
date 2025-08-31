/*
	Filename: 	RRPClient_system_escortAction.sqf
	Project: 	Rimas Altis Life RPG
*/
if !(canSuspend) exitWith {_this spawn RRPClient_system_escortAction};
#include "..\..\script_macros.hpp"
try {
	private _unit = param [0,objNull,[objNull]];
	if !(NOTATTACHED(_unit)) throw "Эскорт недоступен";
	if !(EQUAL((call RRPClient_util_attachedObjectsPlayer),[])) throw "Эскорт недоступен";
	if (!isNull(player getVariable ["escortingPlayer",objNull])) throw "Эскорт недоступен";

	if (_unit GVAR ["restrained_prone",false]) throw "Вы не можете перемещать сидящего задержанного";
	if (isNil "_unit" || isNull _unit || !(isPlayer _unit)) throw "Игрока нет";
	if (player distance _unit > 5) throw "Вы далеко от задержанного";

	[player,"escortingPlayer",_unit] call CBA_fnc_setVarNet;
	[_unit,"Escorting",true] call CBA_fnc_setVarNet;
	{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction","Action"];
	[player] remoteExec ["RRPClient_system_escortCheckRelog",_unit];

	switch (currentWeapon player) do {
		case "am_policeStick": {
			player action ["SwitchWeapon", player, player, 100];
			uiSleep 2.9;
			player playActionNow "ag_hostageEscort_unnarmed";
			_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
		};
		case "": {
			player playActionNow "ag_hostageEscort_unnarmed";
			_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
		};
	    case (primaryWeapon player): {
			player playActionNow "Disable_Gesture";
			[player,"ag_hostage_primary_main_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			[_unit,"ag_hostage_primary_victim_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			_unit attachTo [player,[0,0.85,0]];
			uiSleep 1.7;
			player playActionNow "ag_hostage_primary_main_loop";
			uiSleep 0.181;
			[player,"ag_hostage_idle_MS",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			player forceWalk true;
			[_unit,"ag_hostage_primary_victim_loop",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			_unit attachTo [player,[-0.06,0.31,-1.53],"LeftHand"];
		};
	    case (handgunWeapon player): {
			player playActionNow "Disable_Gesture";
			escort_weapon_lowered = 0;
			_unit attachTo [player,[0,0.75,0]];
			[player,"ag_hostage_main_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			[_unit,"ag_hostage_victim_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			uiSleep 1.7;
			player playActionNow "ag_hostage_main_loop";
			uiSleep 0.118;
			[player,"ag_hostage_idle_MS",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			player forceWalk true;
			[_unit,"ag_hostage_victim_loop",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			_unit attachTo [player,[-0.1,0.92,-1.36],"Spine3"];
		};
	    case (secondaryWeapon player): {
			player action ["SwitchWeapon", player, player, 100];
			uiSleep 2.9;
			player playActionNow "ag_hostageEscort_unnarmed";
			_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
		};
	    default {
			player playActionNow "ag_hostageEscort_unnarmed";
			_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
		};
	};
	[_unit] spawn {
		private _unit = param [0,objNull,[objNull]];

		_text = switch (currentWeapon player) do {
			case (primaryWeapon player): {"<t color='#ffffff' shadow='1' size = '.6'>Отпустить - <t color='#ffa600'>E</t></t><br/><t color='#ffffff' shadow='1' size = '.6'>Убить - <t color='#ffa600'>R</t></t>"};
			case (handgunWeapon player): {"<t color='#ffffff' shadow='1' size = '.6'>Отпустить - <t color='#ffa600'>E</t></t><br/><t color='#ffffff' shadow='1' size = '.6'>Вырубить - <t color='#ffa600'>R</t></t><br/><t color='#ffffff' shadow='1' size = '.6'>Выставить\Убрать ствол - <t color='#ffa600'>T</t></t>"};
			case (secondaryWeapon player): {"<t color='#ffffff' shadow='1' size = '.6'>Отпустить - <t color='#ffa600'>E</t></t>"};
			default {"<t color='#ffffff' shadow='1' size = '.6'>Отпустить - <t color='#ffa600'>E</t></t>"};
		};

	    waitUntil {
			[_text,0,1,8,0,0,789] spawn BIS_fnc_dynamicText;
			if (isWalking player && !(currentWeapon player isEqualTo "")) then {player forceWalk true};

			isNull _unit || (call RRPClient_system_isInterrupted) || LSNOTALIVE(_unit) || {!(_unit getVariable ["Escorting",false])}
		};

		["",0,1,8,0,0,789] spawn BIS_fnc_dynamicText;
		[player,"escortingPlayer"] call RRPClient_system_clearGlobalVar;
		{inGameUISetEventHandler [_x, "false"]} forEach ["PrevAction", "NextAction","Action"];
		escort_weapon_lowered = nil;
		escort_action = nil;
		player playActionNow "Disable_Gesture";

		if (isNull _unit) exitWith {[player,"",true,false] remoteExecCall ["RRPClient_system_animSync",0]};

		if (LSNOTALIVE(_unit)) then {
			[player,"",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			[_unit,"Escorting"] call RRPClient_system_clearGlobalVar;
		};

		if (call RRPClient_system_isInterrupted) then {
	   		detach _unit;
			[player,"",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			[_unit,"",true,false] remoteExecCall ["RRPClient_system_animSync",0];
			[_unit,"Escorting"] call RRPClient_system_clearGlobalVar;
		};
	};
} catch {
	["Эскорт", _exception] call toastError;
};