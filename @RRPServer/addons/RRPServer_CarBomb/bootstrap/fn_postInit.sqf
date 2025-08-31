/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private _time = systemTime;
_time params ["_year","_month","_day","_hour"];
if ((_year isEqualTo 2023) and (_month isEqualTo 3) and (_day in [24,25]) and (_hour > 19)) then 
{
    call RRPServer_CarBomb_SpawnVehicles;
};
true
