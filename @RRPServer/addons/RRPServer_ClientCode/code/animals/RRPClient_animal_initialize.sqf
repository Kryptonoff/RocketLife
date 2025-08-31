/*
	Project: Rimas Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

call RRPClient_animal_scheduleRespawn;
[60, RRPClient_animal_thread, [], true] call RRPClient_system_thread_addtask;
