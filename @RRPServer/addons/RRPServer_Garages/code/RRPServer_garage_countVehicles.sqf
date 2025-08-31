
_ret = [_this];
{
    _ret pushBack (configName _x);
} forEach ("getNumber(_x >> 'ignoreSlots') isEqualTo 1" configClasses (missionConfigFile >> "LifeCfgVehicles"));
_res = ["count_vehicles",_ret] call RRPServer_DB_grc;
parseNumber _res
