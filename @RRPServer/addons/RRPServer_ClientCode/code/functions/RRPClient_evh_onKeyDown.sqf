/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
private _handled = false;
private _cursorTarget = cursorObject;
RRPClientKeyHandle = false;

if (call RRPClient_system_isInputBlocked && {!(_code in [15,207])}) exitWith {true};
if (_code in (actionKeys "NextChannel" + actionKeys "PrevChannel")) exitWith {true};
if (_code in (actionKeys "TacticalView" + actionKeys "SelectAll" + actionKeys "forceCommandingMode" + [11,14,68,36])) exitWith {true};
private _wasd = (actionKeys "MoveForward" + actionKeys "MoveBack" + actionKeys "TurnLeft" + actionKeys "TurnRight");
if (call RRPClient_system_isInputBlocked && {_code in _wasd}) exitWith {true};
if (life_action_inUse) then {
	if (!life_interrupted && _code in _wasd) then {life_interrupted = true};
};

private _flagKey = if (EQUAL((actionKeys "User9"),[])) then {20} else {(actionKeys "User9") select 0};

private _mapKey = (actionKeys "ShowMap") select 0;

if (_code in [0x21] && {RRPClientActiveAnim}) exitWith { RRPClientActiveAnim = false; true};

private ["_veh","_locked"];

