private _detectorItem = param [0,"",[""]];

if (life_detectorRadimetrActive) exitWith {
	[life_detectorRadimetrPFH] call CBA_fnc_removePerFrameHandler;
	[false] call client_anomaly_detectorRadimetrShow;
	life_detectorRadimetrActive = false;
	life_detectorRadimetrPFH = -1;
	titleText ["Радиметр был выключен", "PLAIN DOWN"];
	if (_detectorItem in (getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorRadimetrItems")) AND !(life_detectorRadimetrItem isEqualTo _detectorItem)) then {
		[_detectorItem] call client_anomaly_detectorRadimetr;
	};
};

life_detectorRadimetrItem = _detectorItem;
if (life_detectorRadimetrItem isEqualTo "") exitWith {};
if !(life_detectorRadimetrItem in getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorRadimetrItems")) exitWith {};
life_detectorRadimetrActive = true;
[true] call client_anomaly_detectorRadimetrShow;

life_radimetrSound = "";
life_radimetrSoundSleep = 0;
life_radimetrSoundLast = 15;

titleText ["Радиметр был включён", "PLAIN DOWN"];

life_detectorRadimetrPFH = [{
if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"] OR !life_detectorRadimetrActive OR !([player,life_detectorRadimetrItem] call client_system_hasItem)) exitWith {
	[life_detectorRadimetrPFH] call CBA_fnc_removePerFrameHandler;
	[false] call client_anomaly_detectorRadimetrShow;
	life_detectorRadimetrActive = false;
	life_detectorRadimetrItem = "";
	life_detectorRadimetrPFH = -1;
	if !(player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) then {
		titleText ["Радиметр был выключен", "PLAIN DOWN"];
	};
};

private _rTerrain = life_radiationTerrain;

call {
	if (_rTerrain > 0 && {_rTerrain <= 10}) exitWith {
		life_radimetrSound = "geiger_level_0";
		life_radimetrSoundSleep = 15;
	};
	if (_rTerrain > 10 && {_rTerrain <= 20}) exitWith {
		life_radimetrSound = "radiation1";
		life_radimetrSoundSleep = 5;
	};
	if (_rTerrain > 20 && {_rTerrain <= 35}) exitWith {
		life_radimetrSound = "geiger_level_1";
		life_radimetrSoundSleep = 3;
	};
	if (_rTerrain > 35 && {_rTerrain <= 55}) exitWith {
		life_radimetrSound = "geiger_level_2";
		life_radimetrSoundSleep = 3;
	};
	if (_rTerrain > 55) exitWith {
		life_radimetrSound = "geiger_level_3";
		life_radimetrSoundSleep = 3;
	};
	life_radimetrSound = "";
	life_radimetrSoundSleep = 0;
};

if ((CBA_missionTime - life_radimetrSoundLast) >= life_radimetrSoundSleep && {_rTerrain > 0}) then {
	private _sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
	if !(isNull _sound) then {
		deleteVehicle _sound;
	};
	playSound life_radimetrSound;
	life_radimetrSoundLast = CBA_missionTime;
};
},0.5] call CBA_fnc_addPerFrameHandler;
