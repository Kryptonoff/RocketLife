/*

	Filename: 	RRPClient_system_skyDive.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_cops","_price","_dropPos","_draw","_newDistance"];

if (backpack player != "") exitWith { ["Перед прыжком уберите свой текущий рюкзак, иначе все вещи в нем и сам рюкзак будут выброшены"] call hints };

_cops = false;
{
	if (_x call getSide == "cop" && {player distance _x < 1000}) then { _cops = true; };
} forEach playableUnits;
if (_cops) exitWith {["Вы не можете заниматься скайдайвингом будучи в розыске и с полицейскими в радиусе 1 км"] call hints};

_price = 200;
if (CASH < _price) exitWith { [format ["У вас нет необходимой суммы ($%1)",[_price] call RRPClient_util_numberText]] call hints };
[[player,"cash","take",_price],"system_moneyChange"] call RRPClient_system_hcExec;
_log = format ["skyDive: cash (take) %3 to NAME:%1 (%2)",name player,steamid,_price];	
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

cutText ["", "BLACK OUT", 3];
uiSleep 3;
player setPos (getMarkerPos "sky_dive");

cutText["Вы в зоне выброса.  Будьте готовы!","BLACK FADED"];
0 cutFadeOut 999999;
0 fadeSound 0;
2 fadeSound 1;
for "_i" from 0 to 5 do
{
	playSound "airplane";
	uiSleep 2.2;
	switch (_i) do
	{
		case 3: { playSound "racebeep1"; };
		case 4: { playSound "racebeep1"; };
		case 5: { playSound "racebeep2"; };
	};
};

// Weee!
player addBackpack "B_Parachute";
_dropPos = position player;
_dropPos set [2, 5000]; // Set drop altitude
player setPosASL _dropPos;
_draw = viewDistance;
setViewDistance 6000;
if (cameraView == "EXTERNAL") then { player switchCamera "INTERNAL"; };
cutText ["", "BLACK IN", 1];

while {(getPos player) select 2 > 100} do
{
	uiSleep 1;
	_newDistance = (((getPos player) select 2) + 1000);
	if (_newDistance > _draw) then { setViewDistance _newDistance; };
};

waitUntil {uiSleep 0.03; (getPos player) select 2 < 10 };

setViewDistance _draw;