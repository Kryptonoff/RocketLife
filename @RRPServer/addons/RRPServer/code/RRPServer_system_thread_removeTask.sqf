
private["_threadID", "_result", "_threadIndex"];
_threadID = _this select 0;
_result = false;
_threadIndex = [RRPSystemSpawnThread, _threadID] call RRPClient_util_find;
if (_threadIndex != -1) then
{	
	RRPSystemThreadDelays deleteAt (RRPSystemThreadDelays find ((RRPSystemSpawnThread select _threadIndex) select 0));
	call RRPServer_system_thread_threadAdjust;
	RRPSystemSpawnThread deleteAt _threadIndex;
	_result = true;
};
_result