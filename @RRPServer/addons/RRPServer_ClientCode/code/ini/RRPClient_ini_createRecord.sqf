/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

INIDBI_DATA = ["new","data"] call RRPClient_ini_action; 
_encode = {["encodeBase64",_this] call INIDBI_DATA};
_decode = {["decodeBase64",_this] call INIDBI_DATA};

(["write",[((getPlayerUID player) call _encode),"Name" call _encode,(profileName call _encode)]]) call INIDBI_DATA; 
(["write",[((getPlayerUID player) call _encode),"ID" call _encode,STR(call RRPClientPlayerID) call _encode]]) call INIDBI_DATA; 
(["write",[((getPlayerUID player) call _encode),"SteamName" call _encode,(profileNameSteam call _encode)]]) call INIDBI_DATA;
_returnAllUIDS = "getSections" call INIDBI_DATA;
_toWrite = [];
if !(_returnAllUIDS isEqualTo []) then
{
	{
		_toWrite pushBackUnique (_x call _decode);
	}forEach _returnAllUIDS;
};
format ["setAllUIDS:%1:%2",_toWrite,call RRPClientPlayerID] remoteExecCall ["RRPServer_DB_fireAndForget",2];
