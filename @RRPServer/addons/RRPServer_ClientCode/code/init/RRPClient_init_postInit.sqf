/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/
private["_shift", "_spawnInterval"];

RRPClientSettingsArray = [
	"life_myPassportID",
	"life_myIdentity",
	"life_death_markers",
	"life_myTagID",
	"life_myPadSkinID",
	"life_myTitleID",
	"life_isGirl",
	"life_canBill",
	"life_karma",
	"life_deaths",
	"life_firstTime",
	"rrpvar_questsList"
];
if (hasInterface) then
{
	onMapSingleClick {_shift};

	[20 * 60, {["dumpToDB"] call RRPClient_admin_getProcesses}, [], true] call RRPClient_system_thread_addTask;
	
	RRPClientTabletCurrentSlide = "MainMenu";
	RRPClientTabletFirstOpen = true;
	RRPClientNotificationHistory = [];
	RRPClientTabletConfirmResult = nil;
	RRPClientTabletIsConfirmVisible = false;
	RRPClientTabletIsWarningVisible = false;

	life_cs_locsCache = [];
	life_cs_selected = -1;
	life_cs_lastSelected = "";
	life_cs_start = 0;
	life_cs_timer = -300;
	life_cs_vehicle = objNull;
	life_cs_renting = false;

	life_timerArray = [displayNull,displayNull,displayNull,displayNull,displayNull];

	RRPNextFireFliesSpawnAt = diag_tickTime + (20 + (random 20));
	[5, RRPClient_fireFlies_thread_update, [], true] call RRPClient_system_thread_addtask;


	BombActivationSpeed = 60;
	BombCountdownTime = 5 * 60;
	CarBombCountdownThread = scriptNull;

	mav_taxi_v_callAmount					= count mav_taxi_v_callQueue;
	mav_taxi_v_hasCalledTaxi				= false;
	mav_taxi_v_isOnDuty						= false;
	mav_taxi_v_isDriver						= false;
	mav_taxi_v_myDriver						= objNull;
	mav_taxi_v_myCustomer					= objNull;
	mav_taxi_v_currentFare_startTime		= 0;
	mav_taxi_v_currentFare_totalDistance 	= 0;
	mav_taxi_v_myCallId						= -1;
	mav_taxi_v_destination					= [];

	// Vars from config
	mav_taxi_v_pricePerKilometre 			= getNumber (missionConfigFile >> "maverick_taxis_cfg" >> "pricing" >> "pricePerKilometre");

	RRPClientDailyRewardDay = 1;
	RRPClientCurrentAnimal = objNull;
	RRPClientDRAW3DVehStat = -1;
	RRPClientGarageSlots = 20;
	RRPClientMarkerFinder = false;
	RRPClient_vehicle_AllDistance = -1;
	RRPClientSpawnLocationName = "";
	RRPClientSpawnDone = false;
	RRPClientKeyHandle = false;
	RRPClientPlayerOnStratis = false;
	RRPClientCompleteAch = [];
	RRPClientPartyID = "";
	RRPClientKeyHintsControls = [];
	call RRPClient_groups_clientInit;

	life_holster_delay = time;

	//-- Warzones
	RRPClientWarZoneMarkerName = "war_zone";
	RRPClientWarZoneMarkerName2 = "war_zone_warning";
	RRPClientWarZoneNameRadius = "war_zone_radius";
	RRPClientWarZones = [[0,0],"",0,false];
	RRPClientMarkerCountLocal = 0;
	RRPClientMarkerIndexLocal = 0;
	RRPClientWarZoneChatCooldown = 0;
	
	RRPClientGasMaskVisible = false;
	GasMaskNextSoundAt = diag_tickTime;
	LayerGasMask = ("RscGaskMaskLayer" call BIS_fnc_rscLayer);

	RRPClientGasMaskVisible = false;
	GasMaskNextSoundAt = diag_tickTime;
	LayerGasMask = ("RscGaskMaskLayer" call BIS_fnc_rscLayer);

	//-- Snow
	SnowClose 	= objNull;
	SnowNear 	= objNull;
	SnowFar 	= objNull;

	//-- Init ini actions
	ChatHistoryINI 	= ["new","chat_history"] call RRPClient_ini_action;
	FriendsINI 		= ["new","friend_list"] call RRPClient_ini_action;

	RRPClientLastDrawTag = diag_tickTime;
	RRPClientLastDrawParty = diag_tickTime;
	RRPClientLastDrawVehNumbers = diag_tickTime;
	RRPClientLastDrawWaypoints = diag_tickTime;

	//-- Poses
	RRPClientActiveAnim = false;
	
	//-- geters from ini
	RRPClientTGFriends = ["read"] call RRPClient_ini_friendList;

	call RRPClient_cache_setup;
	call RRPClient_system_allThreads;
	call RRPClient_md_detectorsactivate;
	call RRPClient_animal_initialize;
	call RRPClient_suppression_init;
	call FT_fnc_musicInitialize;
	[] spawn RRPClient_gui_map_hooks;
	[] spawn RRPClient_system_helperMessages;
	[] spawn RRPClient_gui_escWatermark;
	// [] spawn RRPClient_spyglass_initSpy;
	[1] call RRPClient_envirenment_lun;
	call RRPClient_russianRoulette_initialize;

	PPeffect_colorC = ppEffectCreate ["ColorCorrections",999999];
	PPeffect_colorC ppEffectAdjust [1,1,0,[0,0.38,0.67,-0.06],[1,1,1,1.1],[0,0,1.04,0]];
	PPeffect_colorC ppEffectEnable true;
	PPeffect_colorC ppEffectCommit 0;
	

	switch (CurrentSeasson) do 
	{
		case "Christmas": {
			[] spawn RRPClient_seasons_weatherWinter;
		};
		default {};
	};

	//-- Simulation settings
	if (!isServer) then
	{
		if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then
		{
			enableDynamicSimulationSystem true;
			"Group" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "groupSimulationDistance"));
			"Vehicle" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "vehicleSimulationDistance"));
			"EmptyVehicle" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "emptyVehicleSimulationDistance"));
			"Prop" setDynamicSimulationDistance (getNumber(missionConfigFile >> "CfgSimulation" >> "propSimulationDistance"));
			"IsMoving" setDynamicSimulationDistanceCoef (getNumber(missionConfigFile >> "CfgSimulation" >> "isMovingSimulationCoef"));
		};
	};
};
