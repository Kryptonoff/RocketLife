/*
	Filename: 	RRPClient_system_vehicleActions.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

_vehicle removeAction AID_CED;
_vehicle removeAction AID_CEP;
_vehicle removeAction AID_CEX;

AID_CED = _vehicle addAction [ "<t color='#00FF00'>Сесть на место водителя</t>",RRPClient_system_copEnter,"driver",200,false,false,"",' isNull objectParent _this && (player call getSide in ["cop","med"]) && (locked _target) != 0  && !life_inwarzone', 4];
AID_CEP = _vehicle addAction [ "<t color='#00FF00'>Сесть на место пассажира</t>",RRPClient_system_copEnter,"passenger",100,false,false,"",' isNull objectParent _this && (locked _target) != 0 && (player call getSide in ["cop","med"]) && !life_inwarzone', 4];
AID_CEX = _vehicle addAction [ "<t color='#bc0000'>Выход</t>",RRPClient_system_copEnter,"exit",100,false,false,"",' !isNull objectParent _this && (locked _target) == 2 && (player call getSide in ["cop","med"]) && !life_inwarzone'];
