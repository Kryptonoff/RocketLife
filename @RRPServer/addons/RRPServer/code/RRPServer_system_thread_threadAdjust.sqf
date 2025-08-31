if (RRPSystemThreadDelays isEqualTo []) then
{
	RRPSystemThreadDelays = [5];
};
RRPSystemThreadDelays = RRPSystemThreadDelays call BIS_fnc_sortNum;
RRPSystemThreadSleep = (((RRPSystemThreadDelays select 0) max 0.01) min 5);
true