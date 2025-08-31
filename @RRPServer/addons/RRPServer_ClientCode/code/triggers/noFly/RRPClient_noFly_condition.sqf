params [
	["_condition", false, [false]],
	["_objects", [], [[]]],
	["_trigger", objNull, [objNull]]
];

_condition &&
	{alive player} &&
	{(vehicle player) in _objects} &&
	{local (vehicle player)} &&
	{(player call getSide) in ["civ","reb"]} &&
	{(vehicle player) isKindOf "Air"}