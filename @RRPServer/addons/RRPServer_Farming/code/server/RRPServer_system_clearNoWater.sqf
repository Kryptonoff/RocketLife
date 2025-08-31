/*
	Project: Aurora Role Play
	Filename: RRPServer_system_clearNoWater.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
params [
	["_plant",objNull,[objNull]]
];

[{
	if (isNull _this) exitWith {};

	private _state = _this getVariable ["growState",[]];
	if (_state isEqualTo []) exitWith {};

	_state params ["_curState","_totalState","_curGrowKoef","_growUp","_isWatered","_isFertilized"];
	if (_isWatered <= 0.15) then {
		diag_log "RRPServer_farming_plantPlantae delete plant no water";
		deleteVehicle _this;
	};
}, _plant, 300] call CBA_fnc_waitAndExecute;