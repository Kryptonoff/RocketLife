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
private _message = _slide controlsGroupCtrl 6947;
private _time = _slide controlsGroupCtrl 6948;
private _distance = _slide controlsGroupCtrl 6949;
private _assigned = _slide controlsGroupCtrl 6950;
private _name = _slide controlsGroupCtrl 6951;
private _position = _slide controlsGroupCtrl 6952;

private _cur = lbCurSel _requestList;

private _curSelection = lbCursel _message;
private _str = (_message lbData _curSelection);

(_slide controlsGroupCtrl 6945) ctrlSetText (_str);

if !((_cur isEqualTo -1) && ((_requestList lbData 0) isEqualto "NULL")) then {
    _var = [];
    if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
    if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};

    if (((count _var)-1) < _cur) then {
        _requestList lbDelete _cur;

        ctrlShow [6953,false];
        ctrlEnable [6954,false];
        ctrlEnable [6955,false];
        ctrlSetText [6932,""];
        ctrlShow [6956,false];

        _time ctrlSetText "";
        _distance ctrlSetText "";
        _assigned ctrlSetText "";
        _name ctrlSetText "";
        _position ctrlSetText "";

        if ((lbSize _requestList) isEqualTo 0) then {
            _requestList lbadd "Вызовов нет";
            _requestList lbSetData [0,"NULL"];
        };

        _playerData = _var select _cur;

        if ((_curSelection isEqualTo 0) && ((_playerData select 6) isEqualTo 0)) then {
            ctrlEnable [6945,true];
        } else {
            ctrlEnable [6945,false];
        };
    } else {
        if (_curSelection isEqualTo 0) then {
            ctrlEnable [6945,true];
        } else {
            ctrlEnable [6945,false];
        };
    };
} else {
    if (_curSelection isEqualTo 0) then {
        ctrlEnable [6945,true];
    } else {
        ctrlEnable [6945,false];
    };
};
