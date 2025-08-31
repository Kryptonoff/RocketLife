/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	["_uid","",[""]],
	["_ltdName","",[""]],
	["_player",objNull,[objNull]]
];

try
{
	if (_uid isEqualTo "") throw true;
	if (_ltdName isEqualTo "") throw true;
	if (isNull _player) throw true;
	
	_id = format ["regLtd:%1:%2",_uid,_ltdName] call RRPServer_DB_insertSingle;
	[true,[_id,_ltdName,0]] remoteExecCall ["RRPClient_ltd_regActionDone",_player];
	format ["setAccountLTDLink:%1:%2",_id,_uid] call RRPServer_DB_fireAndForget;
	missionNamespace setVariable [format ["ltdData_%1",_id],[_uid,_ltdName,0,[[_player call getNickName,_uid]]],true];
}catch{
	"Ltd - fail in params" call RRPServer_util_log;
	[false,"Ошибка 5541, обратитесь к администратору"] remoteExecCall ["RRPClient_ltd_regActionDone",_player];
};