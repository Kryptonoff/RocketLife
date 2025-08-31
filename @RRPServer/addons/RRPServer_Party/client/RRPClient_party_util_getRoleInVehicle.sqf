/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_unit"];
private _parentUnit = objectParent _unit;
private _return = switch (true) do {
	case (isNull _parentUnit): {
		if (stance _unit == "CROUCH") exitWith {0};
		if (stance _unit == "PRONE") exitWith {1};
		if (stance _unit == "STAND") exitWith {2};
		2
	};
	case !(isNull _parentUnit): {
		if ((driver _parentUnit) isEqualTo _unit) exitWith {4};
		if ((gunner _parentUnit) isEqualTo _unit) exitWith {5};
		if ((commander _parentUnit) isEqualTo _unit) exitWith {6};
		3
	};
};
_return