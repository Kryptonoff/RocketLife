/*

	Filename:	RRPClient_inventory_getItemName.sqf
	Project:	Fatum Stalker
	Author:		Arhim
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
switch (true) do {
	case (isClass (missionConfigFile >> "VirtualItems" >> _this)): {(getText (missionConfigFile >> "VirtualItems" >> _this >> "displayName"))};
	case (isClass (configFile >> "CfgWeapons" >> _this)): {getText (configFile >> "CfgWeapons" >> _this >> "displayName")};
	case (isClass (configFile >> "CfgMagazines" >> _this)): {getText (configFile >> "CfgMagazines" >> _this >> "displayName")};
	case (isClass (configFile >> "CfgGlasses" >> _this)): {getText (configFile >> "CfgGlasses" >> _this >> "displayName")};

	default {getText (configFile >> "CfgVehicles" >> _this >> "displayName")};
};