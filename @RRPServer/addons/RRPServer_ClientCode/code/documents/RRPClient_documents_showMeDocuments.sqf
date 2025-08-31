
private _unit = remoteExecutedOwner;
if !(_unit in [0, -2]) exitWith {};
[player,life_documentsData] remoteExec ["RRPClient_documents_showDocs", _unit];
