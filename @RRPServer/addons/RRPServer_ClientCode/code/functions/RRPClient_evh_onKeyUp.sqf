/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
private _handled = false;
private _cursorTarget = cursorObject;

 //
if (_code in [67,68,76,83,87,210,199] && {!RRPClientKeyHandle} && {!_shift} && {!_ctrlKey} && {!_alt} && {!((call life_adminlevel) > 0)}) then {
	_handled = true;
	RRPClientKeyHandle = true;
	private _text = call {
		if (_code isEqualTo 68) exitWith {"F10 (Вкл/Выкл мапы)"};
		if (_code isEqualTo 76) exitWith {"NUM_5 Центрирует себя на карте"};
		if (_code isEqualTo 83) exitWith {"NUM_DEL - NVG"};
	    if (_code isEqualTo 210) exitWith {"INSERT - Инжект скриптов"};
	    if (_code isEqualTo 199) exitWith {"HOME - Выключение инфистара"};
		"ЧЕГО ЧЕГО ЧЕГО?"
    };
	[[player,_text,"keybind"],"DB_logItDb"] call RRPClient_system_hcExec;
};

if (call RRPClient_system_isInputBlocked && {!(_code in [15,207])}) exitWith {true};
if (_code in (actionKeys "NextChannel" + actionKeys "PrevChannel")) exitWith {true};
if (_code in (actionKeys "TacticalView" + actionKeys "SelectAll" + actionKeys "forceCommandingMode" + [11,14,59,60,61,62,64,65,66,67,68,36])) exitWith {true};

private _mapKey = (actionKeys "ShowMap") select 0;
private _interruptionKeys = [17,30,31,32];

switch (true) do 
{
	case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code isEqualTo DIK_W)) : {pizza_lockpick_rotate_lock = false};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code isEqualTo DIK_A)) : {pizza_lockpick_rotate_pick = 0};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code isEqualTo DIK_D)) : {pizza_lockpick_rotate_pick = 0};
    case ((!isNull (uiNamespace getVariable ["hud_lockpick", displayNull])) && (_code in (actionKeys "lookAround")) || (_code in (actionKeys "personView"))) : {_handled = false};
};

switch (_code) do
{
	case 0x39:
	{
		if (RRPClientIsPlayingRussianRoulette) then
		{
			if (RRPClientRussianRouletteCanFire) then 
			{
				[] spawn RRPClient_russianRoulette_fire;
			};
		};
	};
	case 0x31:
	{
		if !(isNull RRPClientCameraParentObject)then
		{
			if(RRPClientCameraNVG)then
			{
				"rendertarget0" setPiPEffect [0];
			}
			else
			{
				"rendertarget0" setPiPEffect [1];
			};
			RRPClientCameraNVG = !RRPClientCameraNVG;
			_handled = true;
		};
	};
};
_handled
