/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
try{
    private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 19000;

    private _requestList = _slide controlsGroupCtrl 6943;
    private _curSelection = lbCurSel _requestList;

    if (_curSelection isEqualTo -1) throw "Вы должны выбрать вызов...";
    if ((_requestList lbData _curSelection) isEqualTo "NULL") exitWith {};

    _var = [];
    if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
    if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};

    if (((count _var)-1) < _curSelection) throw "Что-то не так, откройте меня заново";
    _data = _var select _curSelection;
    _position = _data select 1;

    if ((player distance _position) < 20) throw "Вы слишком близко к месту вызова!";
    if (!(isNull RRPClient_call_curTask)) then {
        player removeSimpleTask RRPClient_call_curTask;
    };

    _type = switch (_data select 6) do { 
        case 0 : {"Сообщение"};
        case 1 : {"Call"};
        default {"NULL"};
    };
    _text = format ["%1 : %2",_type,(_data select 0)];
    _task = player createSimpleTask [_text];
    _task setSimpleTaskDestination _position;
    _task setSimpleTaskDescription [(_data select 2),_text,""];
    _task setTaskState "ASSIGNED";
    player setCurrentTask _task;
    RRPClient_call_curTask = _task;

    ctrlSetText [6953,"a3\3den\data\cfgwrapperui\cursors\3denplacewaypoint_ca.paa"];
    buttonSetaction [6953,"[] spawn RRPClient_dispatch_removeWaypoint;"];

    while {true} do {
        if (isNull RRPClient_call_curTask) exitWith {};
        if ((player distance (taskDestination RRPClient_call_curTask)) < 20) exitWith {
            player removeSimpleTask RRPClient_call_curTask;
        };

        _condition = false;
        _text = taskDescription RRPClient_call_curTask;
        _text = _text select 0;

        {
            if ((_x select 2) isEqualTo _text) exitWith {_condition = true};
        } forEach _var;

        if !(_condition) exitWith {
            player removeSimpleTask RRPClient_call_curTask;
        };
        uiSleep 3;
    };
}catch{
    ["ErrorTitleAndText",[_exception]] call toast;
};