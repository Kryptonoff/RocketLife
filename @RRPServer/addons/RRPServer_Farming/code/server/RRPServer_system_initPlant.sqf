/*
	Project: Aurora Role Play
	Filename: RRPServer_system_initPlant.sqf
	Author: МишаняНуНихуяСебе
	License: CC BY-ND
*/
params [
	["_plant",objNull,[objNull]],
	["_interval",0,[0]]
];

[_plant,"wateredTime",0] call CBA_fnc_setVarNet;
rrp_plants pushBack _plant;
private _config = (format ['getText(_x >> "model") isEqualTo "%1"', typeOf _plant]) configClasses (missionConfigFile >> "LifeCfgFarming");
if (_config isEqualTo []) exitWith {diag_log "INIT PLANT CONFIG []"};
private _configName = configName (_config select 0);

[_plant] call RRPServer_system_clearNoWater;

[{
	params ["_args", "_idPFH"];
	_args params [
		["_plant",objNull,[objNull]],
		["_interval",15,[0]],
		["_configName","",[""]]
	];
	if (isNull _plant) exitWith {[_idPFH] call CBA_fnc_removePerFrameHandler};//Удаляем цикл
	private _state = _plant getVariable ["growState",[]];
	if (_state isEqualTo []) exitWith {[_idPFH] call CBA_fnc_removePerFrameHandler};//Удаляем цикл
	_state params ["_curState","_totalState","_curGrowKoef","_growUp","_isWatered","_isFertilized"];

	//Когда растение полностью выросло
	if (_curState >= _totalState) exitWith {
		[{
			if (isNull _this) exitWith {};
			deleteVehicle _this;
		}, _plant,60 * 30] call CBA_fnc_waitAndExecute;
		[_idPFH] call CBA_fnc_removePerFrameHandler;
	};
	
	private _updateState = false;

	//Не дождик ли часом лёт ?
	if (rain >= 0.01 && {_isWatered <= 1}) then {
		diag_log format["RRPServer_farming_plantPlantae rain (%1)",rain];
		private _rain = call { 
			if (rain >= 0.5) exitWith {_isWatered + 1};   // за 1 цикл
			if (rain >= 0.2) exitWith {_isWatered + 0.6}; // за 2 цикл
			if (rain >= 0.1) exitWith {_isWatered + 0.3}; // за 3 цикла
			if (rain >= 0.06) exitWith {_isWatered + 0.15}; // за 4 цикла
			(_isWatered + 0.1) // за 5 цикла
		};
		
		if (_rain >= 1) then {
			_isWatered = 1; //Выравниваем перелив
		} else {
			_isWatered = _rain; //золотой дождик :)
		};
		
		diag_log format["RRPServer_farming_plantPlantae _isWatered (%1)",_isWatered];
		 
		_state set [4,_isWatered];
		
		_updateState = true;
	};
	
	//Пока растения получает хоть небольшое количество влаги оно будет рости но медлено
	if (_isWatered >= 0.1) then {
		_wateredTimeConfig = getNumber(missionConfigFile >> "LifeCfgFarming" >> _configName >> "wateringTime");
		diag_log _configName;
		_wateredTime = _plant getVariable ["wateredTime", 0];
		if (_wateredTime >= _wateredTimeConfig) then {
			_state set [4, 0];
			[_plant] call RRPServer_system_clearNoWater;
		} else {
			[_plant,"wateredTime",_wateredTime + _interval] call CBA_fnc_setVarNet;
		};

		_curGrowKoef = (_curGrowKoef * _isWatered);
		//Вычисления по росту
		_addValue = (_interval * _curGrowKoef);
		if (_isFertilized isEqualTo 0) then {_addValue = _addValue * 0.5};
		_curState = _curState + _addValue;
		_state set [0,_curState];
		_growUp = _growUp * _curGrowKoef;
		_pos = getPos _plant;
		if ((_pos # 2) <= 0) then {
			diag_log format["RRPServer_farming_plantPlantae _curGrowKoef (%1) | _growUp (%2) | _curState (%3)",_curGrowKoef,_growUp,_curState];
			//Рости наше ростенице рости ХD
			_plant setPos [_pos # 0, _pos # 1, (_pos # 2) + _growUp];
			// [_plant,[_pos # 0, _pos # 1, (_pos # 2) + _growUp]] remoteExec ["setPosATL", 0,_plant];
		};
		_updateState = true;
	};
	
	if (_updateState) then {
		// Обновлаем даные по ростению
		_plant setVariable ["growState",_state,true];
		diag_log format["RRPServer_farming_plantPlantae updateState growState:%1",_state];
	};
},_interval,[_plant,_interval,_configName]] call CBA_fnc_addPerFrameHandler;//пока каждые 10 сек
