/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_centerX", "_centerY", "_centerZ", "_radius", "_randomDirection", "_randomRadius", "_offsetX", "_offsetY"];
_centerX = (_this select 0) select 0;
_centerY = (_this select 0) select 1;
_centerZ = (_this select 0) select 2;
_radius = _this select 1;
_randomDirection = random 360;
_randomRadius = random _radius;
_offsetX = _randomRadius * (cos _randomDirection);
_offsetY = _randomRadius * (sin _randomDirection);
[_centerX + _offsetX, _centerY + _offsetY, _centerZ]