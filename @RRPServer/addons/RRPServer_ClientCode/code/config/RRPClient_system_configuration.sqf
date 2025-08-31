/*

	Filename: 	RRPClient_system_configuration.sqf
	Project: 	Rimas Altis Life RPG
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
life_to_break_handler = false;

//Farming
life_currentSeed = "";
life_previewPlant = objNull;
life_farmGroundTypes = ["#GdtStratisDryGrass","#GdtStratisGreenGrass","#GdtStratisForestPine","#GdtStratisDirt","#GdtDirt","#GdtGrassGreen","#GdtGrassDry","#GdtSoil","#GdtThorn","#GdtMarsh","#GdtVRsurface01","#gdtrrpgrass"];

/*            JOBS            */
life_job_inProgress = false;

task_flyDpActive = false;

life_dlv_readyToWork = false;
life_dlv_job = taskNull;
life_dlv_vehicle = ObjNull;

life_dhl_readyToWork = false;
life_dhl_vehicle = ObjNull;
life_dhl_box = ObjNull;
life_dhl_job = taskNull;

life_eln_readyToWork = false;
life_eln_vehicle = ObjNull;
life_eln_task = taskNull;
life_eln_job = taskNull;
life_eln_lamps = [];

life_bus_readyToWork = false;
life_bus_vehicle = ObjNull;
life_bus_task = taskNull;
life_bus_job = taskNull;
life_bus_points = [];

life_eco_gs_readyToWork = false;
life_eco_gs_vehicle = ObjNull;
life_eco_gs_task = taskNull;
life_eco_gs_job = taskNull;
life_eco_gs_points = [];

life_eco_ws_readyToWork = false;
life_eco_ws_vehicle = ObjNull;
life_eco_ws_task = taskNull;
life_eco_ws_job = taskNull;
life_eco_ws_points = [];

life_dcourrier_digs = [];
life_dcourrier_job = taskNull;
life_dcourrier_task = taskNull;

life_dcleaner_houses = [];
life_dcleaner_corpse = objNull;
life_dcleaner_job = taskNull;
life_dcleaner_task = taskNull;

life_ds_box = ObjNull;
life_ds_job = taskNull;

life_terror_box = ObjNull;
life_terror_job = taskNull;
/*            JOBS            */

bind_number_array = parseSimpleArray (["bind_number_array", '[["",""],["",""],["",""],["",""],["",""],["",""],["",""],["",""],["",""]]'] call RRPClient_reg_read);
bind_f_number_array = parseSimpleArray (["bind_f_number_array", '[["",""],["",""],["",""],["",""],["",""],["",""],["",""],["",""],["",""]]'] call RRPClient_reg_read);
life_showWeaponHud = [false, true] select (parseNumber (["life_showWeaponHud", "1"] call RRPClient_reg_read));
life_saveBind = [false, true] select (parseNumber (["life_saveBind", "1"] call RRPClient_reg_read));
life_showCaseTimer = [false, true] select (parseNumber (["life_showCaseTimer", "1"] call RRPClient_reg_read));
life_streamerMode = [false, true] select (parseNumber (["life_streamerMode", "0"] call RRPClient_reg_read));
life_music = [false, true] select (parseNumber (["life_music", "0"] call RRPClient_reg_read));
life_welcomeScreen = [false, true] select (parseNumber (["life_welcomeScreen", "0"] call RRPClient_reg_read));

fl_inv_dragging = false;
life_wait = false;

PartyMeatDeathCombo = 0;
PartyMeatKillCombo = 0;
inviteToPartyMeat = false;

debug = false;
//hud
RRPClientHUDIndicators = ["","","","","","",""];
weaponShopMode = "";
//buffs
RRPClientBuffs_CD = [];
RRPClientBuffs_SprintCoef = 1;
RRPClientBuffs_CoefFarmTime = 1;

RRPClientBuffs_SprintActive = 0;
RRPClientBuffs_StaminaActive = 0;
RRPClientBuffs_CargoActive = 0;
RRPClientBuffs_gHealActive = 0;
RRPClientBuffs_BoostFarmActive = 0;

amountGuiBuffs = [0,1,2,3,4,5,6,7,8,9];
treeExtractionAsBonfireOrResource = false;
debug_mod = false;
task_flyDpActive = false;

