
params [
	["_type", "", [""]],
	["_value", 0, [0]]	
];

switch _type do {
	case "plusVirtSlots": {
		life_maxWeightT = life_maxWeightT + _value;
	};
};
