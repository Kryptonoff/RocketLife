
if (RRPClientLTDsData isEqualTo []) exitWith {false};
RRPClientLTDsData params ["_id"];
(((missionNamespace getVariable [format["ltdData_%1",_id],[]]) # 0) isEqualTo (getPlayerUID player))