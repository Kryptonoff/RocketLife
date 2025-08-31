scriptName "fn_init";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_init.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_init.sqf"

diag_log "Maverick ARA Metrics: Initialized";

"MaverickMetrics" callExtension "START";

execFSM '\ara_metrics_core\bin\monitor.fsm';