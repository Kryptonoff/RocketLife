/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
	
*/

#include "..\script_macros.hpp"
private ["_ConditionArray","_whose_gate_we_open","_step","_error","_mode","_gate","_OBJsound"];
//if !(call RRPClient_system_checkMask) exitWith {}; //забыл надеть маску
_ConditionArray = _this select 3;
_whose_gate_we_open = _ConditionArray select 1;
_step = 0;
_error = false;
_mode = -1;
_gate = switch (_whose_gate_we_open) do
{
	case "breakingGate_kasatky"  : {[vorota_kasadky,say3d_kasatky]};
	case "breakingGate_chrome"   : {[vorota_chrome,say3d_chrome]};
	case "breakingGate_punish"   : {[vorota_punish,say3d_punish]};
	case "breakingGate_far"      : {[vorota_far,say3d_far]};
	case "breakingGate_enclav"   : {[vorota_enclav,say3d_enclav]};
	case "breakingGate_outcast"  : {[vorota_outcast,say3d_outcast]};
	case "breakingGate_constant" : {[vorota_constant,say3d_constant]};
	case "breakingGate_escobaro" : {[vorota_escobaro_1,vorota_escobaro_2,vorota_escobaro_3,say3d_escobaro]};
	case "breakingGate_BW"       : {[vorota_BW,say3d_BW]};
	case "breakingGate_BS"       : {[vorota_BS,say3d_BS]};
	case "breakingGate_cigane"   : {[vorota_cigane,say3d_cigane]};
	case "breakingGate_DW"       : {[vorota_DW,say3d_DW]};
	case "breakingGate_imperium"  : {[vorota_imperium,say3d_imperium]};
	case "breakingGate_Phoenix_1"  : {[vorota_Phoenix_1_1,vorota_Phoenix_1_2,vorota_Phoenix_1_3,say3d_Phoenix_1]};
	case "breakingGate_Phoenix_2"  : {[vorota_Phoenix_2,say3d_Phoenix_2]};
	case "breakingGate_Phoenix_3"  : {[vorota_Phoenix_3_1,vorota_Phoenix_3_2,say3d_Phoenix_3]};
	case "breakingGate_deadlock"  : {[vorota_deadlock,say3d_deadlock]};
	case "breakingGate_CWRKA"  : {[vorota_CWRKA,say3d_CWRKA]};
	case "breakingGate_umbrella"  : {[vorota_umbrella,say3d_umbrella]};
	default {"error"};
};

if (_gate isEqualto "error") exitwith {"ERROR!!! Ошибка в AddAction, сделайте скриншот и сообщите администатору!" call chat};
if (_gate select 0 isEqualto objNull) exitwith {"Неопределенный объект, сделайте скриншот и сообщите администатору!" call chat};


if ((!(vorota_Phoenix_1_1 getVariable ['breakingGate_Phoenix_1',false]) and (_whose_gate_we_open isEqualTo "breakingGate_Phoenix_2"))) exitWith {
	["ErrorTitleAndText", ["Отказ", "Для взлома линии обороны #2, нужно взломать линию обороны #1"]] call SmartClient_gui_toaster_addTemplateToast;
};
if ((!(vorota_Phoenix_2 getVariable ['breakingGate_Phoenix_2',false]) and (_whose_gate_we_open isEqualTo "breakingGate_Phoenix_3"))) exitWith {
	["ErrorTitleAndText", ["Отказ", "Для взлома линии обороны #3, нужно взломать линию обороны #2"]] call SmartClient_gui_toaster_addTemplateToast;
};

life_action_inUse = true;
life_interrupted = false;

