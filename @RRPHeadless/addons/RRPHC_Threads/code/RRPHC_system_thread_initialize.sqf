 
RRPSystemSpawnThread = [];
RRPSystemThreadDelays = [];
RRPSystemMainTimer = time;
RRPSystemThreadSleep = 0.5;
SystemThreadID = 100;
ServerThread = [] spawn 
{
	waitUntil { (time > 0) };
	"Main thread started #1111" call RRPHC_util_debugConsole;
	while {true} do
	{
		if !(RRPSystemSpawnThread isEqualTo []) then
		{
			{
				if (RRPSystemMainTimer > (((_x select 1) + (_x select 0)) - RRPSystemThreadSleep)) then
				{
					(_x select 3) call (_x select 2);
					_x set [1, time];
					if !(_x select 5) then
					{
						[_x select 4] call RRPHC_system_thread_removeTask;
					};
				};
			} 
			forEach RRPSystemSpawnThread;
		};
		RRPSystemMainTimer = time;
		uiSleep RRPSystemThreadSleep;
	};
};
