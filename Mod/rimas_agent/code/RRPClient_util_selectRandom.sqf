/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	
	Usage:  
	[
		["More",50],
		["Medium",30],
		["Rare",20]
	]
	#0 = STRING - return
	#1 = SCALAR - chance
*/

private _arr = param [0,[],[[]]];
private _sel = "";
while {_sel isEqualTo ""} do 
{
	_rand = selectRandom _arr;
	_chance = _rand select 1;
	
	if (random(99) < _chance) exitWith 
	{
		_sel = _rand select 0;
	};
};
_sel