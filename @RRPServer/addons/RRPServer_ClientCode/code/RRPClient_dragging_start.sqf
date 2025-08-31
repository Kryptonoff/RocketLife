/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

params ["_unit", "_object"];

if (isNil {_object getVariable "owner"}) exitWith {};
if ((_object getVariable "owner") != getPlayerUID player) exitWith {
	["SuccessTitleOnly",["Перемещать можно только свои объекты!"]] call toast;
};
	
inGameUISetEventHandler ["PrevAction", "true"];
inGameUISetEventHandler ["NextAction", "true"];
inGameUISetEventHandler ["Action", "true"];

life_dragging_zHandler = (findDisplay 46) displayAddEventHandler ["MouseZChanged","_this call RRPClient_dragging_handlemouzez;"];
life_dragging_mbtnHandler = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call RRPClient_dragging_handemouzebtn"];
life_dragging_btnHandlerup = (findDisplay 46) displayAddEventHandler ["KeyUp","[1, _this] call RRPClient_dragging_handlekey"];
life_dragging_btnHandlerdown = (findDisplay 46) displayAddEventHandler ["KeyDown","[0, _this] call RRPClient_dragging_handlekey"];

_object setVariable ["isDragging", true, true];
_object setVariable ["height", 0.5];
_object setVariable ["mass", (getMass _object)];
_object setMass 0.01;
{ 
    _object disableCollisionWith _x;
    _x disableCollisionWith _object;
} forEach (nearestObjects [player, [], 35]);

_unit setVariable ["dragObject", _object];
_unit setVariable ["isDragging", true];

["truog_dragging", "onEachFrame", {
	_object = player getVariable ["dragObject", objNull];
	_height = _object getVariable ["height", 0];
	_pos = player modelToWorld [0, 2, 0];
	_pos set [2, (_pos select 2) + _height];
	_object setPos _pos;
	_object setVectorUp[0, 0, 1];
}] call BIS_fnc_addStackedEventHandler;

["<t size='1'>Нажмите <t color='#ff0000'>ЛКМ</t> для размещения объекта.<br/><t color='#ff0000'>[LCTRL] + Колесико мышки</t> для изменения высоты.<br/><t color='#ff0000'>Колесико мышки</t> для вращения объекта</t>", 
	"info","long" ]call hints;