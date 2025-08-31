"garbageCollector" call RRPServer_DB_fireAndForget;
"deleteOldGoods" call RRPServer_DB_fireAndForget;
"deleteOldDiscounts" call RRPServer_DB_fireAndForget;
"policeSalary" call RRPServer_DB_fireAndForget;

// private _vehicles = ("getNumber(_x >> 'ignoreSlots') isEqualTo 1" configClasses (missionConfigFile >> "LifeCfgVehicles")) apply {configName _x};
// if ((["clear_old_veh",_vehicles] call RRPServer_DB_grc) isNotEqualTo "nice") then {
// 	format ["ERROR: GRC: CLEAR OLD VEH! LOOK GRC LOGS! #1001"] call RRPServer_util_debugConsole;
// };
