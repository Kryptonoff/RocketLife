/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 19000;

private _requestList = _slide controlsGroupCtrl 6943;
private _map = _slide controlsGroupCtrl 6944;
private _time = _slide controlsGroupCtrl 6948;
private _distance = _slide controlsGroupCtrl 6949;
private _assigned = _slide controlsGroupCtrl 6950;
private _name = _slide controlsGroupCtrl 6951;
private _position = _slide controlsGroupCtrl 6952;
private _curSelection = lbCurSel _requestList;

if (_curSelection isEqualTo -1) exitWith { ["Вы должны выбрать вызов..."] call hints};
if ((_requestList lbData _curSelection) isEqualTo "NULL") exitWith {};

_var = [];
if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};

if (((count _var)-1) < _curSelection) exitwith {["Что-то не так, откройте меня заново"] call hints};

_data = _var select _curSelection;

_action = [
    format ["Вы уверены что хотите удалить вызов от %1?",(_data select 0)],
    "Управление вызовами",
    "Да",
    "Нет"
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

if (player call getSide isEqualTo "cop") then {
    RRPClient_waiting_cop_calls deleteAt _curSelection;
    publicVariable "RRPClient_waiting_cop_calls";
} else {
    if (player call getSide isEqualTo "med") then {
        RRPClient_waiting_med_calls deleteAt _curSelection;
        publicVariable "RRPClient_waiting_med_calls";
    };
};

_requestList lbDelete _curSelection;

if ((lbSize _requestList) isEqualTo 0) then {
    _requestList lbadd "Вызовов нет";
    _requestList lbSetData [0,"NULL"];
    
    ctrlEnable [6954,false];
    ctrlShow [6956,false];
    ctrlSetText [6932,""];
    ctrlEnable [6942,false];
    ctrlEnable [6955,false];
    ctrlShow [6940,false];
};

ctrlShow [6953,false];
_time ctrlSetText "";
_distance ctrlSetText "";
_assigned ctrlSetText "";
_name ctrlSetText "";
_position ctrlSetText "";

_map ctrlMapanimadd [1,0.3,(getpos player)];
ctrlMapanimCommit _map;
_requestList lbsetCurSel 0;
