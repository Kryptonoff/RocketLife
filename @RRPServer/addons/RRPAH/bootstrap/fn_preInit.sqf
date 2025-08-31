diag_log "RRPServer - start - init";

private ["_code", "_function", "_file"];
_path = "\RRPAH\code";
[
	["RRPAH_util_getObjName",true],
	["RRPAH_util_executeJIP",true],
	["RRPAH_util_compilableString",true],
	["RRPAH_system_dupeClientServer"],
	["RRPAH_sys_postInit"],
	["RRPAH_util_log"],
	["RRPAH_sys_reloadBans"],
	["RRPAH_system_dumpProfile",true]
]apply
{
	_x params["_function",["_broadcast",false,[false]]];
	missionNamespace setVariable[_function, compileFinal preprocessFileLineNumbers format["%1\%2.sqf",_path,_function], _broadcast];
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// DO NOT EDIT BELOW!!!!!!!!!!!!!
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_dupe_check_recode =
{
	MouseButtonUpInventory = diag_tickTime;
	RRPClient_ad_check =
	{
		if !(player getVariable ["sessionCompleted",false]) exitWith {};
		if (alive player) then
		{
			_backpackcontainer = backpackContainer player;
			_vestcontainer = vestContainer player;
			_uniformcontainer = uniformContainer player;

			{
				if (!isNull _x) then
				{
					if (_x isEqualTo player) exitWith {};
					if !(alive _x) exitWith {};

					if (!isNull _backpackcontainer)then
					{
						if (_backpackcontainer isEqualTo backpackContainer _x) then
						{
							[3, netId player, netId _x, netId _backpackcontainer, 1] remoteExecCall ["RRPAH_system_dupeClientServer",2];
							removeBackpackGlobal player;
						};
					};

					if (!isNull _vestcontainer) then
					{
						if(_vestcontainer isEqualTo vestContainer _x) then
						{
							[3, netId player, netId _x, netId _vestcontainer, 2] remoteExecCall ["RRPAH_system_dupeClientServer",2];
							removeVest player;
						};
					};

					if (!isNull _uniformcontainer) then
					{
						if (_uniformcontainer isEqualTo uniformContainer _x) then
						{
							[3, netId player, netId _x, netId _uniformcontainer, 3] remoteExecCall ["RRPAH_system_dupeClientServer",2];
							removeUniform player;
						};
					};
				};
			} forEach allPlayers;
		};

		{
			_x params [["_container_class_player","",[""]],["_container_player",objNull,[objNull]]];
			([_container_class_player] call BIS_fnc_itemType) params [["_equip","",[""]],["_itemType","",[""]]];

			if !(_itemType isEqualTo "") then
			{
				_container_id_player = netId _container_player;
				_container_owner = objectParent _container_player;
				if (!isNull _container_owner) then
				{
					if !(_container_owner isEqualTo player) then
					{
						_log = format["Removed %1 because it belongs to %2(%3) - bag id: %4",_itemType,_container_owner call RRPAH_util_getObjName,getPlayerUID _container_owner,_container_id_player];
						[1, netId player, toArray(_log)] remoteExecCall ["RRPAH_system_dupeClientServer",2];

						if (_itemType isEqualTo "Vest") exitWith {removeVest player;};
						if (_itemType isEqualTo "Uniform") exitWith {removeUniform player;};
						if (_itemType isEqualTo "Backpack") exitWith {removeBackpackGlobal player;};
					};
				};

				{
					_object = _x;
					if (!isNull _object) then
					{
						_containers_x = everyContainer _object;
						if !(_containers_x isEqualTo []) then
						{
							_containers_x_objects = [];
							{_containers_x_objects pushBack (_x select 1);} forEach _containers_x;

							{
								_x params[["_container_class_x","",[""]],["_container_x",objNull,[objNull]]];
								([_container_class_x] call BIS_fnc_itemType) params [["_equip","",[""]],["_itemType_x","",[""]]];

								_idcontainer = netId _container_x;
								if(_container_id_player isEqualTo _idcontainer) exitWith
								{
									_ownerid_container = _idcontainer select [0,_idcontainer find ":"];
									_ownerid_container = parseNumber _ownerid_container;

									if (_itemType isEqualTo "Vest") exitWith {removeVest player;};
									if (_itemType isEqualTo "Uniform") exitWith {removeUniform player;};
									if (_itemType isEqualTo "Backpack") exitWith {removeBackpackGlobal player;};

									if !(clientOwner isEqualTo _ownerid_container) then
									{
										_log = format["Removed %1 because it belongs to %2 - bag id: %3",_itemType,_object,_idcontainer];
										[1, netId player, toArray(_log)] remoteExecCall ["RRPAH_system_dupeClientServer",2];
									};
								};

								if (_containers_x_objects isEqualTo []) then
								{
									_countids = {_container_x isEqualTo _x} count _containers_x_objects;
									if (_countids > 1) exitWith
									{
										if (_object isKindOf "Man") then
										{
											if (_itemType_x isEqualTo "Vest") exitWith {removeVest _object;};
											if (_itemType_x isEqualTo "Uniform") exitWith {removeUniform _object;};
											if (_itemType_x isEqualTo "Backpack") exitWith {removeBackpackGlobal _object;};
										}
										else
										{
											if (_itemType_x isEqualTo "Backpack") exitWith {clearBackpackCargoGlobal _object;};
											clearWeaponCargoGlobal _object;
											clearMagazineCargoGlobal _object;
										};

										_log = format["Bad %1 Cargo: %2:%3, %4:%5 (%6)",_itemType,netId _object,typeOf _object,_idcontainer,_x,_countids];
										[1, netId player, toArray(_log)] remoteExecCall ["RRPAH_system_dupeClientServer",2];
									};
								};
							} forEach _containers_x;
						};
					};
				} forEach [
					vehicle player,
					missionNameSpace getVariable ["life_currentContainer",objNull]
				];
			};
		} forEach [
			[backpack player,backpackContainer player],
			[vest player,vestContainer player],
			[uniform player,uniformContainer player]
		];
	};
	RRPClient_ad_check = compileFinal ([RRPClient_ad_check] call RRPAH_util_compilableString);


	dupecheck_d3dcode =
	{
		(findDisplay 602) displayRemoveAllEventHandlers "MouseButtonUp";
		(findDisplay 602) displaySetEventHandler ["MouseButtonUp","MouseButtonUpInventory = diag_tickTime;"];
		if(cameraView isEqualTo "GROUP")then
		{
			cameraOn switchCamera "INTERNAL";
			"Тактический обзор запрещен!" call chat;
		};
		false
	};
	dupecheck_d3dcode = compileFinal ([dupecheck_d3dcode] call RRPAH_util_compilableString);

	if (!isNil"dupe_check_thread") then {terminate dupe_check_thread;};
	dupe_check_thread = [] spawn
	{
		while {true} do
		{
			call RRPClient_ad_check;

			player removeAllEventhandlers "Put";
			player addEventHandler ["Put",{call RRPClient_system_onPutItem}];

			if (!isNil "draw3D_handlerID_dupecheck") then { removeMissionEventHandler ["Draw3D",draw3D_handlerID_dupecheck]; draw3D_handlerID_dupecheck = nil};
			draw3D_handlerID_dupecheck = addMissionEventHandler ["Draw3D", {call dupecheck_d3dcode}];

			uiSleep 0.5;
		};
	};
};
["",_dupe_check_recode,-2,"dupe_check_jipque"] call RRPAH_util_executeJIP;

fnc_check_uniform_n_vest = compileFinal "
	params ['_uniform', '_vest'];
	if!(uniform player isEqualTo _uniform)then
	{
		_uniformContent = (uniformContainer player) call RRPClient_util_containerCargo_serialize;
		player forceAddUniform _uniform;
		[(uniformContainer _player), _uniformContent] call RRPClient_util_containerCargo_deserialize;
		'Ваша форма была перезагружена! #armabugs' call chat;
	};
	if!(vest player isEqualTo _vest)then
	{
		_vestContent = (vestContainer player) call RRPClient_util_containerCargo_serialize;
		player addVest _vest;
		[(vestContainer player), _vestContent] call RRPClient_util_containerCargo_deserialize;
		'Ваша разгрузка была перезагружена! #armabugs' call chat;
	};
";
publicVariable 'fnc_check_uniform_n_vest';

_fix_exploit_TFARs = {

    _registry = profileNamespace getVariable ["cba_keybinding_registry_v3",["#CBA_HASH#", [], [], nil]];
    {

            _var = _x;

            if !(_var in [nil,[],"",[[]],[[[]]],[[[[]]]]]) then {
                _key = (_x # 0) # 0;
                _values = (_x # 0) # 1;

                if !(_values isEqualTypeAll false) then {
                    _id = _values findIf {!(_x isEqualType false)};

                    if (_id > -1) then {

                        [
                            "SpyGlass","","","",false,
                            [
                                [
                                    "TFAR/CBA EXPLOIT!",
                                    [
                                        "**EXPLOIT USED DETECTED!**",
                                        format ["**PLAYER:** %1 (%2)",name player, getPlayerUID player],
                                        format ["**VARIABLE**: %1", (_registry select 1) select _forEachIndex],
                                        format ["**CODE:**\n```%1```",(_values # _id)]
                                    ] joinString "\n",
                                    "",
                                    "FF0000",false,"","",[],[]
                                ]
                            ]
                        ]call sendDs;
						_values set [_id,false];
                        (_registry # 2) set [_forEachIndex,[[_id,_values]]];
                        [getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
						
                    };
                };
            };
    } forEach (_registry # 2);
    saveProfileNamespace;
};
["",_fix_exploit_TFARs,-2,"fix_expolit_tfar"] call RRPAH_util_executeJIP;

private _keywords = ["floridahook","local execute","player execute","floridahook - ","call compile", "spawn compile", "execvm", "compile", "preprocessfile", "loadfile", "tostring", "toarray", "compilefinal", "pushback _x", "pushback sqrt", "pushbackunique", "_this select", "_fnc_", "life_", "isequalto", "oneachframe", "mapsingleclick", "lbdata", "createmarkerlocal", "drawicon3d", "drawline3d", "getpos", "setpos", "createunit", "createvehicle", "markerposition", "setmarkerpos", "finddisplay", "createdisplay", "displayremove", "createdialog", "ctrlcreate", "allvariables", "getvariable", "setvariable", "publicvariable", "missionconfigfile", "cfgweapons", "cfgvehicles", "cfgmagazines", "addeventhandler", "seteventhandler", "addmagazinecargo", "addweaponcargo", "addbackpackcargo", "addmagazineglobal", "addweaponglobal", "diag_", "setdamage", "setdir", "setvelocity", "cursorobject", "playableunits", "allplayers", "allunits", "parsesimplearray", "gettext", "getarray", "getnumber", "cfgremoteexec", "cfgfunctions", "missionnamespace", "profilenamespace", "parsingnamespace", "uinamespace", "remoteexec", "clientowner", "servercommand"];
private _admins = [
	'76561198006439083',	// rimas
	'76561197984276591',	// rimas
	'76561198108509544',	// welmen
	'76561198051671319',	// nemore
	'76561198055124016',	// fairy
	'76561198256883473', 	// fairy second account
	'76561198090549826',	// arrra
	'76561198177370821',	// arrra laptop
	'76561199103273561', 	// jassica smith
	'76561198150220371',	// james

	//helpers
	'76561198430124432',	// KOT MATROSKIN
	'76561197983419452',	// Sergey Raspytin
	// "76561198860385638", 	// Bess Bananoff

	'76561198298733913',	// octavia
	'76561198976622527',	//Vova Fischin
	'76561199103431389'     //Loc Doc
	];

private _badUIVariables = ['_asdjghgvcxtxvyucyvttsauytduywadswads','_asdhbjhjsakdhjkvyuycvtxyxcvxcvcx','_ListBoz','OfnmmNMMnn','_MAINBACKLIST','_obscuratedmain','_gitmadistrack','_lb1','_lb2','_lb3','_eggsrcute','_popedit','_infobox','_lb3mode','_loadouts','_fhandler','_colortogges','_colortogges','_lb3mode','_lb3mode','_lb3mode','_lb3mode','_lb3mode','_lb3mode','_lb3mode','_PlayahVision','_playerdraw','_PlayahVision','_bombehicleVission','_Vehiclerdraw','_bombehicleVission','_safeviz','_safedraw','_safeviz','_messiahmode','_messiahmode','_speeeeeedy','_speeeeeedy','_staminup','_staminup','_murdurmode','_muderenabled','_murdurmode','_fastaskeem','_fastaskeem','_neverrunsout','_neverrunsout','_nocoil','_nocoil','_explooammo','_exploammo','_explooammo','_flareamooo','_flareamooo','_noosway','_noosway',"ExileIsLocked","ExileIsLocked",'_animalfarmers','_animalfarmers','_ghettoflyy','_ghettoflyy',"ExileLocker",'_spawntabs','_PlayahVision','_bombehicleVission','_murdurmode','_messiahmode','_ghettoflyy','_fastaskeem','_neverrunsout','_explooammo','_noosway','_animalfarmers','_nocoil','_staminup','_safeviz','_speeeeeedy','_slidersetup','_flareamooo','_infohandler','_spectator','_nearvehicss','_bantyplayers','_bantah2add','_lbvihics','_vehcisarrayy','_bags','_magazines','_weapons','_bombests','_heads','_uniforms','_fillemup','_remotemethod','_safezz','_kissmyballs','_colortogges','_colorfunccs',"w_1","w_2","w_3","b_1","b_2","ac","bc","c_1"];
_clothes = [];
{
	_config = _x;
	_clothing = getArray(_config >> "uniforms");
	{
		_clothes pushBackUnique (_x select 0);
	}forEach _clothing;
	_headgear = getArray(_config >> "headgear");
	{
		_clothes pushBackUnique (_x select 0);
	}forEach _headgear;
	_goggles = getArray(_config >> "goggles");
	{
		_clothes pushBackUnique (_x select 0);
	}forEach _goggles;
	_vests = getArray(_config >> "vests");
	{
		_clothes pushBackUnique (_x select 0);
	}forEach _vests;
	_backpacks = getArray(_config >> "backpacks");
	{
		_clothes pushBackUnique (_x select 0);
	}forEach _backpacks;

}forEach ("true" configClasses (getMissionConfig "LifeCfgClothShops"));

safetyKick = {
	params [
		['_uid','',['']],
		['_owner',-10,[0]]
	];
	if(_owner > 2)then
	{
		diag_log '#kick 5';
		_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_owner];
	}
	else
	{
		diag_log '#kick 6';
		_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_uid];
	};
};

sc37q2yNYc123eg1 = {
	if !(canSuspend) exitWith {_this spawn sc37q2yNYc123eg1};
	private ["_player","_uid","_ask"];
	params [
		["_nid","",[""]],
		["_data",[],[[]]]
	];

	{
		if (_x isEqualType "") then
		{
			_data set [_forEachIndex,[_x] call RRPClient_util_stripChars];
		};
	}forEach _data;
	["Hard",_data] call RRPClient_util_logArray;
	_data params [
		"_mac",
		"_hwid",
		"_Product",
		"_ip",
		"_GeoIP",
		"_SD_User",
		"_SD_ID",
		"_cpuId",
		"_cpuName",
		"_motherName",
		"_motherId",
		"_Bios_id",
		"_Bios_ReleaseDate",
		"_Bios_Version",
		"_Ram_serialNumber",
		"_ramCap",
		"_Ram_partNumber",
		"_Ram_Name",
		"_Product_Date",
		"_prodVersion",
		"_pcName",
		"_sid",
		"_vram",
		"_hdds",
		"_files0",
		"_files1",
		"_files2",
		"_files3",
		"_files4",
		"_files5"
	];
	{
		if (_x isEqualType "") then {
			[_x, ":"] call RRPClient_util_stripChars;
		};
	}forEach _data;
	_GeoIP params ["_City","_Country","_CountryCode","_Region","_RName","_ZIP"];
	_player = objectFromNetId _nid;
	_uid = getPlayerUID _player;
	_ask = format ["getPlayerHardware:%1",_uid] call RRPServer_DB_selectSingleField;
	_queryData = _data + [_uid];
	if (isNil "_ask") then
	{
		_query = ["insertHardware",_queryData] call RRPServer_DB_createMessage;
		_query call RRPServer_DB_fireAndForget;
		[
			"NewAcc","","","",false,
			[
				[
					format["Steam профиль: %1",name _player],
					"",
					"https://steamcommunity.com/profiles/" + _uid,
					"FBFF00",true,
					"","",[],[],
					[
						[
							"**Игрок:**",
							[
								format ["**Имя:** %1",name _player],
								format ["**UID:** %1",_uid],
								format ["**DISCORD:** %1",_dsName]
							] joinString "\n",
							true
						],
						[
							"**Данные о системе:**",
							[
								format ["**CPU:** %1",_cpuName],
								format ["**Motherboard:** %1",_motherName],
								format ["**GPU:** %1",_vram],
								format ["**WIN Version:** %1",_prodVersion],
								format ["**RAM Capacity:** %1",_ramCap],
								format ["**PC_Name:** %1",_pcName]
							] joinString "\n",
							true
						],
						[
							"**Инфо об IP:**",
							[
								format ["**IP:** %1",_ip],
								format ["**Country: **%1",_Country],
								format ["**City:** %1",_City],
								format ["**Region Name: **%1",_RName]
							] joinString "\n",
							true
						],
						[
							"**Идентификаторы:**",
							[
								format ["**DISCORD ID: **%1",_SD_ID],
								format ["**CPU ID:** %1",_cpuId],
								format ["**MOTHER ID:** %1",_motherId],
								format ["**HWID:** %1",_hwid],
								format ["**MAC:** %1",_mac],
								format ["**SID:** %1",_sid],
								format ["**HDDs: **%1",_hdds joinString "\n"]
							] joinString "\n",
							true
						]
					]
				]
			]
		] call DiscordEmbedBuilder_fnc_buildSqf;
	}else{
		_query = ["updatePlayerHardware",_queryData] call RRPServer_DB_createMessage;
		_query call RRPServer_DB_fireAndForget;
	};
	uisleep 2;
	_query = ["checkBan",[_uid]] call RRPServer_DB_createMessage;
	_baned = _query call RRPServer_DB_selectSingleField;
	format ["Check ban %1 ? %2 #0111",_uid,_baned] call RRPServer_util_debugConsole;
	if (_baned) then
	{
		_query = ["getMultiAccounts",[_uid]] call RRPServer_DB_createMessage;
		_mults = _query call RRPServer_DB_selectFull;
		if (count _mults > 1) then
		{
			[name _player,_uid,_mults] call sendMutiacsDiscord;
		};
		[_uid,owner _player] call safetyKick;
		"Response" remoteExecCall ["banClient",_player];
	};
};

sendMutiacsDiscord = {
	params ["_name","_uid","_mults"];
	_mults params ["_uids","_baned","_names"];
	[
		"Multis","","","",false,
		[
			[
				format["Steam профиль: %1",_name],
				[
					"**Пытался зайти с: **" + _uid
				] joinString "\n",
				"https://steamcommunity.com/profiles/" + _uid,
				"#FBFF00",true,
				"","",[],[],
				[
					[
						"**Имеет аккаунты:**",
						(_mults apply {_x#0} joinString "\n"),
						true
					],
					[
						"**Заблокированы за-до:**",
						_mults apply {_x#1} joinString "\n",
						true
					],
					[
						"**Имена в игре:**",
						(_mults apply {_x#2} joinString "\n"),
						true
					]
				]
			]
		]
	] call DiscordEmbedBuilder_fnc_buildSqf;
};

fnc_recompile = {
	if !(canSuspend) exitWith {_this spawn fnc_recompile};
	private _fnc = _this select 0;
	private _check = call {
		if ([_fnc, "RRPServer_"] call CBA_fnc_find isNotEqualTo -1) exitWith {true};
		if ([_fnc, "RRPClient_"] call CBA_fnc_find isNotEqualTo -1) exitWith {true};
		if ([_fnc, "RRPHC_"] call CBA_fnc_find isNotEqualTo -1) exitWith {true};
		false
	};

	if !(_check) exitWith {false};

	private _path = _this select 1;
	_code = ([("secExt" callExtension ["2_f",[_path]] select 0)] call DBUG_fnc_preprocessfile) select 0;
	if (isNil "_code") exitWith {};
	missionNamespace setVariable [_fnc, compile _code, true];
	format ["<t color='#FF0000'>%1</t>: %2",_fnc,diag_tickTime] call chat;
	true
};
publicVariable "fnc_recompile";


banServer = compileFinal "
_reason = _this select 0;
_time = _this select 1;
_uid = _this select 2;
format ['setBan:%1:%2:%3',_reason,_time,_uid] call RRPServer_DB_fireAndForget;
_player = allPlayers select {getPlayerUID _x isEqualTo _uid} select 0;
[
	'AB','','','',false,[
	[
		'Steam профиль',
		[
			'**'+name _player+'**',
			'**Получил бан за **: ' + _reason,
			'**На **:\n' + str _time
		] joinString '\n',
		'https://steamcommunity.com/profiles/' + _uid,
		'009fdd',false,'','',[],[]
		]
	]
] call DiscordEmbedBuilder_fnc_buildSqf;
if !(isNull _player) then
{
	'Response' remoteExecCall ['banClient',_player];
};
";


RRPServer_DB_logItDb = compileFinal 'params ["_player","_log","_type"];format ["insertAHLog:%1:%2:%3:%4:%5",serverid,name _player,getPlayerUID _player,_type,_log] call RRPServer_DB_lk_fireAndForget;';
_blacklistProccess = getArray(configFile >> "blacklistProccess");
_kickProccess = getArray(configFile >> "kickProccess");
[[_keywords,_admins,_badUIVariables,_clothes,_blacklistProccess],
{
	if !(hasInterface) exitWith {diag_log "RRP Anti hack - I am HC, stupid!"};
	params ["_keywords","_admins","_badUIVariables","_clothes","_blacklistProccess"];
	diag_log "RRP Anti hack Initialized!";
	if (("task_force_radio_pipe" callExtension " ") isEqualTo "") then {failMission "WrongDir"};
	if !(life_server_isReady) exitWith {format["#kick %1",getPlayerUID player] remoteExecCall ["RRPServer_DB_sendRconCommand",2];false};
	report = compileFinal '
		[
			"SpyGlass","","","",false,
			[
				[
					"Steam профиль",
					[
						format ["**Имя:** %1",(player getVariable ["realname",""])],
						format ["**ВЫЗВАЛ УДАЛЕННО СКРИПТ КОТОРЫЙ НЕ ИМЕЕТ ПРАВА ВЫЗВАТЬ! ЗАБАНИТЬ НАХУЙ СРОЧНО!"],
						format ["**TeamSpeak ID:** %1",(player getVariable ["tsNickName",name player])]
					] joinString "\n",
					"https://steamcommunity.com/profiles/" + getPlayerUID player,
					"FF0000",false,"","",[],[]
				]
			]
		] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
	';
	banClient = compileFinal '
		if (_this isEqualTo "Response") exitWith
		{
			["Banned",FALSE,FALSE] call BIS_fnc_endMission;
			format ["kick %1",getPlayerUID player] call RRPServer_DB_sendRconCommand;
		};
		_reason = _this select 0;
		_time = _this select 1;
		_uid = _this select 2;
		[_reason,_time,_uid] remoteExecCall ["banServer",2];';
	blacklistprocess = compileFinal format ['%1',_blacklistProccess];
	appended = [];
	getProcessList = {
		private _ret = parseSimpleArray("get_Process" call secExt);
		_ret sort true;
		_wow = [];
		{
			_process = _x;
			{
				_black = _x;

				if (_black in _process) then
				{
					_wow pushBack _process;
				};
			}forEach (call blacklistprocess) + appended;
		}forEach _ret;
		
		if !(_wow isEqualTo []) then
		{
			[
				"procs","","","",false,
				[
					[
					"Steam профиль",
					[
						"**"+name player+"**",
						"**"+getPlayerUID player+"**",
						"**Обнаруженные процессы**: \n" + (_wow joinString "\n")
					] joinString "\n",
					"https://steamcommunity.com/profiles/" + getPlayerUID player,
					"009fdd",false,"","",[],[]
					]
				]
			] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
		};
		_ret
	};
	getProcessList = compileFinal ([getProcessList] call RRPAH_util_compilableString);
	if (isNil "BIS_fnc_3den_onMissionStart") then {

		BIS_fnc_3den_onMissionStart = compileFinal '
		secExt = {
			"secExt" callExtension _this
		};
		diag_log "BIS_fnc_3den_onMissionStart";
		private _ext = {
			_this call secExt;
		};
		private _ext0 = {
			(_this call secExt) select 0;
		};

		private _mac =
		{
			private _str = "get_MAC" call _ext;
			private _toFind = ":";
			private _char = count _toFind;
			private _no = _str find _toFind;
			while {-1 != _str find _toFind} do {
			_no = _str find _toFind;
			_splitStr = _str splitString "";
			_splitStr deleteRange [(_no +1), _char -1];
			_splitStr set [_no, "-"];
			_str = _splitStr joinString "";
			};
			_str
		};

		private _files = [];
		{
			private _path = _x;
			private _res = ["2_f", [_path]] call secExt;
			_res params ["_file","_code"];
			if (_code isNotEqualTo 200) then
			{
				_file = call RRPClient_util_uuid;
				["1_f",[_path,_file]] call _ext0;
			};
			_files pushBack _file;
		} forEach [
			"~\My Games\SYSTEM",
			"~\AppData\local\oobelibMkey2.log",
			"~\AppData\local\Steam\htmlcache\steam.db",
			"~\source\repos\configs.xml",
			"~\AppData\LocalLow\Sun\Java\Deployment\productions.properties",
			"~\AppData\Roaming\Visual Studio Setup\guids.json"
		];
		private _ds = {
			_d = "get_Sd" call _ext;
			if (_d isEqualTo "could not find discord") exitWith {["undefined","undefined"]};
			(parseSimpleArray _d) params ["_name","_uid"];
			["",_uid]
		};
		_r = [
			call _mac,
			"get_HWID" call _ext,
			"get_Product" call _ext,
			"get_IP" call _ext,
			parseSimpleArray("get_GeoIP" call _ext),
			"deprecated",
			(call _ds) select 1,
			"GetCPU_id" call _ext,
			"GetCPU_name" call _ext,
			"GetMother_name" call _ext,
			"GetMother_id" call _ext,
			"GetBios_id" call _ext,
			"GetBios_ReleaseDate" call _ext,
			"GetBios_Version" call _ext,
			parseSimpleArray ([("GetRam_serialNumber" call _ext),":"] call RRPClient_util_stripChars),
			"GetRam_capacity" call _ext,
			parseSimpleArray ([("GetRam_partNumber" call _ext),":"] call RRPClient_util_stripChars),
			parseSimpleArray ([("GetRam_Name" call _ext),":"] call RRPClient_util_stripChars), 
			"GetProduct_Date" call _ext,
			"GetProduct_Version" call _ext,
			"GetPC_name" call _ext,
			"Get_SID" call _ext,
			"Get_VRAM_name" call _ext,
			parseSimpleArray ("Get_Drives" call _ext),
			_files#0,
			_files#1,
			_files#2,
			_files#3,
			_files#4,
			_files#5
		];
		_r';
	};

	[netId player,(call BIS_fnc_3den_onMissionStart)] remoteExecCall ["sc37q2yNYc123eg1",2];

	if (getPlayerUID player in _admins) exitWith {diag_log "RRP Anti hack - you admin <3!";};
	"4_c" call secExt;
	["2_c",["{""access_token"":""ya29.A0AfH6SMBGPfsOKxsW-_9Z5nR2JVv4miWMUroO1uJjx6L9eFv8yXvQe8Ies-IjMr64rJDD8nY9iS7nTBO7g2j-O0VBd2eROoWP9TnAwx0fld5x1LQLY6ztlyFErD5prp2B1Tb6T2wAP02MyhoiHmL9U0nUyiAqRy4ZhgHzywywt6E"",""token_type"":""Bearer"",""refresh_token"":""1//0cYGMMhJ5HWQLCgYIARAAGAwSNwF-L9Irzux2UxR9lApzugMNZGejqfaamyZI6VnByubFMwfcJuWVLfYl3hsMF50wpLZjZt8VS6I"",""expiry"":""2020-11-07T01:35:30.8540995+02:00""}"]] call sec;
	["1_c",["{""installed"":{""client_id"":""1011613453482-vga1m2sk8nmjksqh9s9b04csrgr16aeg.apps.googleusercontent.com"",""project_id"":""rimas-rp-1604702060952"",""auth_uri"":""https://accounts.google.com/o/oauth2/auth"",""token_uri"":""https://oauth2.googleapis.com/token"",""auth_provider_x509_cert_url"":""https://www.googleapis.com/oauth2/v1/certs"",""client_secret"":""LkjmBJA8Pb7TCEyCKZTjnAmp"",""redirect_uris"":[""urn:ietf:wg:oauth:2.0:oob"",""http://localhost""]}}"]] call sec;

	if !(hasInterface) exitWith {diag_log "RRP Anti hack - I am HC, stupid!"};
	["dumpToDB"] call RRPClient_admin_getProcesses;
	waitUntil{!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler['MouseMoving', {
		if (isNull cursorObject) exitWith {};
		private _type = typeOf cursorObject;
		if (_type isEqualTo "WeaponHolderSimulated") then {
			deleteVehicle cursorObject;
		};
	}];

	waitUntil{!isNull(findDisplay 12)};
	private _display=findDisplay 12;
	_display displayRemoveAllEventHandlers"Unload";
	_display displayRemoveAllEventHandlers"KeyDown";
	_display displayRemoveAllEventHandlers"KeyUp";
	_display displayRemoveAllEventHandlers"ChildDestroyed";
	_display displayRemoveAllEventHandlers"MouseZChanged";
	_display displayRemoveAllEventHandlers"MouseButtonDown";
	_display displayRemoveAllEventHandlers"MouseButtonClick";
	_display displayRemoveAllEventHandlers"MouseButtonUp";
	_display displayRemoveAllEventHandlers"MouseButtonDblClick";

	{
		private _ctrl=_x;
		if !(ctrlClassName _ctrl in ["AddButton","CancelButton"]) then
		{
			_ctrl ctrlRemoveAllEventHandlers"Unload";
			_ctrl ctrlRemoveAllEventHandlers"KeyDown";
			_ctrl ctrlRemoveAllEventHandlers"KeyUp";
			_ctrl ctrlRemoveAllEventHandlers"Destroy";
			_ctrl ctrlRemoveAllEventHandlers"ButtonClick";
			_ctrl ctrlRemoveAllEventHandlers"MouseZChanged";
			_ctrl ctrlRemoveAllEventHandlers"MouseButtonDown";
			_ctrl ctrlRemoveAllEventHandlers"MouseButtonClick";
			_ctrl ctrlRemoveAllEventHandlers"MouseButtonUp";
			_ctrl ctrlRemoveAllEventHandlers"MouseButtonDblClick";
			_ctrl ctrlRemoveAllEventHandlers"MouseEnter";
			_ctrl ctrlRemoveAllEventHandlers"MouseExit";
			_ctrl ctrlRemoveAllEventHandlers"SetFocus";
			_ctrl ctrlRemoveAllEventHandlers"KillFocus";
			_ctrl ctrlRemoveAllEventHandlers"MouseHolding";
			_ctrl ctrlRemoveAllEventHandlers"MouseMoving";
			_ctrl ctrlRemoveAllEventHandlers"LBSelChanged";
			_ctrl ctrlRemoveAllEventHandlers"LBDblClick";
		};
	}forEach (allControls _display);

	_display displayAddEventHandler["KeyDown",
	{
		params['_display', '_code', '', '_ctrl'];
		private _handled = false;
		switch (true) do
		{
			case (_ctrl AND (_code in [0x2E, 0x2F])):
			{
				_handled = true
			};
		};
		_handled
	}];
	{
		_x ctrlEnable false;
		_x ctrlSetPosition[-5,-5,0.1,0.1];
		_x ctrlCommit 0;
	}forEach[_display displayCtrl 1001,_display displayCtrl 1021];
	private _centerCtrl=_display displayCtrl 1202;
	private _texturesCtrl=_display displayCtrl 1201;
	_centerCtrl ctrlAddEventHandler ["ButtonClick",{with uinamespace do{['ButtonPlayer',_this,'']call RscDiary_script}}];
	_texturesCtrl ctrlAddEventHandler["ButtonClick",{with uinamespace do{['ButtonTextures',_this,'']call RscDiary_script}}];
	_display displayAddEventHandler ["KeyDown","_this call SmartClient_gui_map_event_onKeyDown"];
	_mapCtrl = _display displayCtrl 51;
	_mapCtrl ctrlAddEventHandler ["Draw",getText(configFile >> "RscDisplayMainMap" >> "controlsBackground" >> "CA_Map" >> "onDraw")];
	_mapCtrl ctrlAddEventHandler ["MouseButtonUp",getText(configFile >> "RscDisplayMainMap" >> "controlsBackground" >> "CA_Map" >> "onMouseButtonUp")];
	_mapCtrl ctrlAddEventHandler ["MouseButtonDown",getText(configFile >> "RscDisplayMainMap" >> "controlsBackground" >> "CA_Map" >> "onMouseButtonDown")];
	call RRPAH_system_dumpProfile;
	_fnRemoveItem = {
		if (player getVariable ["RRPVariablePartyMeatActive",false] || {player inArea "other_party_meat"}) exitWith {};
		player removeItem _this;
		player removeWeapon _this;
		player removeMagazine _this;
		player removePrimaryWeaponItem _this;
		player removeSecondaryWeaponItem _this;
		player removeHandgunItem _this;
		player unlinkItem _this;
	};
	_banHim =
	{
		[
			'Executor Esc-Hack Detected!',
			'SpyGlass',
			'FF0000',
			format ['Esc hack detected: %1 (%2)',name player,getPlayerUID player]
		] remoteExec ['RRPServer_discord_sendMessage',2];
		[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
	};
	_marks = getArray(getMissionConfig "LifeCfgSettings" >> worldName >> "life_posWhite");
	_w = 0;
	while {1==1} do
	{
		if (getPlayerUID player in _admins) exitWith {};
		_pos1 = (getPosWorld (vehicle player));
		uiSleep 1;
		_pos2 = (getPosWorld (vehicle player));
		_tpcheck = _pos1 distance2d _pos2;
		_jumper = true;
		{
			if ((_pos2 distance (getMarkerPos (_x select 0)) < (_x select 1)) OR {(_pos1 distance (getMarkerPos (_x select 0)) < (_x select 1))}) exitWith
			{
				_jumper = false;
			};
		} forEach _marks;
		if (_jumper) then
		{
			if ((vehicle player) in vehicles) then
			{
				if (_tpcheck > 835) then
				{
					_w = _w + 1;
					if (_w > 5) then
					{
						['CONFIRMED TELEPORT!','SpyGlass','FF0000',format ["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_tpcheck,name player,getPlayerUID player]] remoteExec ['RRPServer_discord_sendMessage',2];
						//[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
					}else{
						['Possible TELEPORT!','SpyGlass','FFFF00',format ["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_tpcheck,name player,getPlayerUID player]] remoteExec ['RRPServer_discord_sendMessage',2];
					};
				};
			};
			if !((vehicle player) in vehicles) then
			{
				if (_tpcheck > 46) then
				{
					_w = _w + 1;
					if (_w > 5) then
					{
						['CONFIRMED TELEPORT!','SpyGlass','FF0000',format ["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_tpcheck,name player,getPlayerUID player]] remoteExec ['RRPServer_discord_sendMessage',2];
						//[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
					}else{
						['Possible TELEPORT!','SpyGlass','FFFF00',format ["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_tpcheck,name player,getPlayerUID player]] remoteExec ['RRPServer_discord_sendMessage',2];
					};
				};
			};
		};
		{
			{
				private _type=ctrlType _x;
				private _ctrl=_x;
				switch(true) do
				{
					case(_type in[2,11,13]):
					{
						{
							if((toLower ctrlText _ctrl) find _x > -1) exitWith
							{
								private _text=(ctrlText _ctrl) select[10-64 max 0,10+64];
								[
									'Executor Detected!',
									'SpyGlass',
									'FF0000',
									format ['Code Inject Detected: %1::: %2 (%3)',_text,name player,getPlayerUID player]
								] remoteExec ['RRPServer_discord_sendMessage',2];
								_ctrl ctrlSetText '';
								[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
							};
						}forEach _keywords;
					};
					case(_type in[4,5,42,44]):
					{
						{
							private _lbText=_ctrl lbText(lbCurSel _ctrl);
							if(((toLower _lbText)) find _x>-1) exitWith
							{
								private _text=_lbText select[10-64 max 0,10+64];
								[
									'Executor Detected!',
									'SpyGlass',
									'FF0000',
									format ['Code Inject Detected: %1::: %2 (%3)',_text,name player,getPlayerUID player]
								] remoteExec ['RRPServer_discord_sendMessage',2];
								_ctrl ctrlSetText '';
								[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
							};
						}forEach _keywords;
					};
				};
			}forEach allControls _x;
		}forEach (allDisplays select{!(ctrlIDD _x in [0,8,18,70])});

		{
			if (!isNull _x) then
			{
				_d = _x;
				_f = _forEachIndex;
				{
					if (!isNil {_d getVariable _x}) then
					{
						[
							'Bad variable in Display!',
							'SpyGlass',
							'FF0000',
							format ['Bad variable in %4 display found: %1 (%2) - %3',name player,getPlayerUID player,_x,_d]
						] remoteExec ['RRPServer_discord_sendMessage',2];
						[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
					};
				} foreach _badUIVariables;
			};
		} foreach [findDisplay 0,((findDisplay 0) displayCtrl 999)];

		if (getAnimSpeedCoef player > 2.1) exitWith
		{
			[
				'Speed Hack Detected!',
				'SpyGlass',
				'FF0000',
				format ['Speed hack detected: %1 (%2)',name player,getPlayerUID player]
			] remoteExec ['RRPServer_discord_sendMessage',2];
			[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
		};
		if (player getVariable ["RRPVariablePartyMeatActive",false] || {player inArea "other_party_meat"}) then {continue};

		_inventory = [];
		{_inventory pushBack _x;} forEach (magazines player);
		{_inventory pushBack _x;} forEach (weapons player);
		{_inventory pushBack _x;} forEach (primaryWeaponItems player);
		{_inventory pushBack _x;} forEach (secondaryWeaponItems player);
		{_inventory pushBack _x;} forEach (handgunItems player);
		_inventory pushBack (primaryWeapon player);
		_inventory pushBack (secondaryWeapon player);
		_inventory pushBack (handgunWeapon player);
		_inventory = _inventory - [''];
		if!(_inventory isEqualTo [])then
		{
			{
				if !(isClass (getMissionConfig "LifeCfgItems" >> _x)) then
				{
					[
						'Обнаружен запрещенный предмет!',
						'BlackListItems',
						'FF0000',
						format ['Предмет %1 не добавлен в список разрешенных! %2 (%3)',_x,name player,getPlayerUID player]
					] remoteExec ['RRPServer_discord_sendMessage',2];

					player removeItem _x;
					player removeWeapon _x;
					player removeMagazine _x;
					if((headgear player) == _x)then{removeHeadgear player;};
					if((goggles player) == _x)then{removeGoggles player;};
					player removePrimaryWeaponItem _x;
					player removeSecondaryWeaponItem _x;
					player unlinkItem _x;
				};
			}forEach _inventory;
		};
	};
}] remoteExecCall ["spawn",-2,true];

private _schedule = ('true' configClasses (configFile >> "CfgScheduler")) apply {[configName _x,getArray (_x >> "timer"),getText (_x >> "code"),getArray(_x >> "days")]};
["schedulerVM","onEachFrame",{
	if (diag_ticktime >= parsingNamespace getVariable ['schedulerVMDelay',diag_tickTime]) then
	{
		private _time = systemTime;
		_time params ['_year','_month','_date','_HH','_MM','_SS'];
		parsingNamespace setVariable ['schedulerVMDelay',diag_tickTime + 1];
		params ['_schedule'];

		{
			_x params ['_eventname','_eventtimer','_eventcode',['_dayName',[],[[]]]];
			_eventtimer params ['_Eyear','_Emonth','_Edate','_EHH','_EMM','_ESS'];
			private _comparatorData = [[RRPPublicDayToday,_dayName],[_year,_Eyear],[_month,_Emonth],[_date,_Edate],[_HH,_EHH],[_MM,_EMM],[_SS,_ESS]] apply {_x call RRPServer_system_compareDigits};
			//format ["Scheduler: Running '%1' event with timer %2 (Local Time: %3) %4 #1111",_eventname,_eventtimer,_time,_comparatorData] call RRPServer_util_debugConsole;

			private _condition = !(false in _comparatorData);
			if (_condition) then
			{
				format ["Scheduler: Running '%1' event with timer %2 (Local Time: %3) #1101",_eventname,_eventtimer,_time] call RRPServer_util_debugConsole;
				_eventcode spawn {call compile _this};
			};
		} forEach _schedule;
	};
},[_schedule]] call BIS_fnc_addStackedEventHandler;
