/*

	Filename: 	RRPClient_effects_WarZones.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _inZone = false;
while {true} do {
	if (EQUAL(RRPServerWarZones,[])) exitWith {};
	_inZone = false;
	{
		_marker = format["war_zone_%1",_x select 0];
		if (player distance2D (getMarkerPos _marker) < (_x select 1)) exitWith {_inZone = true};
	} forEach RRPServerWarZones;

	if (_inZone) then {
		life_inwarzone = true;
		if !(cameraView in ["INTERNAL","GUNNER"])  then {
			player switchCamera "INTERNAL";		
		};
	} else {
		life_inwarzone = false;
	};

	uiSleep 1;
};		

life_inwarzone = false;