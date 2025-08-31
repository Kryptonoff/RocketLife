params ["_time","_reason"];
[getPlayerUID player, _time, _reason] remoteExecCall ["RRPServer_DB_addBan",2];
