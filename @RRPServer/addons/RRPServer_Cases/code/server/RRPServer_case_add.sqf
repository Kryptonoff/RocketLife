
params ["_uid","_caseType",["_days",30]];
try{
	if (_uid isEqualTo "") throw "Не определен игрок";
	if !(isClass (getMissionConfig "CfgCases" >> _caseType)) throw "Кейс не определен"; 
	format ["insertPlayerCase:%1:%2:%3",_uid,_caseType,_days] call RRPServer_DB_insertSingle;

	private _player =_uid call RRPClient_util_objectFromPlayerUID;
	if !(isNull _player) then {
		["Кейс",format["Вы получили <t color='#FFFFFF'>'%1'</t>, он доступен в течении %2 дней",getText(getMissionConfig "CfgCases" >> _caseType >> "displayName"),_days] ] remoteExecCall ["toastInfo",_player];	
	};
}catch{
	format ["CASE ERROR: %1",_exception] call RRPServer_util_debugConsole;
};
true