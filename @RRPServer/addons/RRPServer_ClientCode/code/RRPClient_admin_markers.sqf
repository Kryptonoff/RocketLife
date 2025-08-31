/*
    Filename:   RRPClient_admin_Markers.sqf
    Project:    Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if (EQUAL((FETCH_CONST(life_adminlevel)),0)) exitWith {closeDialog 0;};
life_markers = !life_markers;
if (life_markers) then {
	PlayerMarkers = [];
	FinishedLoop = false;
	["Метки игроков включены!"] call hints;
	while {life_markers} do {
		{
			if !(_x in allUnits) then {
				deleteMarkerLocal str _x;
			};
		} forEach PlayerMarkers;
		PlayerMarkers = [];
		{
			if(alive _x && isplayer _x) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				_pSee setMarkerTextLocal format['%1',GVAR_RNAME(_x)];
				_pSee setMarkerColorLocal ("ColorRed");
				PlayerMarkers = PlayerMarkers + [_x];
			};
		} forEach allUnits;
	uiSleep 1;
	};
	FinishedLoop = true;
} else {
	if (isNil "FinishedLoop") exitWith {};
	["Метки игроков отключены"] call hints;
	waitUntil{uiSleep 0.03; FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach PlayerMarkers;
};