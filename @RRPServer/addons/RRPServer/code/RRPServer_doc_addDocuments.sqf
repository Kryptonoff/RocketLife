params [
	["_docClass","",[""]],
	["_docName","",[""]],
	["_docDescription","",[""]],
	["_docCountDay",0,[0]],
	["_docOwner","",["",[]]],
	["_docGive","",["",[]]]
];

try {
	if (_docClass isEqualTo "" OR _docName isEqualTo "" OR _docOwner isEqualTo "" OR _docGive isEqualTo "") throw "";

	private ["_docGiveName","_docGiveUid"];
	private _docGiveName = "SYSTEM";
	private _docGiveUid = "SYSTEM";

	if (_docGive isEqualType []) then {
		_docGiveName = _docGive # 0;
		_docGiveUid = _docGive # 1;
	} else {
		_docGive = objectFromNetId _docGive;
		_docGiveName = _docGive getVariable ["realname",""];
		_docGiveUid = getPlayerUid _docGive;
	};


	private ["_docOwnerName","_docOwnerUid"];
	if (_docOwner isEqualType []) then {
		_docOwnerName = _docOwner # 0;
		_docOwnerUid = _docOwner # 1;
	} else {
		_docOwner = objectFromNetId _docOwner;
		_docOwnerName = _docOwner getVariable ["realname",""];
		_docOwnerUid = getPlayerUid _docOwner;
	};


	private ["_docTime","_logText","_return","_docOwnerID"];
	 _docTime = switch (_docCountDay) do {
		case -1: {87600};
		case 0: {0};
		default {_docCountDay * 24};
	};

	_logText = format["Добавил игроку %1 (%2) документ %3 (%4)",_docOwnerName,_docOwnerUid,_docName,_docClass];
	diag_log _logText;

	format ["addDocuments:%1:%2:%3:%4:%5:%6:%7",_docOwnerUid,_docClass,_docName,_docDescription,_docTime,_docGiveUid,_docGiveName] call RRPServer_DB_insertSingle;
	_return = format["getDocuments:%1",_docOwnerUid] call RRPServer_DB_selectFull;



	if (!isNull _docOwner) then {
		_docOwnerID = owner _docOwner;
		[_return] remoteExecCall ["Client_documents_dataReceived",_docOwnerID];
	};

	true
} catch {
	diag_log format ["Server_system_addDocuments ERROR: %1",_exception];
};
