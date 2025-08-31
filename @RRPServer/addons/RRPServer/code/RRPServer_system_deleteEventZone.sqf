/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
*/

if (isNil "ClientEventInfo") exitWith {};

deleteMarker (ClientEventInfo # 0);
deleteMarker (ClientEventInfo # 1);

ClientEventInfo = nil;
publicVariable "ClientEventInfo";
["finish"] remoteExec ["RRPClient_events_effetcEventZone",-2];