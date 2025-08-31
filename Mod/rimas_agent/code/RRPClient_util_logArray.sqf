/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND

	Usage: 
		1: - Tag - STRING
		2: - Array to log - ARRAY
		3: - Use system chat too - bool

*/
params ["_t","_l",["_s",false]];
{
	format ["%1 - Index %3: %2",_t,_x,_forEachIndex] call RRPClient_system_log;
	if (_s) then
	{
		if (isServer) then 
		{
			format ["%1 - Index %3: %2",_t,_x,_forEachIndex] call RRPServer_util_debugConsole;
		}else{
			format ["%1 - Index %3: %2",_t,_x,_forEachIndex] call chat;
		};
	};
}forEach _l;
true
