/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

/*
{
	_x params [
		"_id",
		"_name",
		"_group",
		"_color",
		"_center",
		"_radius",
		"_flag",
		"_borders",
		"_polys",
		"_phase",
		"_tax",
		"_recolte",
		"_type"
	];

	_data = ["insertGroupTerritories",[
		_name,_color,_center,_radius,_borders,_polys,_phase,_tax,_type
	]] call RRPServer_DB_createMessage;
	_data call RRPServer_DB_fireAndForget;
}forEach (profileNameSpace getVariable ["territorySystem_zones", []]);
 */

[] spawn {	
	waitUntil {!isNil "RRPClient_waypoints_initWaypointMenu"};
	call RRPClient_init_preInit;
};
true
