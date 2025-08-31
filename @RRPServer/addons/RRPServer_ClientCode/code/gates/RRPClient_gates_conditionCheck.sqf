/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
private _condition = getText(missionConfigFile >> "cfg_gates" >> (vehicleVarName curTarget) >> "conditionForOpen");
_condition = if (_condition isEqualto "") then {false} else {call(compile _condition)};
_condition