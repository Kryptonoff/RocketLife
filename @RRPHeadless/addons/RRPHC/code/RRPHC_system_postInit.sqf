"---------------------------------------------------------------------------------------------------- #1111" call RRPHC_util_debugConsole;
format ["                 Start of Altis Life HC Post Init :: #1111"]  call RRPHC_util_debugConsole;
"---------------------------------------------------------------------------------------------------- #1111" call RRPHC_util_debugConsole;

[player] remoteExecCall ["RRPServer_headless_enableMe",2];

[1, {
		format ["MyHC_FPS: %1 #1111",diag_fps] call RRPHC_util_debugConsole
}, [], true] call RRPHC_system_thread_addTask;
