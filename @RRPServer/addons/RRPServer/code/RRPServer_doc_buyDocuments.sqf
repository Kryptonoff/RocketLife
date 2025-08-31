params [
	["_docOwner","",[""]],
	["_docShop","",[""]],
	["_docClass","",[""]]
];

diag_log format ["RRPServer_doc_buyDocuments ARGS: %1",_this];
if (_docOwner isEqualTo "" OR _docClass isEqualTo "") exitWith {};

private ["_docShop","_docName","_docTime","_ownerName","_ownerUid","_logText","_docOwnerObj"];
_docOwnerObj = objectFromNetId _docOwner;
_docShop = getText(missionConfigFile >> "LifeCfgDocumentsShop" >> _docShop >> "name");
_docName = getText(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "name");
_docTime = getNumber(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "expires");

_docTime = switch (_docTime) do {
	case -1 : {87600};
	case 0  :
	{
		private ["_nextRestart","_curTime"];
		_nextRestart = 0;
		_curTime = ((systemTime # 3) * 60) + (systemTime # 4);
		{
			if (_curTime < _x) exitWith {_nextRestart = _x - _curTime};
		} forEach [240,480,720,960,1200,1440];
		_nextRestart * 60
	};
	default {_docTime * 24};
};

_ownerName = _docOwnerObj getVariable ["realname",""];
_ownerUid = getPlayerUid _docOwnerObj;

_logText = format["Приобрёл документ %1 (%2) в магазине",_docName,_docClass];
diag_log _logText;

format["buyDocuments:%1:%2:%3:%4:%5:%6",_docClass,_docName,_docTime,"SYSTEM",_docShop,_ownerUid] call RRPServer_DB_insertSingle;
private _return = format["getDocuments:%1",_ownerUid] call RRPServer_DB_selectFull;
format ["buyDocs:  %1",_logText];

[_return] remoteExecCall ["Client_documents_dataReceived",_docOwnerObj];

true
