/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_enableSnow", "_surfaceTypes"];
_enableSnow = false;
if (rain < 0.01) then 
{
	_enableSnow = true;
	SnowClose attachTo [vehicle player, [0, 4, 1]];
	SnowNear attachTo [vehicle player, [0, 4, 1.5]];
	SnowFar attachTo [vehicle player, [0, 4, 2]];
};
if (_enableSnow) then 
{
	SnowClose attachTo [vehicle player, [0, 4, 1]];
	SnowNear attachTo [vehicle player, [0, 4, 1.5]];
	SnowFar attachTo [vehicle player, [0, 4, 2]];
	_interval = player getVariable ["snow_interval",0.4];
	SnowClose setDropInterval _interval;
	SnowNear setDropInterval _interval;
	SnowFar setDropInterval _interval;
}
else 
{
	SnowClose setDropInterval 0;
	SnowNear setDropInterval 0;
	SnowFar setDropInterval 0;
};
