
params [
	"_uid",
	"_type",
	"_log"
];

format ["log:%1:%2:%3",_uid,_type,_log] call RRPHC_DB_fireAndForget;

true