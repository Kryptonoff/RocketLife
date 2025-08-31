
params [
	["_achs",[],[[]]],
	["_uid","",[""]]
];

try 
{
	if (_ach isEqualTo []) throw "Пустой массив";
	if (_uid isEqualTo "") throw "Пустой UID";
	format ["achievementsSave:%1:%2",_achs,_uid] call RRPServer_DB_fireAndForget;
}catch{
	format ["SaveAch: Error: %1",_exception] call RRPServer_util_log;
	format ["SaveAch: Error: %1 #1001",_exception] call RRPServer_util_log;
};
true
