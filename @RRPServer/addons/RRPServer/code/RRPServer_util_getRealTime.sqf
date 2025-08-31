private _time = systemTime;
format ["Aurora Role Play #%6 [%4:%5 %3-%2-%1]",_time select 0 call RRPServer_util_doubleDigits,_time select 1 call RRPServer_util_doubleDigits,_time select 2 call RRPServer_util_doubleDigits,_time select 3 call RRPServer_util_doubleDigits,_time select 4 call RRPServer_util_doubleDigits,hostnumber]
