/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Answers the query request to create the vehicle in the database.
*/
private ["_uid","_type","_classname","_color","_plate","_basePrice","_material"];
params
[
	["_uid","",[""]],
	["_vehicle",objNull,[objNull]],
	["_color","",[""]],
	["_material","",[""]],
	["_basePrice",0,[0]],
	["_plate","",[""]],
	["_key","",[""]]
];
if !(_key isEqualTo "") exitWith 
{
	["Spawn vehicles"] remoteExecCall ["RRPClient_system_c834y9wq",remoteExecutedOwner];
};


//Error checks
if (_uid isEqualTo "" || {isNull _vehicle}) exitWith {};
if (!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch (true) do {
    case (_vehicle isKindOf "Car"): {"Car"};
    case (_vehicle isKindOf "Air"): {"Air"};
    case (_vehicle isKindOf "Ship"): {"Ship"};
};

if (_color isEqualTo "") then {_color = "default"};
if (_material isEqualTo "") then {_material = "default"};

[_uid,_type,_classname,_color,_plate,_basePrice,_material,_vehicle,_active] call RRPHC_garage_insertVehicle;
_vehicle setVariable ["dbInfo",[_uid,_plate],true];
RRPClientWaitingBuyCar = false;
(remoteExecutedOwner) publicVariableClient "RRPClientWaitingBuyCar";
