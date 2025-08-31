if !(missionNamespace getVariable ["RRPServerVarAnomalyInit", false]) then {

    missionNamespace setVariable ["anomalyDebug",(getNumber(missionConfigFile >> "LifeCfgAnomaly" >> "debug") isEqualTo 1), true];
	anomalyHolder = [];
	anomalyList = [];
	anomalyZones = [];
	anomalyTeleportIDS = [];

	{
		_x params ["_marker","_radius","_distance","_count","_positionMarker","_markerSize","_markerDir"];

        private _marker = createMarker [_marker, _positionMarker];
        _marker setMarkerShape "ELLIPSE";
        _marker setMarkerSize _markerSize;
        _marker setMarkerDir _markerDir;
        _marker setMarkerAlpha 0;

		private _anomalyListTmp = [_marker,_radius,_distance,_count] call RRPHC_anomaly_getList;
        diag_log format ["_anomalyListTmp: %1",_anomalyListTmp];

		if !(_anomalyListTmp isEqualTo []) then {
			{_x call RRPHC_anomaly_create; nil} count _anomalyListTmp;
			anomalyList pushBack _anomalyListTmp;
			anomalyZones pushBack _marker;
		};
	} forEach (getArray(missionConfigFile >> "LifeCfgAnomaly" >> "Zones" >> "RRpMap" >> "positions"));

	publicVariable "anomalyHolder";
	publicVariable "anomalyList";
	publicVariable "anomalyZones";
	publicVariable "anomalyTeleportIDS";
};

[] spawn RRPHC_anomaly_vibros;

missionNamespace setVariable ["RRPServerVarAnomalyInit",true, true];
