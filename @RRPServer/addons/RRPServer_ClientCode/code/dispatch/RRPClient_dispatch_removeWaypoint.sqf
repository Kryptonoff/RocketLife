/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
player removeSimpleTask RRPClient_call_curTask;

ctrlSetText [6953,"a3\3den\data\cfgwrapperui\cursors\3denplacewaypointmulti_ca.paa"];
buttonSetaction [6953,"[] spawn RRPClient_dispatch_addWaypoint;"];
