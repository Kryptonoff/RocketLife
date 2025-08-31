/*

	Filename: 	RRPClient_inventory_drag.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _display = findDisplay 1000;
if !(isNull (_display displayCtrl 1300)) then {ctrlDelete (_display displayCtrl 1300)};
if !(isNull (_display displayCtrl 1301)) then {ctrlDelete (_display displayCtrl 1301)};

if (fl_inv_dragging) exitWith {};

private _initPos = ctrlPosition _displayorcontrol;
private _fixX = (_initPos select 2) / 2;
private _fixY = (_initPos select 3) / 2;

private _idx = ctrl_positions findIf {(_x select 1) call RRPClient_inventory_inControl};
if (_idx isEqualTo -1) exitWith {};

private _slotName = (ctrl_positions select _idx) select 0;
private _itemClass = uiNamespace getVariable [format["%1_class", _slotName], ""];
if (_itemClass isEqualTo "") exitWith {};

switch (_button) do { 
	case 0: {
		fl_inv_slotDragInfo = _slotName;
		call RRPClient_inventory_allowedSlots;

		fl_inv_dragging = true;
		while {fl_inv_dragging} do {
			_mousePos = getMousePosition;
			_displayorcontrol ctrlSetPosition [((_mousePos select 0) - _fixX), ((_mousePos select 1) - _fixY)]; // position the picture control on the cursor
			_displayorcontrol ctrlCommit 0;
		};
		_displayorcontrol ctrlSetPosition _initPos; 
		_displayorcontrol ctrlCommit 0;
	}; 
	case 1: {
		//[_slotName] call RRPClient_inventory_rightClick;
	}; 
	default {}; 
};
