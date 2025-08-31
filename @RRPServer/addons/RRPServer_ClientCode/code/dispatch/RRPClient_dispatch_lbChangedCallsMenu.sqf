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

if (_curSelection isEquaLTo -1) exitWith {};
if ((_requestList lbData 0) isEqualto "NULL") exitWith {};

_var = [];
if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};

if (((count _var)-1) < _curSelection) exitWith {
    _requestList lbDelete _curSelection;

    _time ctrlSetText "";
    _distance ctrlSetText "";
    _assigned ctrlSetText "";
    _name ctrlSetText "";
    _position ctrlSetText "";

    ctrlShow [6953,false];
    ctrlEnable [6954,false];
    ctrlEnable [6955,false];
    ctrlSetText [6932,""];
    ctrlShow [6956,false];

    if ((lbSize _requestList) isEqualTo 0) then {
        _requestList lbadd "Вызовов нет";
        _requestList lbSetData [0,"NULL"];
    };
};

_data = _var select _curSelection;

_type = switch (_data select 6) do { 
    case 0 : {"Сообщение"};
    case 1 : {"Call"};
    default {"NULL"};
};
_text = format ["%1 - %2",(_data select 0),_type];

if !(_text isEqualTo (_requestList lbText _curSelection)) exitWith {
    _requestList lbDelete _curSelection;

    _time ctrlSetText "";
    _distance ctrlSetText "";
    _assigned ctrlSetText "";
    _name ctrlSetText "";
    _position ctrlSetText "";

    ctrlShow [6953,false];
    ctrlEnable [6954,false];
    ctrlEnable [6955,false];
    ctrlSetText [6932,""];
    ctrlShow [6956,false];

    if ((lbSize _requestList) isEqualTo 0) then {
        _requestList lbadd "Вызовов нет";
        _requestList lbSetData [0,"NULL"];
    };
};

ctrlShow [6953,true];

if (isNull RRPClient_call_curTask) then {
    ctrlSetText [6953,"a3\3den\data\cfgwrapperui\cursors\3denplacewaypointmulti_ca.paa"];
    buttonSetAction [6953,"[] spawn RRPClient_dispatch_addWaypoint;"];
} else {
    if (!(((taskDescription RRPClient_call_curTask) select 0) isEqualTo (_data select 2))) then {
        ctrlSetText [6953,"a3\3den\data\cfgwrapperui\cursors\3denplacewaypointmulti_ca.paa"];
        buttonSetAction [6953,"[] spawn RRPClient_dispatch_addWaypoint;"];
    } else {
        ctrlSetText [6953,"a3\3den\data\cfgwrapperui\cursors\3denplacewaypoint_ca.paa"];
        buttonSetAction [6953,"[] spawn RRPClient_dispatch_removeWaypoint;"];
    };
};

_name ctrlSetText (_data select 0);
_pos = mapGridPosition (_data select 1);
if ((count _pos) isEqualTo 6) then {_pos = format ["%1 %2",_pos select [0,3],_pos select [3,3]]};

_position ctrlSetText _pos;

ctrlSetText [6932,"\rimas_dispatch\icons\bouton_assign.paa"];
_assigned ctrlSetText "Не назначен";
ctrlEnable [6954,true];

// ctrlShow [6956,true];

if ((_data select 6) isEqualTo 0) then {
	(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_see_message.paa";
    (_slide controlsGroupCtrl 6940) buttonSetAction "[] spawn RRPClient_dispatch_showCall;";

    ctrlShow [6940,true];
    ctrlEnable [6940,true];
    ctrlEnable [6942,true];
    ctrlEnable [6946,true];
    ctrlEnable [6947,true];

    if ((lbcursel 6947) isEqualTo 0) then {
        ctrlEnable [6945,true];
    } else {
        ctrlEnable [6945,false];
    };
} else {
    ctrlEnable [6942,false];
    ctrlEnable [6946,false];
    ctrlEnable [6945,false];
    ctrlEnable [6947,false];

    _player = (_data select 5);
    if (isNull _player) then {
		(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_call_ended.paa";

        (_slide controlsGroupCtrl 6940) buttonSetAction "";
        ctrlShow [6940,true];
        ctrlEnable [6940,false];
    } else {
        _status = _player getVariable ["call_status",0];
        if (_status isEqualTo 0) then {
			(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_reply_call.paa";
            (_slide controlsGroupCtrl 6940) buttonSetAction "[] spawn RRPClient_dispatch_replyCall;";
            ctrlShow [6940,true];
            ctrlEnable [6940,true];
        } else {
            if (_status isEqualTo 1) then {
                if ((player getVariable ["calling_with",objNull]) isEqualTo _player) then {
					(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_hang_up.paa";                           
                    (_slide controlsGroupCtrl 6940) buttonSetAction "[] spawn RRPClient_dispatch_endCall;";
                    ctrlShow [6940,true];
                    ctrlEnable [6940,true];
                } else {
					(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_in_call.paa";
                    (_slide controlsGroupCtrl 6940) buttonSetAction "";
                    ctrlShow [6940,true];
                    ctrlEnable [6940,false];
                };
            } else {
				(_slide controlsGroupCtrl 6933) ctrlSetText "\rimas_dispatch\icons\bouton_call_ended.paa";
                (_slide controlsGroupCtrl 6940) buttonSetAction "";
                ctrlShow [6940,true];
                ctrlEnable [6940,false];
            };
        };
    };
};

ctrlEnable [6955,true];

_distanceText = round (player distance (_data select 1));

if (_distanceText > 1000) then {
    _distanceText = format ["%1km",round (_distanceText / 1000)];
} else {
    _distanceText = format ["%1m",_distanceText];
};

_distance ctrlSetText _distanceText;
_map ctrlMapanimadd [1,0.3,(_data select 1)];
ctrlMapanimCommit _map;

while {(lbCurSel _requestList) isEqualTo _curSelection} do {
    if (((count _var)-1) < _curSelection) exitWith {};
    if !(_data isEqualTo (_var select _curSelection)) exitWith {};

    _timeStamp = serverTime - (_data select 3);
    if (_timeStamp > 60) then {
        _timeStamp = round (_timeStamp / 60);
        if (_timeStamp isEqualTo 1) then {
            _time ctrlSetText format ["1 %1","минут"];
        } else {
            _time ctrlSetText format ["%1 %2",_timeStamp,"минут"];
        };
    } else {
        _time ctrlSetText format ["%1 %2",round(_timeStamp),"секунд"];
    };

    uiSleep 1;
};
