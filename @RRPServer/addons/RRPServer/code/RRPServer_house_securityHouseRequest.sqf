params ["_netID","_mode"];
_house = objectFromNetId _netID;
try
{
	_id = _house getVariable ["house_id",-1];
	switch (_mode) do
	{
		case 0: 
		{
			format ["updateSecurityHouse:%1:%2",1,_id] call RRPServer_DB_fireAndForget;
			_house setVariable ["security",true,true];
		};
		case 1: 
		{
			format ["updateSecurityHouse:%1:%2",0,_id] call RRPServer_DB_fireAndForget;
			_house setVariable ["security",false,true];
		};
		default {};
	};
}catch{
	_exception call RRPServer_util_log;
};