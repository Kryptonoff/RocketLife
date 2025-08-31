/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_positionX", "_positionY"];
_positionX = _this select 0;
_positionY = _this select 1;
if (_positionX > ((RRPDisplayCurrentLimits select 0) select 1)) exitWith {false};
if (_positionX < ((RRPDisplayCurrentLimits select 0) select 0)) exitWith {false};
if (_positionY > ((RRPDisplayCurrentLimits select 1) select 1)) exitWith {false};
if (_positionY < ((RRPDisplayCurrentLimits select 1) select 0)) exitWith {false};
true