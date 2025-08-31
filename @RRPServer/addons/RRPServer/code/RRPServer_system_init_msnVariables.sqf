_ChanelName = switch (hostNumber) do
{
	case 1: {"TFAR1"};
	case 2: {"TFAR2"};
	case 3: {"TFAR3"};
};

serverid = switch (hostNumber) do
{
	case 1: {"altislife"};
	case 2: {"altislife3"};
	case 3: {"altislife3"};
};
publicVariable "serverid";
{
    missionNamespace setVariable [_x select 0,_x select 1,true];
} forEach [
	// Taxi
	["mav_taxi_v_callQueue",[]],
	["mav_taxi_v_activeFares",[]],

	["RRPLockToSellResource",false],
	["RRPPublicDayToday",toUpper("selectDayName" call RRPServer_DB_selectSingleField)],
    //Restart
    ["forceRestartTime", 14400],
    ["server_ddos_air", false],
    ["server_ddos_ts", false],
    ["server_restartsoon", false],
    //gangs
    ["life_westGangId", 1],
    ["life_eastGangId", 2],
    //TASKFORCE
    ["tf_radio_server_name", "Aurora Role Play"],
    ["tf_radio_channel_name", _ChanelName],
    ["tf_radio_channel_password", "0638239983"],
	//Gov
	["server_creditTax",0],
    ["server_donat_vehicles",["CN_BRDM","PD_BRDM","Pirates_BRDM","PHEONIX_BRDM","imperium_BRDM","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F","B_APC_Wheeled_01_cannon_F","I_mas_BTR60","I_mas_BRDM2","I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","O_APC_Tracked_02_AA_F","O_mas_ZSU_OPF_01","B_APC_Tracked_01_CRV_F","I_APC_tracked_03_cannon_F","B_MBT_01_cannon_F","B_MBT_01_TUSK_F","I_mas_BMP1P_AAF_01","I_mas_BMP1_AAF_01","I_mas_BMP2_HQ_AAF_01","I_mas_BMP2_AAF_01","O_MBT_02_cannon_F","I_MBT_03_cannon_F","I_mas_T55_AAF_01","I_mas_T34_AAF_01","B_Heli_Light_01_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","I_Heli_light_03_dynamicLoadout_F","EC635_CSAT","B_mas_UH1Y_F","B_mas_UH60M","O_Heli_Attack_02_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F"]],
	["server_tax",0],
	["server_bank",0],
	["server_poor",0],
	["server_mar_legal",false],
	["server_slavery",false],

	//HC
    ["RRPHC_enable",false],
    ["HC_Life",false],

    ["server_candidates",[]],
	["server_govinfo",[]],
	//["server_cominfo",[]],
	["RRPServerWarZones",[]],
	["RRPPublicSessionID",round(random 999999)],
	//Only time
	["RRPPublicTime",systemTime],
	//---
	["ObjectsToHide", []],
	//Dispatch
	["RRPClient_waiting_cop_calls", []],
	["RRPClient_waiting_med_calls", []],
	//Jail
    ["life_JailSmallPoints",
		[
			[5156.92,14618.2,-0.00686646],
			[5162.8,14618.4,-0.0522289],
			[5168.63,14618.4,-0.00961685],
			[5174.66,14618.7,0.0269432]
		]
	],
	["life_JailBigPoints",
		[
			[2966.92,17741,0]
		]
	]
];

// fed_bank setVariable ["safe",count playableUnits,true];

// master_group attachTo[bank_obj,[0,0,0]];

private _dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
private _rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable [format ["bis_disabled_Door_%1",_i],1,true]; _dome animate [format ["Door_%1_rot",_i],0];};
_dome setVariable ["locked",true,true];
_rsb setVariable ["locked",true,true];
_rsb setVariable ["bis_disabled_Door_1",1,true];
_dome allowDamage false;
_rsb allowDamage false;

RRPServerPatchesAddons = [];
_cfg = configFile >> 'CfgPatches';
for '_i' from 0 to (count _cfg)-1 do
{
	_c = _cfg select _i;
	if(isClass _c)then
	{
		_t = configName _c;
		RRPServerPatchesAddons pushBack _t;
	};
};
private _exclude = ["RRPAH","RRPServer","a3_infiSTAR","asct","brc_helper","infiSTAR_AIO","extDB3","ara_metrics_core","DiscordEmbedBuilder"];
for "_i" from 0 to (count _exclude)-1 do
{
	format ["ExcludeLits - %1",_exclude select _i] call RRPServer_util_log;
	_index = RRPServerPatchesAddons find (_exclude select _i);
	if !(_index isEqualTo -1) then
	{
		RRPServerPatchesAddons deleteAt _index;
	};
};
publicVariable "RRPServerPatchesAddons";

life_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0];
life_attachment_point setPosASL [0,0,0];
life_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];

// Sharing the point of attachment with all players.
publicVariable "life_attachment_point";

policeCode = [];
for "_i" from 0 to 4 do {
_RandomNumber = floor random 9;
policeCode pushback _RandomNumber;
};

publicVariable "policeCode";

_GetGovInfo = "updateGovInfo"  call RRPServer_DB_selectFull;

{
	missionNamespace setVariable ["server_bank",parseNumber(_x select 0),true];
	missionNamespace setVariable ["server_tax",_x select 1,true];
	missionNamespace setVariable ["server_creditTax",_x select 2,true];
	missionNamespace setVariable ["server_mar_legal",([_x select 3] call RRPServer_util_tinyIntConverter),true];
	missionNamespace setVariable ["server_slavery",([_x select 4] call RRPServer_util_tinyIntConverter),true];
	missionNamespace setVariable ["server_poor",parseNumber(_x select 5),true];
} forEach _GetGovInfo;

{
	_marker = createMarker [format["other_atm_%1",((getPosWorld _x) select 0)],getPosWorld _x];
	_marker setMarkerType "welmen_other_atm";
	_marker setMarkerSize [0.6,0.6];
}forEach allMissionObjects "Land_Atm_02_F";

["init"] call RRPClient_checkpoints_actions;

missionNamespace setVariable ["groupRentItemsList",("getGroupsRentItems" call RRPServer_DB_selectFull),true];
missionNamespace setVariable ["partyMeatOnline", 0, true];
