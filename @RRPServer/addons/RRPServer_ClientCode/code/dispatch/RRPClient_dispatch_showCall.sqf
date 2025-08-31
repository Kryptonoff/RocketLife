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

if (((count _var)-1) < _curSelection) exitWith {["Что-то не так, откройте меня заново"] call hints};
_data = _var select _curSelection;

[format ["<t color='#FFCC00'><t size='2'><t align='center'>Сообщение<br/><br/><t color='#33CC33'><t align='left'><t size='1'><t color='#ffffff'><br/><t color='#33CC33'>От: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",(_data select 0),(_data select 2)]] call hints;
