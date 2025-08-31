class CfgNetwork
{
	class claimItemRequest
	{
		module="rewards";
		payloads[]=
		{
			"STRING",
			"SCALAR",
			"STRING"
		};
	};
	class claimItemResponse
	{
		module="rewards";
		payloads[]=
		{
			"SCALAR",
			"STRING",
			"SCALAR",
			"STRING",
			"ARRAY"
		};
	};
	class claimVehicleRequest
	{
		module="rewards";
		payloads[]=
		{
			"STRING"
		};
	};
	class claimVehicleResponse
	{
		module="rewards";
		payloads[]=
		{
			"SCALAR",
			"ARRAY"
		};
	};
	class claimTabsRequest
	{
		module="rewards";
		payloads[]=
		{
			"STRING",
			"SCALAR"
		};
	};
	class claimTabsResponse
	{
		module="rewards";
		payloads[]=
		{
			"SCALAR",
			"STRING",
			"SCALAR",
			"ARRAY"
		};
	};
	class hasRewardsRequest
	{
		module="rewards";
		payloads[]={};
	};
	class hasRewardsResponse
	{
		module="rewards";
		payloads[]=
		{
			"SCALAR",
			"ARRAY"
		};
	};
	class addRewardsRequest
	{
		module="rewards";
		payloads[]=
		{
			"STRING",
			"ARRAY"
		};
	};
	class addKitRequest
	{
		module="rewards";
		payloads[]=
		{
			"STRING",
			"STRING"
		};
	};

	class claimVipResponse
	{
		module="rewards";
		payloads[]=
		{
			"SCALAR",
			"SCALAR",
			"ARRAY"
		};
	};
	class addVipRequest
	{
		module="rewards";
		payloads[]=
		{
			"SCALAR",
			"SCALAR"
		};
	};
	class bankActions
	{
		module = "atm";
		payloads[]= {"STRING","ARRAY"};
	};
	class addPlayer
	{
		module = "playerSaveQueue";
		payloads[] = {};
		headless = 1;
	};
	class v4fgsbesn45
	{
		module = "function";
		payloads[] = {"ARRAY","ARRAY"};
	};
	class chopAction
	{
		module = "chopShop";
		payloads[] = {"STRING","STRING","SCALAR"};
	};
	//
	class saveLicenses
	{
		module="system";
		payloads[] = {"ARRAY"};
	};
	//skills
	class buyXP
	{
		module="skills";
		payloads[] = {"STRING"};
	};
	class saveXP
	{
		module="skills";
		payloads[] = {"ARRAY"};
	};
	class buyTimeSaverResponse
	{
		module="skills";
		payloads[] = {"STRING"};
	};
	//Groups messages
	class saveTax
	{
		module = "groups";
		payloads[] = {"HASHMAP"};
	};
	class saveSalary
	{
		module = "groups";
		payloads[] = {"HASHMAP"};
	};
	class createOrganization
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class upgradeRequest
	{
		module = "groups";
		payloads[] = {"SCALAR"};
	};
	class leaveFromGroup
	{
		module = "groups";
		payloads[] = {};
	};
	class updateDayText
	{
		module = "groups";
		payloads[] = {
			"ARRAY"
		};
	}
	class dropPermissions
	{
		module = "groups";
		payloads[] = {};
	};
	class registerGroup
	{
		module = "groups";
		payloads[] =
		{
			"STRING",
			"ARRAY"
		};
	};
	class disbandRequest
	{
		module = "groups";
		payloads[] = {};
	};
	class registerResponse
	{
		module = "groups";
		payloads[] =
		{
			"SCALAR",
			"ARRAY"
		};
	};
	class updateMarkers
	{
		module="groups";
		payloads[]=
		{
			"ARRAY"
		};
	};
	class updatePolys
	{
		module="groups";
		payloads[]=
		{
			"ARRAY"
		};
	};
	class addMarkerRequest
	{
		module="groups";
		payloads[]=
		{
			"STRING",
			"ARRAY",
			"ARRAY",
			"SCALAR",
			"STRING",
			"SCALAR"
		};
	};
	class addPolyRequest
	{
		module="groups";
		payloads[]=
		{
			"ARRAY",
			"ARRAY"
		};
	};
	class removeMarkerRequest
	{
		module="groups";
		payloads[]=
		{
			"SCALAR",
			"SCALAR"
		};
	};
	class broadcastGroupMessage
	{
		module="groups";
		payloads[]=
		{
			"STRING"
		};
	};
	class updateTFARSettings
	{
		module="groups";
		payloads[]=
		{
			"ARRAY"
		};
	};
	class updateTFARResponse
	{
		module="groups";
		payloads[]=
		{
			"STRING",
			"ARRAY"
		};
	};
	class updateGroupBank
	{
		module="groups";
		payloads[]=
		{
			"BOOL",
			"SCALAR"
		};
	};
	class bankActionResponse
	{
		module="groups";
		payloads[]=
		{
			"ARRAY"
		};
	};
	class removeAllMarkers
	{
		module = "groups";
		payloads[] = {};
	};
	class saveTitle
	{
		module = "groups";
		payloads[] = {"SCALAR","STRING","ARRAY"};
	};
	class saveTitleResponse
	{
		module = "groups";
		payloads[] = {"HASHMAP"};
	};
	class giveLeader
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class setDeputy
	{
		module = "groups";
		payloads[] = {"STRING","BOOL"};
	};
	class transferOwnership
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class updateMajorGroup
	{
		module = "groups";
		payloads[] = {"HASHMAP"};
	};
	class updatePlayerRank
	{
		module = "groups";
		payloads[] = {"HASHMAP","SCALAR","STRING"};
	};
	class minRank
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class addRank
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class kickPlayer
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class kickMePlz
	{
		module = "groups";
		payloads[] = {};
	};
	class disbandResponse
	{
		module = "groups";
		payloads[] = {};
	};
	class inviteRequest
	{
		module = "groups";
		payloads[] = {"STRING"};
	};
	class inviteMe
	{
		module = "groups";
		payloads[] = {"STRING","STRING"};
	};
	class inviteConfirmRequest
	{
		module = "groups";
		payloads[] = {"BOOL"};
	};
	class inviteServerResponse
	{
		module = "groups";
		payloads[] = {"BOOL"};
	};
	class updateDescText
	{
		module = "groups";
		payloads[] = {"STRING","ARRAY"};
	};
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	class flyOnIslandRequest
	{
		module = "transfer";
		payloads[] = {"STRING","SCALAR"};
	};
	class flyOnIslandResponse
	{
		module = "transfer";
		payloads[] = {"BOOL","STRING"};
	};
	class startSessionResponse
	{
		module = "session";
		payloads[] =
		{
			"STRING"
		};
	};
	class saveLocalData
	{
		module = "session";
		payloads[] =
		{
			"SCALAR",
			"SCALAR",
			"SCALAR",
			"BOOL",
			"ARRAY",
			"SCALAR",
			"SCALAR"
		};
	}
};
