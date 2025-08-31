/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ['_alias', ['_mode', 0]];
private _array = (findDisplay 46) getVariable ['achConfig', []];
if (_array isEqualTo[]) then 
{
	{
		_array pushBack[
			configName _x,
			getText(_x >> "displayName"), 
			getText(_x >> "needDo"), 
			getNumber(_x >> "milestone"), 
			getNumber(_x >> "milestoneFraction"), 
			getText(_x >> "reward"), 
			getText(_x >> "rewardText")
		];
	}forEach('true' configClasses(missionConfigFile >> "CfgAchievments"));
	(findDisplay 46) setVariable['achConfig', _array];
};
if (_mode isEqualTo 1) exitWith {_array};
private _index = _array findIf {_x#0 isEqualTo _alias};
if (_index isEqualTo -1) exitWith {false};
_array select _index
