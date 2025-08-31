/*
	
	Filename: 	RRPClient_system_keyGive.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_dialog","_list","_plist","_sel","_vehicle","_vehicleIndex","_owners","_index","_unit","_uid"];
disableSerialization;

_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
_mainGroup = _display displayCtrl 24001;
_keySlide = _mainGroup controlsGroupCtrl 30000;
_list = _keySlide controlsGroupCtrl 3002;
_plist = _keySlide controlsGroupCtrl 3005;

_sel = lbCurSel _list;
_vehicleIndex = _list lbData _sel;
if (_vehicleIndex == "") exitWith {};
_vehicle = life_vehicles select parseNumber(_vehicleIndex);
if !(_vehicle getVariable ["vehicle_limits",""] isEqualTo "") exitWith {"Ключи от этого трансопрта нельзя передавать" call toastError};

_sel = lbCurSel _plist;
_unit = objectFromNetId(_plist lbData _sel);
if(isNull _unit OR isNil "_unit") exitWith {}; 

_uid = getPlayerUID _unit;
_owners = _vehicle GVAR "vehicle_info_owners";
_index = [_uid,_owners] call RRPClient_system_index;
if(_index == -1) then {
	_owners pushBack [_uid,GVAR_RNAME(_unit)];
	_vehicle SVAR ["vehicle_info_owners",_owners,true];
};

[format["Вы передали %1 ключи от %2",GVAR_RNAME(_unit),getText(configOf _vehicle >> "displayName")]] call hints;
[_vehicle,_unit,GVAR_RNAME(player)] remoteExecCall ["RRPClient_system_keyRecive",_unit];
["keys",1] call RRPClient_ach_gateway;
