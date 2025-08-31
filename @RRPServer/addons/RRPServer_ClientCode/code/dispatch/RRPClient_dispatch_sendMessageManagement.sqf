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

_text = ctrlText 6945;
if ((_requestList lbData _curSelection) isEqualTo "NULL") exitWith {};
if (_text isEqualTo "") exitWith {["Напишите сообщение или используйте уже заготовленные"] call hints};

_message = "";

_sendPos = cbChecked (_slide controlsGroupCtrl 6946);

if (_sendPos) then {
    _gridpos = mapGridPosition (getPos player);
    if ((count _gridpos) isEqualTo 6) then {_gridpos = format ["%1 %2",_gridpos select [0,3],_gridpos select [3,3]]};
    _message = format ["%1<br/><br/><t color='#33CC33'>%3 <t color='#FFFFFF'>%2",_text,_gridpos,"Позиция"];
} else {
    _message = _text;
};

_var = [];
if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};

if (((count _var)-1) < _curSelection) exitWith {["Что-то не так, откройте меня заново"] call hints};

_playerTo = (_var select _curSelection) select 5;
if (isNull _playerTo) exitWith {};

[_message,(player call getFullName),0] remoteExec ["RRPClient_system_clientMessage",_playerTo];
[format ["Вы отправили сообщение %1 : %2",(_playerTo call getFullName),_message]] call hints;
