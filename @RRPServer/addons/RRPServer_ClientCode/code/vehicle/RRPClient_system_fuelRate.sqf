/*
	
	Filename: 	RRPClient_system_fuelRate.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private["_vehicle","_engineState","_fuelConsumption","_velocityOfVehicle","_newFuel"];

_vehicle = param [0,objNull,[objNull]];
_engineState = param [1,false,[true]];

if (isNull _vehicle OR !_engineState) exitWith {};

while{isEngineOn _vehicle} do {
	_velocityOfVehicle = sqrt(((velocity _vehicle select 0)^2)+((velocity _vehicle select 1)^2))*3.6;

	_fuelConsumption = _velocityOfVehicle/500000 + 0.0001;
	if(_fuelConsumption > 0.002) then {
		_fuelConsumption = 0.002;
	};
	_newFuel = (fuel _vehicle)-_fuelConsumption;
	
	if(local (_vehicle)) then {
		_vehicle setFuel _newFuel;
	} else {		
		[_vehicle,_newFuel] remoteExecCall ["RRPClient_system_setFuel",_vehicle];
	};	
    
	if(fuel _vehicle < 0.2 && {fuel _vehicle > 0.18}) then {
		["У вас заканчивается бензин. Заправьтесь","info"] call hints;
	} else {
		if(fuel _vehicle < 0.03) then {
			["У вас закончился бензин. Дальше пешком.","error"] call hints;
		};
	};
	uiSleep 1;
};