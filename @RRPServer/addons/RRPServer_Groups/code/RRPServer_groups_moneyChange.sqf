/*
	Project: Aurora Role Play
	Author: FaityTale5571
	License: CC BY-ND

	Tuto:
		- Group ID
		- Mode Add, Take, Set
		- Scalar
*/

params [
	"_id",
	"_mode",
	"_scalar"
];

try{
	_hash = missionNamespace getVariable [format["ServerGroupsInfo_%1",_id],createHashMap];
	if (count _hash isEqualTo 0) throw format ["Отсутствует группа с ID %1!",_id];
	_bank = _hash getOrDefault ["bank",0];
	private _limit = getNumber(getMissionConfig "CfgGroups" >> "limitDeposit");
	switch _mode do 
	{
		case "add": {
			
			if (_bank + _scalar > _limit) then {
				if (isRemoteExecuted) then {
					["Организация","Счет организации переполнен!"] remoteExecCall ["toastError",remoteExecutedOwner];
				};
				throw format ["Счет организации переполнен!"];
			};
			
			
			format ["В организацию %4 добавлено $%1 + %2 = $%3",[_bank] call RRPClient_util_numberText,[_scalar] call RRPClient_util_numberText,[_bank + _scalar] call RRPClient_util_numberText,_id] call RRPServer_util_debugConsole;
			_bank = _bank + _scalar;
			_hash set ["bank",_bank];
			missionNamespace setVariable [format["ServerGroupsInfo_%1",_id],_hash];
			format ["setGroupBank:%1:%2",_bank,_id] call RRPServer_DB_fireAndForget;
			_id call RRPServer_groups_updateClients;
		};
		case "take": {			
			format ["В организацию %4 отнято $%1 - %2 = $%3",[_bank] call RRPClient_util_numberText,[_scalar] call RRPClient_util_numberText,[_bank - _scalar] call RRPClient_util_numberText,_id] call RRPServer_util_debugConsole;
			_bank = _bank - _scalar;
			_hash set ["bank",_bank];
			missionNamespace setVariable [format["ServerGroupsInfo_%1",_id],_hash];
			format ["setGroupBank:%1:%2",_bank,_id] call RRPServer_DB_fireAndForget;
			_id call RRPServer_groups_updateClients;
		};
		case "set": {
			format ["В организацию %4 установлено %1",[_scalar] call RRPClient_util_numberText,_id] call RRPServer_util_debugConsole;
			_hash set ["bank",_scalar];
			missionNamespace setVariable [format["ServerGroupsInfo_%1",_id],_hash];
			format ["setGroupBank:%1:%2",_scalar,_id] call RRPServer_DB_fireAndForget;
			_id call RRPServer_groups_updateClients;
		};
	};
}catch{
	_log = format ["%1 - %2",_fncScriptName,_exception];
	_log call RRPServer_util_debugConsole;
	_log call RRPServer_util_log;
};
true
