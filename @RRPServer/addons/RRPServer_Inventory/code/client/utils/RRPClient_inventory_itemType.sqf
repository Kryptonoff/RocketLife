/*

	Filename: 	RRPClient_inventory_itemType.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
private _item = param [0, "", [""]];
switch (true) do {
	case (isClass (configfile >> "cfgweapons" >> _item)): {
		private _cfgItem = configfile >> "cfgweapons" >> _item;
		private _simulation = tolower gettext(_cfgItem >> "simulation");
		private _itemCategory = "Item";
		private _itemType =
		switch _simulation do {
			case "weapon":{
					_itemCategory = "Weapon";
					private _type = getnumber(_cfgItem >> "type");
					if (istext(_cfgItem >> "type")) then {_type = (_cfgItem >> "type") call BIS_fnc_parseNumberSafe};
					switch _type do {
						case 1;
						case 4;
						case 5;
						case 65536: {
							private _cursor = tolower gettext(_cfgItem >> "cursor");
							if (_cursor in ["", "emptycursor"]) then {
								_cursor = tolower gettext(_cfgItem >> "cursorAim");
							};
							if (_cursor == "") exitwith {
								_itemCategory = "VehicleWeapon";
								"Horn"
							};
							if (_type > 4) then {
								_itemCategory = "VehicleWeapon";
							};
							switch _cursor do {
								case "arifle": {"AssaultRifle"};
								case "bomb": {"BombLauncher"};
								case "cannon": {"Cannon"};
								case "gl": {"GrenadeLauncher"};
								case "laserdesignator": {"LaserDesignator"};
								case "mg": {"MachineGun"};
								case "missile": {"MissileLauncher"};
								case "mortar": {"Mortar"};
								case "rocket": {"RocketLauncher"};
								case "sgun": {"Shotgun"};
								case "throw": {"Throw"};
								case "smg": {"SubmachineGun"};
								case "srifle": {"SniperRifle"};
								default {
									switch _type do {
										case 1: {"Rifle"};
										case 4: {"Launcher"};
										case 65536: {"VehicleWeapon"};
										default {"UnknownWeapon"};
									};
								};
							};
						};
						case 2: {"Handgun"};
						case 4096: {
							_itemCategory = "Item";
							"LaserDesignator"
						};
						case 131072:{
							_itemCategory = "Item";
							private _infoType = getnumber(_cfgItem >> "itemInfo" >> "type");
							switch _infoType do {
								case 101: {"AccessoryMuzzle"};
								case 201: {"AccessorySights"};
								case 301: {"AccessoryPointer"};
								case 302: {"AccessoryBipod"};
								case 401: {"FirstAidKit"};
								case 605: {_itemCategory = "Equipment"; "Headgear"};
								case 619: {"Medikit"};
								case 620: {"Toolkit"};
								case 621: {"UAVTerminal"};
								case 701: {_itemCategory = "Equipment"; "Vest"};
								case 801: {_itemCategory = "Equipment"; "Uniform"};
								default {"UnknownEquipment"};
							};
						};
						default {"UnknownWeapon"};
					};
				};
			case "binocular": {"Binocular"};
			case "nvgoggles": {"NVGoggles"};
			case "itemcompass": {"Compass"};
			case "itemgps": {"GPS"};
			case "itemmap": {"Map"};
			case "itemminedetector": {"MineDetector"};
			case "itemradio": {"Radio"};
			case "itemwatch": {"Watch"};
			case "cmlauncher": {_itemCategory = "VehicleWeapon"; "CounterMeasuresLauncher"};
			default {"Unknown"};
		};
		[_itemCategory, _itemType]
	};
	case (isClass (configfile >> "cfgmagazines" >> _item)): {
		private _ammo = tolower gettext(configfile >> "cfgammo" >> gettext(configfile >> "cfgmagazines" >> _item >> "ammo") >> "simulation");
		private _itemCategory = "Magazine";
		private _itemType =
		switch _ammo do {
			case "shotboundingmine": {_itemCategory = "Mine"; "MineBounding"};
			case "shotbullet": {"Bullet"};
			case "shotcm": {"CounterMeasures"};
			case "shotdeploy": {"Artillery"};
			case "shotdirectionalbomb": {_itemCategory = "Mine"; "MineDirectional"};
			case "shotgrenade": {"Grenade"};
			case "shotilluminating": {"Flare"};
			case "shotlaser": {"Laser"};
			case "shotmine": {_itemCategory = "Mine"; "Mine"};
			case "shotmissile": {"Missile"};
			case "shotrocket": {"Rocket"};
			case "shotshell": {"Shell"};
			case "shotsmoke";
			case "shotsmokex": {"SmokeShell"};
			case "shotspread": {"ShotgunShell"};
			case "shotsubmunitions": {"Artillery"};
			default {"UnknownMagazine"};
		};

		[_itemCategory, _itemType]
	};
	case (isClass (configfile >> "cfgvehicles" >> _item)):{
		private _isBackpack = getnumber(configfile >> "cfgvehicles" >> _item >> "isBackpack");
		if (_isBackpack > 0) then {
			["Equipment", "Backpack"]
		} else {
			["", ""]
		}
	};
	case (isClass (configfile >> "cfgGlasses" >> _item)): {
		["Equipment", "Glasses"]
	};
	case (isClass (missionConfigFile >> "VirtualItems" >> _item)): {
		["VirtualItem", "VirtualItem"]
	};
	case ("recipe_" in _item): {
		["VirtualItem", "VirtualItem"]
	};
	default {
		["", ""]
	};
};