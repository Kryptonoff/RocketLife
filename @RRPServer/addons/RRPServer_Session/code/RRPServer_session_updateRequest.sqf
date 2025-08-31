/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
private ["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_arrest","_alive","_position","_query","_thread","_indicators","_config","_craft","_dcash","_tmptax","_selled","_skilss"];
params
[
	["_uid","",[""]],
	["_side","error",[""]],
	["_tmptax",0,[0]],
	["_selled",[],[[]]]
];

//Get to those error checks.
if (_uid isEqualTo "") exitWith {};

if (_tmptax > 0) then {
	// format ["updateRequest_rules:%1",_tmptax] call RRPServer_DB_fireAndForget;
	format ["ADD MONEY TO SERVER BANK %1 - BALANCE %2 #1111",_tmptax, server_bank ,server_bank + _tmptax] call RRPServer_util_debugConsole;
	server_bank = server_bank + _tmptax;
	publicVariable "server_bank";
	format ["serverBank:%1",server_bank] call RRPServer_DB_fireAndForget;
	[format ["%1 оплатил налогов на сумму %2",_uid,[_tmptax] call RRPClient_util_numberText],"TaxLog"] call RRPServer_system_logIt;				
};
