/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 19000;

private _requestList = _slide controlsGroupCtrl 6943;
private _curSelection = lbCurSel _requestList;

if (_curSelection isEqualTo -1) exitWith {["Вы должны выбрать вызов..."] call hints};
if ((_requestList lbData _curSelection) isEqualTo "NULL") exitWith {};

_var = [];
if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};

if (((count _var)-1) < _curSelection) exitwith {["Что-то не так, откройте меня заново"] call hints};
_curSelection = _var select _curSelection;
_player = _curSelection select 5;

_inCall = player getVariable "in_call";
if (_inCall) exitWith {["Занято!"] call hints};

(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_hang_up.paa";
(_slide controlsGroupCtrl 6940) buttonSetaction "[] spawn RRPClient_dispatch_endCall;";

_player setVariable ["call_status",1,true];
_fromNum = _player getVariable "maxence_numero";

player setVariable ["in_call",true,true];
player setVariable ["calling_with",_player,true];
player setVariable ["calling_time",0];
player setVariable ["calling_number",_fromNum];

_direction = round (random 360);
player setVariable ["calling_direction",_direction];
_player setVariable ["calling_direction",(_direction / 2)];

RRPClient_caller = 0;

// [player] remoteExec ["max_phone_fnc_initCallReceiver",_player];
// [_player] spawn max_phone_fnc_callLoop;

waitUntil {!(player getVariable "in_call")};
_player setVariable ["call_status",2,true];
