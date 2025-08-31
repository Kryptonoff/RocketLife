/*
	Filename: 	RRPClient_system_upprone.sqf
	Project: 	Rimas Altis Life RPG
*/
private _unit = param [0, objNull, [objNull]];
if (isNull _unit OR !(isPlayer _unit)) exitWith {};
if !(_unit getVariable ["restrained",false]) exitWith {};

if (_unit getVariable ["restrained_prone",false]) then {
	[_unit,"restrained_prone",false] call CBA_fnc_setVarNet;
} else {
	[_unit,"restrained_prone",true] call CBA_fnc_setVarNet;
};