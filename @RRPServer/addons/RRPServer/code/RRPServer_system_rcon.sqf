/*
file: TON_fnc_rcon;
project: Smart Altis Life
description: autoban system via extension urcon
*/

params ["_uid","_time","_reason","_log"];



if (_uid isEqualTo "" || _reason isEqualTo "") exitWith {diag_log "****************************FAILED AUTOBAN TON_fnc_rcon*******************************************"};
_guid = format["selectGUID:%1",_uid] call RRPServer_DB_selectSingleField;
_numberbam = [0,5] call RRPServer_system_getRandomStrings_forID;
_reason = _reason + _numberbam;

diag_log format["*****************************************player 1% banned ||| reason %2*******************************************",_uid,_reason];