//-- Surv
RRPClientHunger = 100;
RRPClientThirst = 100;
RRPClientNarcomania = 0;
RRPClientDiarrhea = false;
RRPClientAlcohol = 0;



//documents
life_documents = [];
life_documentsData = [];

isUnderWater = false;
RRPOxygenRemaining = 0;
//Аномалии
life_anomalyZone = "";
life_anomalyZonePos = [];
life_anomalyZoneSize = 0;
life_anomalyGasDamage = (getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "gasDamage") == 1);
life_anomalyIdleDistance = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "particleDistance");
life_anomalyTriggerDistance = getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "triggerDistance");
life_anomalyBoltAmmo = getText(missionConfigFile >> "LifeCfgAnomaly" >> "boltAmmo");
life_anomalyGasMask = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "gasMasks");
life_anomalyUniqueDef = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "unique");
life_anomalyUniform = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "uniform");

life_anomalyCooldown = false;
life_anomalyFogActive = false;
life_anomalyActive = false;
life_anomalyActiveArray = [];
life_anomalyHouseArray = [];
life_anomalyArtefactArray = [];

life_detectorRadimetrActive = false;
life_detectorRadimetrItem = "";
//life_detectorRadimetrItems = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorRadimetrItems");
life_detectorAnomalyActive = false;
life_detectorAnomalyItem = "";
//life_detectorAnomalyItems = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorAnomalyItems");
life_detectorArtefactActive = false;
life_detectorArtefactItem = "";
//life_detectorArtefactItems = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorArtefactItems");

//Радиация
life_radiationCooldown = false;
life_radiationTrigger = objNull;
life_radiationTerrain = 0;
life_radiationSpentTime = 0;
life_radiationInfection = 0;

LIFE_PPE_ANOMALY_COLOR = -1;
LIFE_PPE_ANOMALY_FILMGRAIN = -1;
LIFE_PPE_ANOMALY_FOGBLUR = -1;
LIFE_PPE_ANOMALY_SKRIMER = -1;

LIFE_PPE_RADIATION_CHROM = -1;
LIFE_PPE_RADIATION_COLOR = -1;
LIFE_PPE_RADIATION_FILM = -1;


RRPClientMinerVehList = [];
RRPClientSpectrDeviceEnable = false;
RRPClientInDeathZone = false;
RRPClientKortochki = false;
NotificationNumber = 0;

RRPClientHotwired = objNull;

RRPClientCameraObject = objNull;
RRPClientCameraNVG = false;

//radar
life_cop_radar_info = [];

//звоночек
life_bell_lock = 0;
life_bell_count = 0;
life_bell_time = 0;

RRPClientWaitingBuyCar = false;

///CW
life_jail_coin = 0;
life_pickAxe_active = false;

life_farm_type_array = [["Mining_Prof"],["Minerals_Prof"]];
life_farm_type = "Mining_Prof";
life_farm =
[
	["farm_mining_rock","Mining_Prof",0,"rock"],
	["farm_mining_coal","Mining_Prof",0,"coalunrefined"],
	["farm_mining_iron","Mining_Prof",3,"ironunrefined"],
	["farm_mining_copper","Mining_Prof",6,"copperunrefined"],
	["farm_mining_tin","Mining_Prof",9,"olovounrefined"],
	["farm_mining_galena","Mining_Prof",11,"galenitunrefined"],
	["farm_mining_nikelin","Mining_Prof",14,"nikelinunrefined"],
	["farm_mining_silver","Mining_Prof",16,"silverunrefined"],
	["farm_mining_gold","Mining_Prof",17,"goldunrefined"],
	["farm_mining_platinum","Mining_Prof",18,"platinaunrefined"],
	["farm_mining_titaniu","Mining_Prof",20,"titaniuunrefined"],
	["farm_mining_mithril","Mining_Prof",30,"mithrilunrefined"],
	["farm_minerals_yashma","Minerals_Prof",0,"yashmaunrefined"],
	["farm_minerals_quartz","Minerals_Prof",0,"quartzunrefined"],
	["farm_minerals_nephritis","Minerals_Prof",1,"nephritisunrefined"],
	["farm_minerals_obsidian","Minerals_Prof",3,"obsidianunrefined"],
	["farm_minerals_apatite","Minerals_Prof",6,"apatiteunrefined"],
	["farm_minerals_malachite","Minerals_Prof",8,"malachiteunrefined"],
	["farm_minerals_amber","Minerals_Prof",9,"amberunrefined"],
	["farm_minerals_topaz","Minerals_Prof",10,"topazunrefined"],
	["farm_minerals_opal","Minerals_Prof",13,"opalunrefined"],
	["farm_minerals_ruby","Minerals_Prof",16,"rubyunrefined"],
	["farm_minerals_sapphire","Minerals_Prof",19,"sapphireunrefined"],
	["farm_minerals_emerald","Minerals_Prof",22,"emeraldunrefined"],
	["farm_minerals_diamond","Minerals_Prof",30,"diamondunrefined"]
];

