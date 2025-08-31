/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_veh","_dbInfo"];
_veh = param [0,objNull,[objNull]];
_why = param [1,"",[""]];
_dbInfo = _veh getVariable ["RRPDatabaseID",-1];
if (!alive _veh) then 
{
	if !(_dbInfo isEqualTo -1) then 
	{
		if (_veh getVariable ["isInsured",false]) then 
		{
			format ["markInsureVehicleDelete:%1:%2",[_why] call RRPClient_util_stripChars,_dbInfo] call RRPServer_DB_fireAndForget;
		} else {
			format ["markDeleteVehicle:%1:%2",[_why] call RRPClient_util_stripChars,_dbInfo] call RRPServer_DB_fireAndForget;
		};
	};	
};