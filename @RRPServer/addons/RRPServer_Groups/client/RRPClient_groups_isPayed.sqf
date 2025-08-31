
if (isServer) then {
	(missionNamespace getVariable [format["ServerGroupsInfo_%1",_this],createHashMap]) getOrDefault ["payed",false]
}else{
	RRPClientGroupInfo getOrDefault ["payed",false]
};