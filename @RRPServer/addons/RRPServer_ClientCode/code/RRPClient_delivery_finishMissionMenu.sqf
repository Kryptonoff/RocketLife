/*
	
	Filename: 	RRPClient_delivery_finishMissionMenu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private["_nearVehicles","_cargoDepo","_title","_control","_displayName","_className","_picture","_cargoDeliver","_fromTitle","_toTitle","_getButton","_doneButton","_vehData","_ownerName"];
life_depo = param [0,ObjNull,[ObjNull]];
_nearVehicles = nearestObjects [life_depo,["LandVehicle"],25];
if (count _nearVehicles == 0) exitWith {};
if (life_action_inUse) exitWith {};

disableSerialization;
if(isNull (findDisplay 4300)) then {
	if !(createDialog "UnionDialogDeliver") exitWith {};
};

_title = CONTROL(4300,4301);
_control = CONTROL(4300,4302);
_getButton = CONTROL(4300,4303);
_doneButton = CONTROL(4300,4304);

_depoName = [str(life_depo)] call RRPClient_system_varToStr;

_title ctrlSetText format["Сдача груза в грузовом депо %1",_depoName];
_getButton ctrlShow false;
_doneButton ctrlShow true;
lbclear _control;

{
	if(alive _x) then {
		_cargoDeliver = _x GVAR ["cargoDeliver",[]];
		if(_x in life_vehicles && {count _cargoDeliver != 0}) then {

			_displayName = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
			_picture = getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture");

			_vehData = _x GVAR ["vehicle_info_owners",[]];
			if(count _vehData  > 0) then {
				_ownerName = (_vehData select 0) select 1;
			} else {_ownerName = "???"};

			_control lbAdd format["%1 (Владелец: %2)",_displayName,_ownerName];

			_fromTitle = [_cargoDeliver select 0] call RRPClient_system_varToStr;
			_toTitle = [_cargoDeliver select 1] call RRPClient_system_varToStr;

			_price = _cargoDeliver select 2;
			_control lbSetTextRight [(lbSize _control)-1, format["Из %1 в %2 за $%3",_fromTitle,_toTitle,[_price] call RRPClient_util_numberText]];
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
		};
	};
} foreach _nearVehicles;