/*
	Usage:
		-key STRING: Required
		-value any: Required
		-ttl INTEGER: Optional, default 30 sec
		-time FLOAT: Optional, default diag_tickTime
*/

params [
	"_key",
	"_data",
	["_ttl", 30],
	["_time", diag_tickTime]
];

RRPClientCache set [_key, [_data, _ttl, _time]];
