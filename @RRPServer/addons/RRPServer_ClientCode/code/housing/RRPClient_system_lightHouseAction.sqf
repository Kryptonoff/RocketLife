/*
	Filename: 	RRPClient_system_lightHouseAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;
private _houseDropdown = _slide controlsGroupCtrl 22007;
private _netID = _houseDropdown lbData (lbCurSel _houseDropdown);
private _house = objectFromNetId _netID;
private _lightsBtn = _slide controlsGroupCtrl 22010;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if (isNull (_house getVariable ["lightSource",ObjNull])) then {
	_lightsBtn ctrlSetText "Освещение ВКЛ";
} else {
	_lightsBtn ctrlSetText "Освещение ВЫКЛ";
};


if(isNull (_house getVariable ["lightSource",ObjNull])) then 
{
	[_house,true] remoteExecCall ["RRPClient_system_lightHouse",RCLIENT];
} else {	
	[_house,false] remoteExecCall ["RRPClient_system_lightHouse",RCLIENT];
};