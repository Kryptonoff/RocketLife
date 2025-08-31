/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
rrp_plants = [];

private _plantsFromDB = "loadPlants" call RRPServer_DB_selectFull;
{
	_x params ["_classname", "_position", "_growOwner", "_plantClass", "_curState", "_totalState", "_curGrowKoef", "_growUp", "_isWatered", "_isFertilized"];

	private _plant = _classname createVehicle [0,0,0];
	waitUntil {!isNull _plant};
	diag_log format["RRPServer_farming_plantPlantae _plant %1",_plant];
	_plant setPosWorld _position;
	_plant enableDynamicSimulation false;
	_plant enableSimulationGlobal false;

	[_plant,"growState", [_curState,_totalState,_curGrowKoef,_growUp,_isWatered,_isFertilized]] call CBA_fnc_setVarNet;
	[_plant,"growOwner", _growOwner] call CBA_fnc_setVarNet;
	[_plant,"plantClass", _plantClass] call CBA_fnc_setVarNet;

	[_plant, 30] call RRPServer_system_initPlant;
} forEach _plantsFromDB;

"deletePlants" call RRPServer_DB_fireAndForget;

private _pugaloFromDB = "loadPugalo" call RRPServer_DB_selectFull;
{
	_x params ["_owner", "_pugaloClass", "_position", "_dateEnd"];

	private _classname = getText(missionConfigFile >> "LifeCfgPugalo" >> _pugaloClass >> "model");
	private _pugalo = _classname createVehicle _position;

	[_pugalo,"owner", _owner] call CBA_fnc_setVarNet;
	[_pugalo,"dateEnd", _dateEnd] call CBA_fnc_setVarNet;
	[_pugalo,"class", _pugaloClass] call CBA_fnc_setVarNet;
} forEach _pugaloFromDB;

"deletePugalo" call RRPServer_DB_fireAndForget;

true