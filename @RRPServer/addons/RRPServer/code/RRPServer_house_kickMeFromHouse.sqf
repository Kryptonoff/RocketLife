/**
	File: RRPServer_house_removeNeighs
	Project: Aurora Role Play
	Author: FairyTale
*/

params ["_netIDH","_netIDP"];
_house = objectFromNetId _netIDH;
_playerObject = objectFromNetId _netIDP;
_playerToUID = getPlayerUID _playerObject;
try 
{
	if (isNull _playerObject) throw "Ват ват ват???";
	if (isNull _house) throw "Дома же не существует!";
	_houseID = _house getVariable ["house_id", -1];
	if (_houseID isEqualTo -1) throw "Что ты сделал чтобы это увидеть???";
	_ownerUID = _house getVariable ["house_owner", []];
	if (_playerToUID isEqualTo (_ownerUID select 0)) throw "Лучше продайте дом, хоть что-то получите";
	_neighs = _house getVariable ["Neighs", []];
	
	_neighs = _neighs - [_playerToUID];
	_house setVariable ["Neighs", _neighs, true];
	format["updateNeighsHouse:%1:%2", _neighs, _houseID] call RRPServer_DB_fireAndForget;
	
	_house remoteExecCall ["RRPClient_houses_kickedPlayerResponse",_playerObject];
	["InfoTitleAndText",["Мой дом",format["Вы ушли с дома '%1'",(_house getVariable ["house_name",""])]]] remoteExecCall ["toast",_playerObject];
}
catch 
{
	["ErrorTitleAndText",["Мой дом",_exception]] remoteExecCall ["toast",_playerObject];
	_exception call RRPServer_util_log;
};
true