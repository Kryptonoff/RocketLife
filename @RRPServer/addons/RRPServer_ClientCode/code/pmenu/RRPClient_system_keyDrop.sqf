/*
	
	Filename: 	RRPClient_system_keyDrop.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
_mainGroup = _display displayCtrl 24001;
_keySlide = _mainGroup controlsGroupCtrl 30000;
_list = _keySlide controlsGroupCtrl 3002;

_sel = lbCurSel _list;
if(_sel == -1) exitWith {};
_index = _list lbData _sel;
if (_index == "") exitWith {};

_vehicle = life_vehicles select parseNumber(_index);
if(_vehicle isKindOf "House_F") exitWith {["Вы не можете выбросить ключи от дома"] call hints};
if !(_vehicle getVariable ["vehicle_limits",""] isEqualTo "") exitWith {"Ключи от этого трансопрта нельзя выбрасывать" call toastError};

_owners = _vehicle GVAR "vehicle_info_owners";

_index2 = [steamid,_owners] call RRPClient_system_index;
life_vehicles = life_vehicles - [_vehicle];
_owners set[parseNumber(_index),-1];
_owners = _owners - [-1];
_vehicle SVAR ["vehicle_info_owners",_owners,true];

call RRPClient_system_keyMenu;
