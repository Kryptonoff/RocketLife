diag_log 'RRP Client Main Thread';

RRPSystemSpawnThread = [];
RRPSystemThreadDelays = [];
RRPSystemMainTimer = time;
RRPSystemThreadSleep = 0.05;
RRPSystemThreadID = 100;
[] spawn 
{
	waitUntil {!isNil "life_loading_completed"};
	"Main thread started" call RRPClient_system_log;
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
						[_x select 4] call RRPClient_system_thread_removeTask;
					};
				};
			} 
			forEach RRPSystemSpawnThread;
		};
		RRPSystemMainTimer = time;
		uiSleep RRPSystemThreadSleep;
	};
};
