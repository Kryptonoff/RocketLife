params [
    ["_profName","",[""]]
];
private ["_dataProf","_maxLVL","_curLevel","_displayName","_ret"];
_dataProf = missionNamespace getVariable (_profName);
_maxLVL = getNumber(missionConfigFile >> "CfgSkills" >> _profName >> "maxLevel");
_displayName = getText(missionConfigFile >> "CfgSkills" >> _profName >> "displayName");
_curLevel = if ((_dataProf # 0) < 1) then {1} else {(_dataProf # 0)};
_ret = [_maxLVL,_curLevel,_displayName];


_ret
