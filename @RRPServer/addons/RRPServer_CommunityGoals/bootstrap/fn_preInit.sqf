[
	"RRPClient_tablet_app_communityGoals_load", 
	"RRPClient_tablet_app_communityGoals_onOpen" 
]apply
{
	missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_CommunityGoals\client\%1.sqf",_x],true];
};

[
	"RRPServer_cg_load", 
	"RRPServer_cg_refresh", 
	"RRPServer_cg_updateParticipation" 
]apply
{
	missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_CommunityGoals\server\%1.sqf",_x]];
};
