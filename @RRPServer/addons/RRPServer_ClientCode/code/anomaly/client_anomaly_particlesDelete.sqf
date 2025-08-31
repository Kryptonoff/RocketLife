/*

	Filename: 	client_anomaly_particlesDelete.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
params ["_trig"];
_source = _trig getVariable ["anomaly_particle_source",[]];
if !(_source isEqualTo []) then {
	{
		deleteVehicle _x;
	} forEach _source;
	_trig setVariable ["anomaly_particle_source",[]];
};
