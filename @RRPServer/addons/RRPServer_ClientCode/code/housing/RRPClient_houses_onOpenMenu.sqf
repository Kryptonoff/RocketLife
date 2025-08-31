/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/


if (life_netID_Houses isEqualTo []) exitWith {
	["У вас нет недвижимости", "Понял"] call RRPClient_tablet_showWarning;
};
["house",1] call RRPClient_tablet_slide;
