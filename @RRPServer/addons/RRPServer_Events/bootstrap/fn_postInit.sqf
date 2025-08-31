/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private _time = systemTime;
call RRPServer_events_init;

_time params ["_year","_month","_day","_hour"];
if ((_year isEqualTo 2023) and (_month isEqualTo 4) and (_day in [20]) and (_hour > 18)) then 
{
    call RRPServer_ambient_4x4_24;
};

true