{
missionNamespace setVariable[(_x select 0),[0,(_x select 1),(_x select 2),(_x select 3)]];
} foreach life_farm;

array_resource_info = [];
life_local_oil_objects = [];
life_job_active = profileNamespace getVariable ["ActiveJob",false];
life_tree_chop = [objNull,0];
box_work_port_active = false; //порт
life_admin_mode = false;
life_admin_actions = [];
life_admin_uniform = [];
life_last_sold_vid = 0;
life_actions = [];
life_tfWarn = 0;
life_action_delay = time;
life_santa_delay = time;
life_trunk_vehicle = Objnull;
life_garage_store = false;
life_session_tries = 0;
life_siren_active = false;
life_clothing_filter = 0;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_connected = false;
life_action_gathering = false;
life_drink = 0;
life_logout_position = [];
life_jail_time = 0;
life_god = false;
life_frozen = false;
life_markers = false;
life_prisonkey = false;
life_slave = false;
life_veh_trunk_sync = [];
life_atm_timer = time;
life_garage_timer = time;
life_vshop_timer = time;
life_garage_sp_name = "none";
life_playerTrasnferDone = false;
life_ids = [];
life_tempHouses = [];
life_speedTicket = 0;
life_medicstatus = -1;
life_medicstatusby = "";
life_hit_by_car = false;
life_gov = false; //губернатор ли я
life_tmp_tax = 0; //налоги на отправку
life_tmp_selled = []; //проданное говно
life_fractionInUse = false;
life_haveCredit = [];
RRPClientAtmWaitingResponse = false;
RRPClientLTDsData = [];
RRPClientLtdWaitResponse = false;
RRPClientPoliceCurrentID = "";
RRPClientPoliceDataWanted = [];
life_deathScreen_canRespawn = false;
life_lastVehicle = vehicle player;
life_netid_houses = [];

MouseButton = false;

adac_vehicleToUpgrade = ObjNull;
life_DraggedBody = ObjNull;

life_dhl_car = ObjNull;
life_job_car = ObjNull;
life_dhl_box = ObjNull;
life_dhl_orderInProgress = false;

life_arc_currentZones = [];
life_arc_currentZone = "";
life_arc_currentPoint = [];

life_firstTime = true;
life_newLife = false;
life_teargas = false;

life_dance = false;

["all"] call RRPClient_system_removeBuff;

life_debuff1 = false;
life_debuff2 = false;
life_debuff3 = false;
life_debuff4 = false;
life_debuff5 = false;

life_buff1 = false;
life_buff2 = false;
life_buff3 = false;
life_buff4 = false;
life_buff5 = false;

life_bar_placey = [];//Массив заграждений
life_bar_limit = 15;//Лимит заграждений
life_barrier_active = false;
life_barrier_activeObj = ObjNull;

RRPClientDeleteAmmoTime = 0;
life_warBlur_status = false;
life_pvp = false;
life_pvp_start = 0;

life_currentContainer = objNull;
life_currentSecondaryContainer = objNull;
life_ContainerOpened = false;

life_inwarzone = false;

life_karma = 0;
life_tree_chop = [objNull,0];

