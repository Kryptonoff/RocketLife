

if (count RRPClientCache == 0) exitWith {};
private "_item";
{
	_item = RRPClientCache getOrDefault [_x, ["empty",0,0]]; 
	_item params ["_data",["_ttl",0],"_time"];
	if ((diag_tickTime - _ttl) > _time) then {
		_x call RRPClient_cache_delete;
	};
} forEach RRPClientCache;
true
