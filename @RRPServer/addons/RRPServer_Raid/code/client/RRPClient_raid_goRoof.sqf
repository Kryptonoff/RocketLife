/*

	Filename: 	RRPClient_raid_goRoof.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
params [
	["_object", objNull, [objNull]]
];

private _question = [
	"Вы хотите вылезти на крышу? Учитывайте, что лестница выдержит только один проход, так что только один человек сможет там оказаться и обратно он уже не вернется.",
	"Крыша лаборатории",
	"Да",
	"Нет"
] call BIS_fnc_guiMessage;

if !(_question) exitWith {"Вы отказались" call toastInfo};
if (lab_building getVariable ["goRoofUsed", false]) exitWith {"Лестница сломалась" call toastError};

player setPosATL (lab_building modelToWorld [-1.12695,-3.2251,4.95498]);
remoteExecCall ["", -2, netId _object];
[_object] remoteExecCall ["removeAllActions", -2];
lab_building setVariable ["goRoofUsed", true, true];