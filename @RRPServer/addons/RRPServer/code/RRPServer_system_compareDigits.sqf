/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
params ["_timeunit","_compared"];
private _condition = switch (true) do {
	case ((_compared isEqualType [] and {_timeunit isEqualType ""}) and {_timeunit in _compared or {"EVERYDAY" in _compared}}): {true};
	case (_compared isEqualTo []): {true};
	case (_compared isEqualType 0): {_timeunit isEqualTo _compared};
	case ((_compared isEqualType []) AND (_compared isEqualTypeAll 0)): 
	{(_timeunit % (_compared select 0)) isEqualTo 0};
	default {false};
};
_condition