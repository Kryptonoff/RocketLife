if (life_detectorAnomalyActive) exitWith {
	[life_detectorAnomalyPFH] call CBA_fnc_removePerFrameHandler;
	life_detectorAnomalyActive = false;
	life_detectorAnomalyItem = "";
	life_detectorAnomalyPFH = -1;
	titleText ["Детектор Аномалий был выключен", "PLAIN DOWN"];
};

life_detectorAnomalyItem = param [0,"",[""]];
if (life_detectorAnomalyItem isEqualTo "") exitWith {};
life_detectorAnomalyActive = true;
life_detectorSleep = 0;
life_detectorLastBeep = 5;

titleText ["Детектор Аномалий был включён", "PLAIN DOWN"];

life_detectorAnomalyPFH = [{
params ["_args", "_pfhHandle"];
_args params ["_types","_radius","_angle"];
if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"] OR {!life_detectorAnomalyActive} OR {!([player, life_detectorAnomalyItem] call client_system_hasItem)}) exitWith {
	[_pfhHandle] call CBA_fnc_removePerFrameHandler;
	life_detectorAnomalyActive = false;
	life_detectorAnomalyItem = "";
	life_detectorAnomalyPFH = -1;
	titleText ["Детектор Аномалий был выключен", "PLAIN DOWN"];
};

private _objects = player nearObjects ["EmptyDetector",26];
_objects = _objects select {
	!isNil {_x getVariable "anomaly_type"} &&
	{_x getVariable ["anomaly_type",""] != "Radiation"} &&
	{!(_x getVariable ["anomaly_cooldown",false])}
};

if !(_objects isEqualTo []) then {
	_objects = _objects apply {[_x distance player,_x]};
	_objects sort true;

	private _distance = (_objects # 0) # 0;
	private _artefact = (_objects # 0) # 1;
	private _sleep = (0.1 * _distance + (0.1 - (0.1 * 5)));

		if (_sleep < 0.1) then {
			_sleep = 0.1;
		} else {
			if (_sleep > 4) then {
			_sleep = 4;
			};
		};

	if ((CBA_missionTime - life_detectorLastBeep) >= _sleep) then {
		playSound "detector_1";
		life_detectorLastBeep = CBA_missionTime;
	};
};
},0.1,[
getArray (missionConfigFile >> "LifeCfgAnomaly" >> "Detector" >> life_detectorArtefactItem >> "detectTypes"),
getNumber (missionConfigFile >> "LifeCfgAnomaly" >> "Detector" >> life_detectorArtefactItem >> "detectRadius"),
getNumber (missionConfigFile >> "LifeCfgAnomaly" >> "Detector" >> life_detectorArtefactItem >> "detectAngle")
]] call CBA_fnc_addPerFrameHandler;
