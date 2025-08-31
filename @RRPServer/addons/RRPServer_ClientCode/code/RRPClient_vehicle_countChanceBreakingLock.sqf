/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {["object is null!"] call hints};

private ["_price","_chance","_cfg","_lvl"];
_price = getNumber(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _vehicle) >> "price");
_chance = getNumber(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _vehicle) >> "breakingChance");
if (_chance > -1) then {

    if (isNumber(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _vehicle) >> "breakingChance")) exitWith
    {
      _cfg = missionConfigFile >> "vehiclesMoreSetting" >> "breakingLock" >> format["breakLVL_%1",_chance];
      _lvl = _chance;
    };

    {
      if (getNumber(_x >> "limit") >= _price) exitWith {_cfg = _x; _lvl = _forEachIndex + 1;};
    } forEach ('true' configClasses (missionConfigFile >> 'vehiclesMoreSetting' >> 'breakingLock'));
};

[(getNumber(_cfg >> "chance")),(getNumber(_cfg >> "time")),_lvl]
