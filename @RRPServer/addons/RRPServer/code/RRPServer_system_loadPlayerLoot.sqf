/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
	
	Result:
		id     					= 0 
		assigned_items     		= 1	
		backpack     			= 2
		backpack_items     		= 3	
		backpack_magazines     	= 4
		backpack_weapons     	= 5
		current_weapon     		= 6
		goggles     			= 7
		handgun_items     		= 8
		handgun_weapon     		= 9	
		headgear     			= 10
		binocular     			= 11
		loaded_magazines     	= 12
		primary_weapon     		= 13
		primary_weapon_items    = 14
		secondary_weapon     	= 15
		secondary_weapon_items  = 16
		uniform     			= 17
		uniform_items     		= 18
		uniform_magazines     	= 19
		uniform_weapons     	= 20
		vest     				= 21
		vest_items     			= 22
		vest_magazines   		= 23
		vest_weapons    		= 24
		trunk    				= 25
		
		[
			289,
			["ItemMap","ItemCompass","tf_microdagr","tf_anprc154","ItemGPS","TRYK_Headset_NV"],
			"kaelmonty2",
			[["ItemGPS",3]],
			[],
			[],
			"hlc_rifle_aks74",
			"TRYK_Beard_BK2",
			["","","",""],
			"",
			"rds_Profiteer_cap3",
			"",
			[["hlc_rifle_aks74","hlc_30Rnd_545x39_B_AK",30,"hlc_rifle_aks74"],["Extremo_Tool_Shovel","Extremo_Magazine_Swing",999,"Extremo_Tool_Shovel"]],
			"hlc_rifle_aks74",
			["","","",""],
			"Extremo_Tool_Shovel",
			["","","",""],
			"TRYK_U_B_PCUGs_gry",
			[],
			[],
			[],
			"V_TacVest_brn",
			[],
			[],
			[],
			[]
		]
		пример-то устарел сука
*/

if (_this isEqualType []) exitWith {
	params ["_name","_uid"];
	format ["insertNewPlayerData:%1:%2",_playerUID,selectRandom(getArray(missionconfigFile >> "LifeCfgSettings" >> "startUniforms"))] call RRPServer_DB_fireAndForget;
};

private _time = diag_tickTime;
private _playerObject = _this;
if (isNull _playerObject) exitWith {};
private _playerUID = getPlayerUID _playerObject;
if (_playerUID isEqualTo "") exitWith {};
private _data = format ["loadPlayerData:%1", _playerUID] call RRPServer_DB_selectSingle;
if (isNil "_data") exitWith 
{
	format ["insertNewPlayerData:%1:%2",_playerUID,selectRandom(getArray(missionconfigFile >> "LifeCfgSettings" >> "startUniforms"))] call RRPServer_DB_fireAndForget;
	_playerObject call RRPServer_system_loadPlayerLoot;
};

_own = owner _playerObject;
if (_own in [-2,0]) exitWith {
	diag_log format ["LOAD LOOT INVENTORY! OWNER %1 | UID: %2",_own,_playerUID];
};

missionNamespace setVariable ["JT_" + _playerUID, serverTime];
missionNamespace setVariable ["AT_" + _playerUID, _data select 33];

_data remoteExecCall ["RRPClient_session_loadPlayerData",_playerObject];
_playerObject setVariable ["RRPDatabaseID",(_data # 0)];
