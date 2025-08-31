/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/

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
	format ["ADD MONEY TO SERVER BANK %1 - BALANCE %2 #1111",_tmptax, server_bank ,server_bank + _tmptax] call RRPHC_util_debugConsole;
	server_bank = server_bank + _tmptax;
	publicVariable "server_bank";
	format ["serverBank:%1",server_bank] call RRPHC_DB_fireAndForget;			
};
