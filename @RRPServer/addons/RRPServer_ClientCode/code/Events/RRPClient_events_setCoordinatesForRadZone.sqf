/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
*/
#include "..\..\script_macros.hpp"
disableSerialization;
_mode = param [0,"",[""]];
if (_mode isEqualto "") exitWith {};

xc_start = if (isNil "xc_start") then {""} else {xc_start};
yc_start = if (isNil "yc_start") then {""} else {yc_start};
xc_finish = if (isNil "xc_finish") then {""} else {xc_finish};
yc_finish = if (isNil "yc_finish") then {""} else {yc_finish};

switch (_mode) do 
{
	case "start":
	{
		setpointcoord_start = {
			
			xc_start = format["%1",round(_this # 0)];
			yc_start = format["%1",round(_this # 1)];
			onMapSingleClick "";
			openMap [false, false];
			call RRPClient_event_radiationDialog;
			waitUntil {!isNull (findDisplay 8800)};
			ctrlSetText [8801, format["%1",xc_start]];
			ctrlSetText [8802, format["%1",yc_start]];
			ctrlSetText [8804, format["%1",xc_finish]];
			ctrlSetText [8805, format["%1",yc_finish]];
			"Точка выбрана" call chat;
		};
	};
		
	case "finish": 
	{
		setpointcoord_finish = {
		
			xc_finish = format["%1",round(_this # 0)];
			yc_finish = format["%1",round(_this # 1)];
			onMapSingleClick "";
			openMap [false, false];
			call RRPClient_event_radiationDialog;
			waitUntil {!isNull (findDisplay 8800)};
			ctrlSetText [8804, format["%1",xc_finish]];
			ctrlSetText [8805, format["%1",yc_finish]];
			ctrlSetText [8801, format["%1",xc_start]];
			ctrlSetText [8802, format["%1",yc_start]];
			"Точка выбрана" call chat;
		};
	};
};

ctrlSetText [8801, format["%1",xc_start]];
ctrlSetText [8802, format["%1",yc_start]];
ctrlSetText [8804, format["%1",xc_finish]];
ctrlSetText [8805, format["%1",yc_finish]];

openMap [true, false];
switch (_mode) do 
{
	case "start": {onMapSingleClick "_pos call setpointcoord_start";};
	case "finish": {onMapSingleClick "_pos call setpointcoord_finish";};
};
["Кликните на карте место, что-бы выбрать координаты"] call hints;
