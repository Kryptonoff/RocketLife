 
private["_delay", "_function", "_params", "_persistance", "_pushBackThreadID", "_threadId"];
_delay = _this select 0;
_function = _this select 1;
_params =  _this select 2;
_persistance = _this select 3;
_pushBackThreadID = param [4, false];
_threadId = SystemThreadID;
if(_pushBackThreadID)then
{
	_params pushBack _threadId;
};
RRPSystemSpawnThread pushBack [_delay, time, _function,_params, _threadId, _persistance];
RRPSystemThreadDelays pushBack _delay;
call RRPHC_system_thread_threadAdjust;
RRPSystemSpawnThread = [RRPSystemSpawnThread, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
format ["Job with handle %1 added. #1111", _threadId] call RRPHC_util_debugConsole;
SystemThreadID = SystemThreadID + 1;
_threadId