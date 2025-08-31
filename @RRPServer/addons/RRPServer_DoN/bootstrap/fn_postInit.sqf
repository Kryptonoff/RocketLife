
{
	[_x] remoteExecCall ["RRPClient_don_add",-2,format["don_init:%1",netId _x]];
} forEach (allMissionObjects "Land_BriefingRoomDesk_01_F");

true