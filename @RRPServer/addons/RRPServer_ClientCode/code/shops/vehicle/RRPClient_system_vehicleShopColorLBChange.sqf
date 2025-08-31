/*

	Filename: 	RRPClient_system_vehicleShopColorLBChange.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\..\script_macros.hpp"
disableSerialization;
private _data = CONTROL_DATA(2302);
(parseSimpleArray _data) params ["_className"];
[findDisplay 2300,_className,CONTROL_DATA(2304),CONTROL_DATA(2305)] call RRPClient_system_shopBoxUpdate;
