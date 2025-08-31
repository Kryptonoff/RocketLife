/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_vehicle","_velocityOfVehicle","_fuelConsumption","_newFuel","_lpg","_vehicleInfo","_fueltank"];
_vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

_vehicle = param [0,objNull,[objNull]];
_vehicleInfo = [(typeOf _vehicle)] call RRPClient_util_fetchVehInfo;
_fueltank = (_vehicleInfo select 12); 

while {true} do 
{
	if (isNull _vehicle) exitWith {};
	if !(
			(vehicle player isEqualTo _vehicle) && {currentPilot  _vehicle isEqualTo player} && {alive _vehicle}) exitWith {};
	if (isEngineOn _vehicle) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicle select 0)^2)+((velocity _vehicle select 1)^2))*3.6;
		// systemChat str _velocityOfVehicle;
		_fuelConsumption = if (_vehicle getVariable ["adacLPG",false]) then {((_velocityOfVehicle/750000 + 0.0002) * 0.5)}else{_velocityOfVehicle/750000 + 0.0002};
		if(_velocityOfVehicle isEqualTo 0) then {
			_fuelConsumption = 0.0002;
		};
		if (["EcoDriver"] call perk) then {_fuelConsumption = _fuelConsumption * 0.85};

		_newFuel = (fuel _vehicle)-_fuelConsumption;
		//systemChat format["DEBUG: Расход: %1L/S; %2L/M; %3L/H;",parseNumber ((_fuelConsumption*_fueltank) toFixed 2),parseNumber (((_fuelConsumption*_fueltank) * 60) toFixed 2),parseNumber ((((_fuelConsumption*_fueltank) * 60) * 60) toFixed 2)];

		if (local (_vehicle)) then {
			_vehicle setFuel _newFuel;
		};
	};
	uiSleep 1;
};