/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_sessionId","_payload"];
_payload params ["_name","_tfar"];
try
{
	private _player = _sessionId call RRPServer_session_getPlayerObject;
	private _chars = getText(missionConfigFile >> "CfgGroups" >> "allowAlphabet");
	private _checkText = [_name,_chars] call RRPClient_util_containsForbiddenCharacter;
	if !(_checkText isEqualTo -1) throw 5;
	if (isNull _player) throw 1;
	private _uid = getPlayerUID _player;
	private _cost = getNumber(missionConfigFile >> "CfgGroups" >> "createGroupCost");
	if (_cost > (_player getVariable ["RRPAtm",0])) throw "У вас недостаточно средств для регистрации организации!";
	[_player,"take","atm",STR(_cost)] call RRPServer_system_moneyChange;
	private _res = format ["registerGroup:%1:%2:%3:%4",_name,_uid,getArray (missionConfigFile >> "CfgGroups" >> "defaultGroupTitles"),_tfar] call RRPServer_DB_insertSingle;
	private _hash =	[_name,_uid,[],8,"none",[],_tfar,[],[_uid,_player call getNickName,1],[],[]];
	missionNamespace setVariable [format["ServerGroupsInfo_%1",_res],_hash];
	[_sessionId,"registerResponse",[0,_hash]] call RRPServer_system_sendTo;
	_player setVariable ["GroupID",_res,true];
	_player setVariable ["GroupData",_hash];
	format ["setPlayerGroupLink:%1:%2",_res,getPlayerUID _player] call RRPServer_DB_fireAndForget;
}catch{
	format ["Group Error: Create: Throw: %1",_exception] call RRPServer_util_log;
	[_sessionId,"registerResponse",[_exception,[]]] call RRPServer_system_sendTo;
};
