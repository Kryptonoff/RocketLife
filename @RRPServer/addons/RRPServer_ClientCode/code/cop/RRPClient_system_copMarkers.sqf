/*

	Filename: 	RRPClient_system_copMarkers.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\..\script_macros.hpp"
private _robbers = playableUnits select {(_x getVariable ["realname",""] != "") && (alive _x) && (_x getVariable ["lifeState",""] isEqualTo "HEALTHY") && (_x getVariable ["ATMRobber", false])};
if (_robbers isEqualTo []) exitWith {};
private _markers_robbers = [];

uiSleep 0.5;

if (visibleMap) then {
	if (life_mapFirstTimeOpen) then {
		mapAnimAdd [0, 0.2, player];
		mapAnimCommit;
		life_mapFirstTimeOpen = false;
	};

	{
		_marker = createMarkerLocal [format["%1_marker", _x], visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", "Национальный розыск - обнальщик"];
		_markers_robbers pushBack [_marker, _x];
	} foreach _robbers;
	
	while {visibleMap} do {
		{			
			_marker = _x select 0;
			_unit = _x select 1;
			if (!isNil "_unit") then {
				if (!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers_robbers;
		if (!visibleMap) exitWith {};
		uiSleep 1;
	};
	
	{deleteMarkerLocal (_x select 0)} foreach _markers_robbers;	

	_markers_robbers = [];
	_robbers = [];
};