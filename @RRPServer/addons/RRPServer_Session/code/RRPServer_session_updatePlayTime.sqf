
private _uid = param [0,""];
format ["updatePlayerTime:%1",_uid] call RRPServer_DB_fireAndForget;