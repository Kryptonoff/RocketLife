/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

if (!isNull cursorObject) exitWith {};
private _object = cursorObject;
[player,_object] spawn RRPClient_dragging_start;