if ((_ConditionArray select 0) isEqualto "break") then
{
	_OBJsound = switch (_whose_gate_we_open) do {
			case "breakingGate_escobaro": {_gate select 3};
			case "breakingGate_Phoenix_1": {_gate select 3};
			case "breakingGate_Phoenix_3": {_gate select 2};
			default {_gate select 1};
	};

	for "_i" from 0 to 1 step 0 do
	{
		titleText [format["Отключаем защиту и систему питания... %1 процентов выполненно", round(_step / 300 * 100)],"PLAIN"];
		player playMove "CL3_anim_lockpick";
		_step = _step + 2;
		uiSleep 1;

		[_OBJsound,"alarm",140] remoteExecCall ["RRPClient_util_globalSound",RCLIENT];
		uiSleep 1;
		if (_step isEqualto  152) then {
			switch (_whose_gate_we_open) do {
					case "breakingGate_escobaro": {
						_gate select 0 animate ["GateDoor_3", 1];
						_gate select 1 animate ["GateDoor_3", 1];
						_gate select 2 animate ["GateDoor_3", 1];
					};
					case "breakingGate_Phoenix_1": {
						_gate select 0 animate ["GateDoor_3", 1];
						_gate select 1 animate ["GateDoor_3", 1];
						_gate select 2 animate ["GateDoor_3", 1];
					};
					case "breakingGate_Phoenix_3": {
						_gate select 0 animate ["GateDoor_3", 1];
						_gate select 1 animate ["GateDoor_3", 1];
					};
					default {
						_gate select 0 animate ["GateDoor_3", 1];
					};
			};
		    ["InfoTitleAndText", ["Ворота частично приоткрылись, можно войти ползком, до полного октрытия примерно 5 минут!"]] call SmartClient_gui_toaster_addTemplateToast;
		};
		if (_step isEqualto 300) exitWith {

			switch (_whose_gate_we_open) do {
			    case "breakingGate_escobaro": {
						_gate select 0 animate ["GateDoor_3", 5];
						_gate select 1 animate ["GateDoor_3", 5];
						_gate select 2 animate ["GateDoor_3", 5];
						_mode = 1;
					};
					case "breakingGate_Phoenix_1": {
						_gate select 0 animate ["GateDoor_3", 5];
						_gate select 1 animate ["GateDoor_3", 5];
						_gate select 2 animate ["GateDoor_3", 5];
						_mode = 1;
					};
					case "breakingGate_Phoenix_3": {
						_gate select 0 animate ["GateDoor_3", 5];
						_gate select 1 animate ["GateDoor_3", 5];
						_mode = 1;
					};
					default {
						_gate select 0 animate ["GateDoor_3", 5];
						_mode = 1;
					};
			};

		};
		if (speed player > 1 or !alive player or vehicle player != player or life_interrupted or (call RRPClient_system_isInterrupted)) exitWith {_error = true;};
	};
}
else
{
	for "_i" from 0 to 1 step 0 do
	{
		titleText [format["Восстанавливаем питание и включаем защиту... %1 % процентов выполненно",round(_step / 140 * 100)],"PLAIN"];
		player playMove "CL3_anim_lockpick";
		uisleep 2;
		_step = _step + 2;
		if ((_step isEqualto 140)) exitWith {
			switch (_whose_gate_we_open) do {
					case "breakingGate_escobaro": {
						_gate select 0 animate ["GateDoor_3", 0];
						_gate select 1 animate ["GateDoor_3", 0];
						_gate select 2 animate ["GateDoor_3", 0];
						_mode = 2;
					};
					case "breakingGate_Phoenix_1": {
						_gate select 0 animate ["GateDoor_3", 0];
						_gate select 1 animate ["GateDoor_3", 0];
						_gate select 2 animate ["GateDoor_3", 0];
						_mode = 2;
					};
					case "breakingGate_Phoenix_1": {
						_gate select 0 animate ["GateDoor_3", 0];
						_gate select 1 animate ["GateDoor_3", 0];
						_mode = 2;
					};
					default {
						_gate select 0 animate ["GateDoor_3", 0];
						_mode = 2;
					};
			};
		};
		if (speed player > 1 OR !alive player OR vehicle player != player OR life_interrupted or (call RRPClient_system_isInterrupted)) exitWith {_error = true};
	};
};

if (ISANIMSTATE("CL3_anim_lockpick")) then
{
	[player,"CL3_anim_lockpick",true] remoteExecCall ["RRPClient_system_animSync",RCLIENT];
}
else
{
	player playActionNow "stop";
};

titleText["","PLAIN"];
if (_error) exitWith {titleText["Поиск прерван","PLAIN"]; life_action_inUse = false;};
if (LSNOTALIVE(player)) exitWith {};
if(_mode isEqualto -1) exitWith {life_action_inUse = false;life_interrupted = true;};

if (_mode isEqualto 1) then
{
	switch (_whose_gate_we_open) do {
			case "breakingGate_escobaro": {
				_gate select 0 setVariable [_whose_gate_we_open, true, true];
				_gate select 1 setVariable [_whose_gate_we_open, true, true];
				_gate select 2 setVariable [_whose_gate_we_open, true, true];
				_mode = 1;
			};
			case "breakingGate_Phoenix_1": {
				_gate select 0 setVariable [_whose_gate_we_open, true, true];
				_gate select 1 setVariable [_whose_gate_we_open, true, true];
				_gate select 2 setVariable [_whose_gate_we_open, true, true];
				_mode = 1;
			};
			case "breakingGate_Phoenix_3": {
				_gate select 0 setVariable [_whose_gate_we_open, true, true];
				_gate select 1 setVariable [_whose_gate_we_open, true, true];
				_mode = 1;
			};
			default {
				_gate select 0 setVariable [_whose_gate_we_open, true, true];
				_mode = 1;
			};
	};
	["InfoTitleAndText", ["Щитовая взломана, Ворота открыты!"]] call SmartClient_gui_toaster_addTemplateToast;
}
else
{
	switch (_whose_gate_we_open) do {
	case "breakingGate_escobaro": {
		_gate select 0 setVariable [_whose_gate_we_open, false, true];
		_gate select 1 setVariable [_whose_gate_we_open, false, true];
		_gate select 2 setVariable [_whose_gate_we_open, false, true];
	};
	case "breakingGate_Phoenix_1": {
		_gate select 0 setVariable [_whose_gate_we_open, false, true];
		_gate select 1 setVariable [_whose_gate_we_open, false, true];
		_gate select 2 setVariable [_whose_gate_we_open, false, true];
	};
	case "breakingGate_Phoenix_3": {
		_gate select 0 setVariable [_whose_gate_we_open, false, true];
		_gate select 1 setVariable [_whose_gate_we_open, false, true];
	};
	default {
		_gate select 0 setVariable [_whose_gate_we_open, false, true];
	};
};
	["InfoTitleAndText", ["С електроникой все впорядке, ворота под замком..."]] call SmartClient_gui_toaster_addTemplateToast;
};

life_action_inUse = false;
life_interrupted = true;