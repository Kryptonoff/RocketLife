/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

{
    if (!isNull _x) then {
        deleteVehicle _x;
		life_bar_placey deleteAt _forEachIndex;
    };
} forEach (life_bar_placey);