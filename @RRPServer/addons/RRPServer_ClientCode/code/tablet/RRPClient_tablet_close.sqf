[player, true] call RRPClient_tablet_object;
false call RRPClient_gui_util_blur;
[RRPClientTabletThreadUpdateTime] call RRPClient_system_thread_removeTask;
[RRPClientTabletThreadEconomyTimer] call RRPClient_system_thread_removeTask;

{
	deleteMarkerLocal format['loc_%1',_forEachIndex]
} forEach life_cs_locsCache;
for '_i' from 0 to 9 do {
	deleteMarkerLocal format['%1_cs',_i]
};
if !(getMarkerSize 'loc_1' isEqualTo [0,0]) then {

	deleteMarkerLocal format['%1_marker',player]; 
};