switch (true) do 
{
	case !(isNull(player getVariable ["escortingPlayer",objNull])) : {
		if (_code in (actionKeys "SwitchPrimary" + actionKeys "SwitchHandgun" + actionKeys "SwitchSecondary" + actionKeys "switchWeapon" + actionKeys "handgun")) exitWith {true};
		//Движения
		if (_code in [17,30,31,32]) exitWith {false};
		//Обзор
		if ((_code isEqualTo 56) && _alt) exitWith {false};
		//Смена вида
		if (_code in (actionKeys "personView")) exitWith {false};
		//Беруши
		if ((_code isEqualTo 207) && _ctrlKey) exitWith {false};
		//Переключение громкости ТФ
		if (_code in [15,29]) exitWith {false};

		//E
		if (_code isEqualTo 18 && !(missionNameSpace getVariable ["escort_action",false])) exitWith {escort_action = true; [] spawn RRPClient_system_stopEscorting; true;};
		//R
		if (_code isEqualTo 19 && !(missionNameSpace getVariable ["escort_action",false])) exitWith {
			escort_action = true;
			[] spawn {
				switch (currentWeapon player) do {
					case (primaryWeapon player): {
						_count = player ammo primaryWeapon player;
						if (_count <= 0) then {
							["Эскорт","У вас нет патронов"] call toastError;
							escort_action = false;
						} else {
							_unit = (player getVariable ["escortingPlayer",objNull]);
							player playActionNow "Disable_Gesture";
							[player,"ag_hostage_primary_main_killed",true,false] remoteExecCall ["RRPClient_system_animSync",0];
							[_unit,"ag_hostage_primary_victim_killed",true,false] remoteExecCall ["RRPClient_system_animSync",0];
							_unit attachTo [player,[0,0.85,0]];
							uiSleep 2;
							player forceWeaponFire [weaponState player select 1, weaponState player select 2];
							[_unit,player] remoteExec ["RRPClient_dmg_Agony",_unit];
							detach _unit;
							uiSleep 1.1;
							player forceWalk false;
							[player,"AmovPercMstpSrasWrflDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
							escort_action = false;
							[_unit,"Escorting"] call RRPClient_system_clearGlobalVar;
						};
						true;
					};
					case (handgunWeapon player): {
						_unit = (player getVariable ["escortingPlayer",objNull]);
						_unit attachTo [player,[0,0.75,0]];
						player playActionNow "Disable_Gesture";
						[player,"ag_hostage_main_punch",true,false] remoteExecCall ["RRPClient_system_animSync",0];
						[_unit,"ag_hostage_victim_punch",true,false] remoteExecCall ["RRPClient_system_animSync",0];
						uiSleep 2.8;
						player forceWalk false;
						detach _unit;
						[player,"AmovPercMstpSrasWpstDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
						uiSleep 1.6;
						[_unit,player,"melee"] remoteExec ["RRPClient_system_tazed",_unit];
						escort_action = false;
						[_unit,"Escorting"] call RRPClient_system_clearGlobalVar;
					};
					case (secondaryWeapon player): {escort_action = false;};
					default {escort_action = false;};
				};
			};
			_handled = true;
		};
		//T
		if ((_code isEqualTo 20) && ((currentWeapon player) isEqualTo (handgunWeapon player)) && !(missionNameSpace getVariable ["escort_action",false])) exitWith {
			[] spawn {
				escort_action = true;
				if ((missionNameSpace getVariable ["escort_weapon_lowered",0]) isEqualTo 0) then {
					player playActionNow "ag_hostage_main_weaponOn_translate";
					escort_weapon_lowered = 1;
					uiSleep 1.1;
					player playActionNow "ag_hostage_main_weaponOn_loop";
				} else {
					player playActionNow "ag_hostage_main_weaponOn_translateback";
					uiSleep 1.1;
					escort_weapon_lowered = 0;
					player playActionNow "ag_hostage_main_loop";
				};
				escort_action = false;
			};
			_handled = true;
		};
		_handled = true;
	};
	case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code isEqualTo DIK_W)) : {
		pizza_lockpick_rotate_lock = true;
		_handled = true;
	};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code isEqualTo DIK_S)) : {
		_handled = true;
	};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (pizza_lockpick_rotate_pick isEqualTo 0) && (_code isEqualTo DIK_A)) : {
		pizza_lockpick_rotate_pick = 1;
		_handled = true;
	};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (pizza_lockpick_rotate_pick isEqualTo 0) && (_code isEqualTo DIK_D)) : {
		pizza_lockpick_rotate_pick = 2;
		_handled = true;
	};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code isEqualTo DIK_ESCAPE)) : {
		("hud_lockpick" call BIS_fnc_rscLayer) cutRsc ["hud_default", "plain"];
		_handled = true;	
	};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code in (actionKeys "lookAround")) || (_code in (actionKeys "personView"))) : {_handled = false};
 	
 	case (_code in actionKeys "Gear"): {
		[] spawn RRPClient_inventory_open;
		_handled = true;
	};

	case (_code isEqualTo 18): 
	{
		if !(player getVariable ["KeyEActive", false]) then {
			if (cursorObject getVariable ["donMachine", false] && {player distance cursorObject < 5}) then 
			{
				[cursorObject] call RRPClient_don_init;
			};
			[] spawn 
			{ 
				player setVariable ["KeyEActive", true, true];
				sleep 0.5;
				player setVariable ["KeyEActive", false, true];
			};	
		};
	};
	case (_code isEqualTo 33): {
			if !(player getVariable ["KeyFActive", false]) then {
				if (cursorObject getVariable ["donMachine", false] && {player distance cursorObject < 5}) then 
				{
					[cursorObject] call RRPClient_don_cashout;
				};
				[] spawn 
				{ 
					player setVariable ["KeyFActive", true, true];
					sleep 0.5;
					player setVariable ["KeyFActive", false, true];
				};	
			};
        };

	case (_code isEqualTo 0x01):
	{
		if (RRPClientIsPlayingRussianRoulette) then
		{
			if (RRPClientRussianRouletteCanEscape) then
			{
				[SessionId,[]] remoteExecCall ["RRPServer_russianRoulette_leaveRussianRouletteRequest",2];
				RRPClientRussianRouletteCanEscape = false;
			};
			_handled = true;
		};
	};
	case (_code isEqualTo DIK_SPACE): 
	{
		if (!RRPClientIsPlayingRussianRoulette) then
		{
			if (isNil "jumpActionTime") then {jumpActionTime = 0;};
			if (_shift && !_ctrlKey) then {
				if (!life_is_arrested && {isNull life_DraggedBody} && {!([player] call RRPClient_system_checkForSearch)} && {call RRPClient_util_checkParkour} && {time - jumpActionTime > 1.5}) then {
					jumpActionTime = time;
					[player] call babe_em_fnc_detect;
				}else{
					if (isNull (objectParent player) && {!dialog} && {!life_is_arrested} && {isNull life_DraggedBody}) then {
						[] spawn RRPClient_actions_jump;
					};
				};
			};
		};
	};

	//Map Key
	case (EQUAL(_code,_mapKey)): {
		switch (player call getSide) do {
			case "med": {if(!visibleMap) then {[] spawn RRPClient_system_medicMarkers;}};
			case "cop": {if(!visibleMap) then {[] spawn RRPClient_system_copMarkers;}};
		};
		if (!visibleMap) then {
			[] spawn RRPClient_markers_menuShow;
		};
	};

    case (EQUAL(_code,15)): {
		if(_alt && !_shift) then {
			//[0,format["Сервер: %1 нажал ALT+TAB! Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				call RRPClient_system_saveGear;
			};
		};
    };

    case (EQUAL(_code,211)): 
	{
		if(_ctrlKey && _alt)  then 
		{
			// [1,format["Сервер: %1 нажал CTRL + ALT + DEL!  Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
			_handled = true;
			if (!isnull (findDisplay 602)) then 
			{
				call RRPClient_system_saveGear;
			};
		};
    };
	case (EQUAL(_code,74)): 
	{
		if(_shift) then 
		{
			_handled = true;
			["SHIFTMINUS",format["%1 (%2) use shift minus endmission",GVAR_RNAME(player),steamid]] remoteExecCall ["TON_fnc_customLog",RSERV];
		};
	};
	case (EQUAL(_code,0x14)):
	{
		if (call life_adminLevel >= 1) then
		{
			if (_shift && _ctrlKey) then 
			{
				_handled = true;
				call RRPClient_event_radiationDialog;
			};
		};
	};
	case (EQUAL(_code,20)): 
	{
		/*
		if(!_alt && !_ctrlKey && !_shift) then
		{
			_handled = true;
			[] spawn RRPClient_system_openInventory;
		};
		*/
		if (_shift) then
		{
			missionNamespace setVariable ["mav_taxi_v_dialog_handlerBlockedUntil", diag_tickTime + 1];
			if (!isNull (uiNamespace getVariable ["RscTitleTaxiFareSummary", displayNull])) then
			{
				["RscTitleTaxiFareSummary", 1] call mav_gui_fnc_destroyLayer;
				missionNamespace setVariable ["mav_taxi_v_dialog_handlerBlockedUntil", diag_tickTime + 4];
			};
		};
	};
	case (_code in [DIK_F1,DIK_F2,DIK_F3,DIK_F4,DIK_F5,DIK_F6,DIK_F7,DIK_F8,DIK_F9]): 
	{
		_animation = switch (_code) do 
		{
			case DIK_F1: {"CRPTHSHold"};
			case DIK_F2: {"CRPTHSForward"};
			case DIK_F3: {"CRPTHSWarning"};
			case DIK_F4: {
				if (_alt && !_shift) exitWith {
					_handled = true;
					if (!isnull (findDisplay 602)) then {
						call RRPClient_system_saveGear;
					};
				};
				"CRPTHSPoint"
			};
			case DIK_F5: {"cl3_yes"};
			case DIK_F6: {"cl3_no_way"};
			case DIK_F7: {"cl3_thumbs_up"};
			case DIK_F8: {"cl3_thumbs_down"};
			case DIK_F9: {"cl3_clapping"};
			default {};
		};
		if (isNull (objectParent player) && {!dialog} && {!life_dance} && {isNull life_DraggedBody} && {!_handled}) then 
		{
			[_animation] call RRPClient_gestures_playAction;
		};
		_handled = true;
	};
	case (_code in [2,3,4,5,6,7,8,9,10]):
	{
		if(!dialog && !life_knockout && !(player getVariable ["surrender",false])) then {
			_array = switch (_code) do {
				case 2 : {[0,(bind_number_array select 0)]};
				case 3 : {[1,(bind_number_array select 1)]};
				case 4 : {[2,(bind_number_array select 2)]};
				case 5 : {[3,(bind_number_array select 3)]};
				case 6 : {[4,(bind_number_array select 4)]};
				case 7 : {[5,(bind_number_array select 5)]};
				case 8 : {[6,(bind_number_array select 6)]};
				case 9 : {[7,(bind_number_array select 7)]};
				case 10 : {[8,(bind_number_array select 8)]};
				default {0};
			};
			_array call RRPClient_hotkeys_useHotKey;
			_handled = true;
		};
	};
};

_handled
