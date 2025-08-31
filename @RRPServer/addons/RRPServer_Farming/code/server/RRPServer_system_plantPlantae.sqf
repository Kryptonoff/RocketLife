/*
	Project: Aurora Role Play
	Filename: RRPServer_system_plantPlantae.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
params [
	["_player",objNull,[objNull]],
	["_donator",0,[0]],
	["_seed","",[""]],
	["_pos",[],[[]]]
];

if (isNull _player || _netId isEqualTo "" || _seed isEqualTo "" || _pos isEqualTo []) exitWith {diag_log "Error Argument RRPServer_farming_plantPlantae";};

private _model = getText(missionConfigFile >> "LifeCfgFarming" >> _seed >> "model");
private _ground = getNumber(missionConfigFile >> "LifeCfgFarming" >> _seed >> "ground");

private _plant = _model createVehicle [0,0,0];
waitUntil {!isNull _plant};
diag_log format["RRPServer_farming_plantPlantae _plant %1",_plant];
_plant setPos [_pos # 0,_pos # 1,_pos # 2 - _ground];
_plant enableDynamicSimulation false;
_plant enableSimulationGlobal false;

private _time = getNumber(missionConfigFile >> "LifeCfgFarming" >> _seed >> "time");
private _extraTime = getNumber(missionConfigFile >> "LifeCfgFarming" >> _seed >> "extraTime");
private _totalState = _time + (round(random _extraTime)); // Накидываем фактр рандома
private _interval = 30; // Интервал (в секунду) чем меньше тем пловнее растет растение, чем больше тем меньше нагрузка
private _growUp = (_ground / _totalState) * _interval; // Проростание за одну итарацию
private _curGrowKoef = switch (_donator) do {
	case (1): {1.15};
	case (2): {1.25};
	case (3): {1.4};
	case (4): {1.6};
	case (5): {1.8};
	default {1}
};
private _curState = 0;
private _isWatered = 0; // Полито ли оно
private _isFertilized = -1; // Нет нужде в удобрении
if (getNumber(missionConfigFile >> "LifeCfgFarming" >> _seed >> "fertilizer") isEqualTo 1) then {
	_isFertilized = 0; //Нужно удобрять
};

[_plant,"growState",[_curState,_totalState,_curGrowKoef,_growUp,_isWatered,_isFertilized]] call CBA_fnc_setVarNet;
[_plant,"growOwner",getPlayerUID _player] call CBA_fnc_setVarNet;
[_plant,"plantClass", _seed] call CBA_fnc_setVarNet;

[_plant, _interval] call RRPServer_system_initPlant;