/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

inGameUISetEventHandler ["PrevAction", ""];
inGameUISetEventHandler ["NextAction", ""];
inGameUISetEventHandler ["Action", ""];

(findDisplay 46) displayRemoveEventHandler ["MouseZChanged", life_dragging_zHandler];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", life_dragging_mbtnHandler];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", life_dragging_btnHandlerup];
(findDisplay 46) displayRemoveEventHandler ["KeyDown", life_dragging_btnHandlerdown];

["truog_dragging", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

_object = player getVariable ["dragObject", objNull];
_object setVariable ["isDragging", false, true];
player setVariable ["dragObject", objNull];
player setVariable ["isDragging", false];
_object setMass (_object getVariable ["mass", 0.01]);
_object enableSimulationGlobal true;
life_barrier_active = false;
life_barrier_activeObj = ObjNull;

_object spawn {
	uiSleep 3;
	{ 
        _this enableCollisionWith _x;
        _x enableCollisionWith _this;
    } forEach (nearestObjects [player, [], 70]);
};

["SuccessTitleOnly",["Объект размещен!"]] call toast;
