/*

	Filename: 	RRPClient_inventory_inControl.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params ["_x", "_y", "_h", "_w"];
(getMousePosition) params ["_mouseX", "_mouseY"];

(
	(_mouseX >= _x AND _mouseX <= (_x + _h)) 
	AND 
	(_mouseY >= _y AND _mouseY <= (_y + _w))
)