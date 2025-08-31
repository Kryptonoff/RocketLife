/*
	Project: Aurora Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private["_animal", "_animalConfig", "_gutItems"];
_animal = _this select 0;
_animalConfig = configFile >> "CfgVehicles" >> typeOf _animal >> "RRP";
_gutItems = getArray (_animalConfig >> "gutItems");
if !(_gutItems isEqualTo []) then 
{
	_animal setVariable ["WasGutted", false];
	_animal setVariable ["CanBeGutted", true, true];
};
_animal setVariable ["DiedAt", time];
