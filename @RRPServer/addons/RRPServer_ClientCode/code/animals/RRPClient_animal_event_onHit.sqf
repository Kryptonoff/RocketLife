/*
	Project: Rimas Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private["_animal", "_attacker"];
_animal = _this select 0;
_attacker = _this select 1;
_animal setVariable ["IsScared", true];
_animal setVariable ["ScaredAt", time];
_animal setVariable ["Aggressor", _attacker];