life_seatBelt = false;
//spawn func handlers
LIFE_HANDLE_EFFECTS = scriptNull;
LIFE_HANDLE_HUD = scriptNull;
LIFE_HANDLE_DRUGS = scriptNull;
LIFE_HANDLE_DMG = scriptNull;
LIFE_HANDLE_SICK = scriptNull;
LIFE_HANDLE_DRUNK = scriptNull;
LIFE_HANDLE_FOODWATER = scriptNull;
LIFE_HANDLE_WEIGHT = scriptNull;
LIFE_HANDLE_PVP = scriptNull;
LIFE_HANDLE_WARZONES = scriptNull;
LIFE_HANDLE_POSITION = scriptNull;
LIFE_HANDLE_TEAMSPEAK = scriptNull;
LIFE_HANDLE_URAN = scriptNull;
LIFE_HANDLE_TEMPVARS = scriptNull;

LIFE_HANDLE_HEROINE = scriptNull;
LIFE_HANDLE_COCAINE = scriptNull;
LIFE_HANDLE_MARJ = scriptNull;
LIFE_HANDLE_LSD = scriptNull;

//Animals
RRPClient_BanReason = "";

//Post process effects
LIFE_PPE_DAMAGE05 = -1;
LIFE_PPE_DRUNK = -1;
LIFE_PPE_DRUGS_DB = -1;
LIFE_PPE_DRUGS_CA = -1;

life_message1 = false;
life_message2 = false;
life_message3 = false;
life_message4 = false;
life_message5 = false;

life_mapFirstTimeOpen = true;

life_myIdentity = "";
life_death_markers = [];
TF_speak_volume_meters = 20;
life_myPassportID = "";
life_deaths = 0;
life_deaths_max = 3;
life_myTagID = "";
life_myPadSkinID = "IMG_0";
life_myTitleID = "default";
license_isGirl = false;
life_canBill = false;

life_viewDistanceFoot = profileNamespace getVariable ["RRPSetting_viewDistanceFoot",600];
life_viewDistanceCar = profileNamespace getVariable ["RRPSetting_viewDistanceCar",600];
life_viewDistanceAir = profileNamespace getVariable ["RRPSetting_viewDistanceAir",1500];
life_myThemeID = profileNamespace getVariable ["RRPSetting_myThemeID","default"];
enableGrass = profileNamespace getVariable ["RRPSetting_enableGrass",false];
enableSoundAmbient = profileNamespace getVariable ["RRPSetting_enableSoundAmbient",false];

enableTags = profileNamespace getVariable ["RRPSetting_enableTags",true];
enableHUD = profileNamespace getVariable ["RRPSetting_HUD",true];
openApp = profileNamespace getVariable ["RRPSetting_OpenApp",true];

//параметры домов
life_houses = [];
life_houses_count = 0;
life_house_box = ObjNull;

//параметры группировок
life_gangData = [];

life_clothing_purchase = [[],[],[],[],[]];

life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_action_in_use = false;
life_smartphoneTarget = ObjNull;

life_vehicles = [];
bank_robber = [];

RRPClientWaitHouseSellResponse = false;
RRPClientWaitingVehicleResponse = false;
RRPClientWaitingSlaveResponse = false;
RRPClientWaitingMyCashResponse = false;
RRPClientWaitingResponseLegal = false;

RRPClientSelectedHouse = objNull;
RRPClientLTDsStoreData = [];


BuildPosX = 0;
BuildPosY = 2;
BuildPosZ = 1;
BuildVecYaw = 0;
BuildVecPitch = 0;
BuildVecRoll = 0;
life_container_activeObj = objNull;
life_container_activeObjClassName = "";

DCASH = 0; //грязные деньги
CASH = 0;
BANK = 0;
SmartPoints = 0;

HuntingMarkersPosAndSize = [];
{
	switch (_x) do
	{
		case "gather_hunt_zone":
		{
			HuntingMarkersPosAndSize pushBack
			[
				getMarkerPos _x,
				(getMarkerSize _x) select 0
			];
		};
		case "gather_hunt_zone_1":
		{
			HuntingMarkersPosAndSize pushBack
			[
				getMarkerPos _x,
				(getMarkerSize _x) select 0
			];
		};
	};
}forEach allMapMarkers;

life_showHUD = true;

//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

call RRPClient_perks_initClient;
call RRPClient_config_loadFromProfile;
true
