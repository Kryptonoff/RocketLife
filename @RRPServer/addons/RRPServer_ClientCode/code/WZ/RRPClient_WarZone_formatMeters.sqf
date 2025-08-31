/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _meters = param [0,-1,[0]];
if (_meters isEqualTo -1) exitWith {};
_meters = round _meters;
if (_meters < 1000) exitWith {(str (_meters)) + " м"};
private _result = (_meters - (_meters mod 1000)) / 1000;
private _fraction = _meters mod 1000;
private _fraction = round (_fraction / 100);
if (_fraction isEqualTo 0) exitWith { (str _result) + " км" };
(str _result) + "," + (str _fraction) + " км";