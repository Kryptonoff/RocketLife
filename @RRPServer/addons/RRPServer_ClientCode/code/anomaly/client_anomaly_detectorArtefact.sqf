disableSerialization;
private _detectorItem = param [0,"",[""]];

if (life_detectorArtefactActive) exitWith {
    ["FatumRscDetector"] call RRPClient_gui_DestroyRscLayer;
    [life_detectorArtefactPFH] call CBA_fnc_removePerFrameHandler;
    life_detectorArtefactActive = false;
    life_detectorArtefactPFH = -1;
    life_detectorSleep = 0;
    life_detectorLastBeep = 5;
    life_detectorTarget = objNull;
    titleText ["Детектор был выключен", "PLAIN DOWN"];

    if (_detectorItem in getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorArtefactItems") AND !(_detectorItem isEqualTo life_detectorArtefactItem)) then {
        [_detectorItem] call client_anomaly_detectorArtefact
    };
};



life_detectorArtefactItem = param [0,"",[""]];
if (life_detectorArtefactItem isEqualTo "") exitWith {};

private _display = uiNamespace getVariable ["FatumRscDetector",displayNull];
if (isNull _display) then {
    ["FatumRscDetector","PLAIN",1,false] call RRPClient_gui_CreateRscLayer;
    titleText ["Детектор включен", "PLAIN DOWN"];
    life_detectorArtefactActive = true;
    life_detectorSleep = 0;
    life_detectorLastBeep = 5;
    life_detectorTarget = objNull;
};

life_detectorArtefactPFH = [{
    params ["_args", "_pfhHandle"];
    _args params ["_types","_radius","_angle"];
    private _display = uiNamespace getVariable ["FatumRscDetector",displayNull];

    if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"] OR !life_detectorArtefactActive OR !([player, life_detectorArtefactItem] call client_system_hasItem) OR isNull _display) exitWith {
    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
    ["FatumRscDetector"] call RRPClient_gui_DestroyRscLayer;
    life_detectorArtefactActive = false;
    life_detectorArtefactItem = "";
    life_detectorArtefactPFH = -1;
    life_detectorSleep = 0;
    life_detectorLastBeep = 5;
    life_detectorTarget = objNull;
    titleText ["Детектор был выключен", "PLAIN DOWN"];
};

private _objects = player nearObjects ["EmptyDetector", _radius];
_objects = _objects select {
    !isNil {_x getVariable "anomaly_type"} &&
    {_x getVariable ["anomaly_type",""] != "Radiation"} &&
    {!(_x getVariable ["anomaly_cooldown",false])}
};
if !(_objects isEqualTo []) then {
    _objects = _objects apply {[_x distance player, _x]};
    _objects sort true;
    private _artefact = (_objects select 0) select 1;

    private _dir = getDir player;
    private _dirTo = (getPos player) getDir _artefact;
    private _detected =  acos ([sin _dir, cos _dir, 0] vectorCos [sin _dirTo, cos _dirTo, 0]) <= _angle / 2;
    [_detected,_artefact,_radius] call client_anomaly_detectorArtefactDetected;
} else {
    [false] call client_anomaly_detectorArtefactDetected;
};
},1,[
getArray (missionConfigFile >> "LifeCfgAnomaly" >> "Detector" >> life_detectorArtefactItem >> "detectTypes"),
getNumber (missionConfigFile >> "LifeCfgAnomaly" >> "Detector" >> life_detectorArtefactItem >> "detectRadius"),
getNumber (missionConfigFile >> "LifeCfgAnomaly" >> "Detector" >> life_detectorArtefactItem >> "detectAngle")
]] call CBA_fnc_addPerFrameHandler;
