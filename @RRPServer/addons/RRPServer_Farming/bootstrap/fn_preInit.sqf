/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

[
	"RRPServer_system_clearNoWater",
	"RRPServer_farming_createPugalo",
	"RRPServer_system_plantPlantae",
	"RRPServer_system_initPlant"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Farming\code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Farming\code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

[
	"RRPClient_farming_checkZone",
	"RRPClient_farming_destroyPlantae",
	"RRPClient_farming_fertilizePlantae",
	"RRPClient_farming_harvestPlantae",
	"RRPClient_farming_KeyDown",
	"RRPClient_farming_lookupPlantae",
	"RRPClient_farming_placePlant",
	"RRPClient_farming_placePugalo",
	"RRPClient_farming_drawEntities",
	"RRPClient_farming_plantPlantae",
	"RRPClient_farming_wateringPlantae"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Farming\code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Farming\code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};
true