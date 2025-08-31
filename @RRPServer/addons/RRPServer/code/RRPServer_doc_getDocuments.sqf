
params [
	["_uid","",[""]],
	["_unit","",[""]]
];

if (_uid isEqualTo "") exitWith {diag_log "RRPServer_doc_getDocuments: ERROR Argument"};

private _queryResult = format["getDocuments:%1",_uid] call RRPServer_DB_selectFull;
diag_log format ["_queryResult document %1",_queryResult];

_unit =  objectFromNetId _unit;
if (_unit isEqualType ObjNull && {!isNull _unit}) exitWith {
    [_queryResult] remoteExecCall ["Client_documents_dataReceived",owner _unit];
};
_queryResult
