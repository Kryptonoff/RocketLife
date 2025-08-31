/*
	Project: Aurora Role Play
	Filename: RRPClient_farming_checkZone.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
private _allPlantsCfg = "true" configClasses (missionConfigFile >> "LifeCfgFarming");
private _allPlants = _allPlantsCfg apply {getText(_x >> "model")};
private _allPlantsDistances = _allPlantsCfg apply {getNumber(_x >> "size")};
private _allPlantsHashmap = _allPlants createHashMapFromArray _allPlantsDistances;
private _nearestPlants = nearestObjects [getPosATL life_previewPlant, _allPlants, 5] - [life_previewPlant];

private _nearestPlant = _nearestPlants findIf {
	_plantClass = typeOf _x;
	_plantSize = _allPlantsHashmap get _plantClass;
	((getPosATL life_previewPlant) distance _x) < _plantSize;
};

private _pugaloConfig = "true" configClasses (missionConfigFile >> "LifeCfgPugalo");
private _pugaloModels = _pugaloConfig apply {getText(_x >> "model")};
private _pugaloRadiuses = _pugaloConfig apply {getNumber(_x >> "radius")};

private _maxRadius = _pugaloRadiuses select 0;
{if (_x > _maxRadius) then {_maxRadius = _x}} forEach _pugaloRadiuses;
private _nearestPugalos = nearestObjects [getPosATL life_previewPlant, _pugaloModels, _maxRadius];

private _playerUid = getPlayerUID player;
private _nearestPugalo = _nearestPugalos findIf {(_x getVariable ["owner", ""]) isNotEqualTo _playerUid};

_nearestPlant isEqualTo -1 AND _nearestPugalo isEqualTo -1