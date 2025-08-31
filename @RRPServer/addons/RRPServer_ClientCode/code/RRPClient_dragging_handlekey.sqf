/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

params ["_action", "_keys"];

if ((_keys select 1) != 29 && {!life_dragKeyDown}) exitWith {};

switch _action do {
	case 0: {life_dragKeyDown = true;};
	case 1: {life_dragKeyDown = false;};
};
