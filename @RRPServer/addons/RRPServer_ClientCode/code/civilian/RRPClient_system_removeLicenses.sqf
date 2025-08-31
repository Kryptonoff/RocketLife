/*
    Author(s):
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
*/
private _state = param[0, -1, [0]];
if (_state isEqualTo - 1) exitWith {};

switch (_state) do {
    case 0:
        {
            if (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_removeLicByJail") == 1) then {
                {
                    missionNamespace setVariable[format["license_%1", getText(missionConfigFile >> "LifeCfgLicenses" >> _x >> "variable")], false];
                }
                forEach(getArray(missionConfigFile >> "LifeCfgSettings" >> "life_removeLicByJailList"));
            };
        };


    case 1:
        {
            if (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_removeLicByVeh") == 1) then {
                {
                    missionNamespace setVariable[format["license_%1", getText(missionConfigFile >> "LifeCfgLicenses" >> _x >> "variable")], false];
                }
                forEach(getArray(missionConfigFile >> "LifeCfgSettings" >> "life_removeLicByVehList"));
            };
        };
};
