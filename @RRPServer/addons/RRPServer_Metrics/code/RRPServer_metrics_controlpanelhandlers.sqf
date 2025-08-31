'[RRPServer_Metrics]: Control Panel loaded. ~0101' call RRPServer_util_debugConsole;
addMissionEventHandler["HandleDisconnect", {
    params["_unit", "_id", "_uid", "_name"];
    private _connectionLog = parsingNamespace getVariable['connectionLog', []];
    private _data = [(allVariables _unit) apply {
        [_x, _unit getVariable _x]
    }, getUnitLoadout _unit, getPos _unit, mapGridPosition _unit];
    _connectionLog pushBack[_name, _uid, false, diag_tickTime, _data];
    parsingNamespace setVariable['connectionLog', _connectionLog];
}];
addMissionEventHandler["PlayerConnected", {
    params["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    private _connectionLog = parsingNamespace getVariable['connectionLog', []];
    private _connectionHistory = parsingNamespace getVariable['connectionHistory', []];
    private _isUnique = !(_uid in _connectionHistory);
    if (_isUnique) then {
        private _uniqueVisitors = parsingNamespace getVariable['uniqueVisitors', 0];
        _uniqueVisitors = _uniqueVisitors + 1;
        parsingNamespace setVariable['uniqueVisitors', _uniqueVisitors];
    };
    _connectionLog pushBack[_name, _uid, true, diag_tickTime];
    parsingNamespace setVariable['connectionLog', _connectionLog];
    _connectionHistory pushBackUnique _uid;
    parsingNamespace setVariable['connectionHistory', _connectionHistory];
    private _playersPeak = parsingNamespace getVariable['playersPeak', 0];
    if (count allPlayers >= _playersPeak) then {
        parsingNamespace setVariable['playersPeak', (count allPlayers) + 1];
    };
}];
0 spawn {
    scriptName "CPSTimelineManager";
    while {true} do {
        private _timeLine = parsingNamespace getVariable['CPSTimeline', []];
        _timeLine pushBack[diag_fps, diag_tickTime];
        parsingNamespace setVariable['CPSTimeline', _timeLine];
        uiSleep 60;
    };
};