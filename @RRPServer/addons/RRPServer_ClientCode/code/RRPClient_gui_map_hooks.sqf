

waituntil { !(IsNull findDisplay 12)};
["init",[]] spawn RRPClient_finder_main;
call RRPClient_waypoints_initWaypointMenu;
call RRPClient_settings_colors;
call RRPClient_markerfeed_init;
(findDisplay 12) displayAddEventHandler ["KeyDown","_this call SmartClient_gui_map_event_onKeyDown"];
