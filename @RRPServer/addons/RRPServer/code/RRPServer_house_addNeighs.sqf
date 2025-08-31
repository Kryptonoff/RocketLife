/**
	File: RRPServer_house_addNeighs
	Project: Aurora Role Play
	Author: FairyTale
*/

params ["_netIDH","_netIDP","_netIDPT"];
_house = objectFromNetId _netIDH;
_playerObject = objectFromNetId _netIDP;
_playerAddObject = objectFromNetId _netIDPT;
try 
{
	if (isNull _playerObject) throw "Player (owner) object not found.";
	if (isNull _house) throw "House object not found."; 
	if (isNull _playerAddObject) throw "Player (to be added) object not found.";
	
	_currentNeighs = _house getVariable ["Neighs", []];
	
	if (4 <= count _currentNeighs) throw "Некуда заселить";
	if (_playerObject isEqualTo _playerAddObject) throw "Пытаетесь прописать себя же?";
	
	_territoryOwnerUID = _house getVariable ["house_owner", []];
	if ((_territoryOwnerUID select 0) isEqualTo (getPlayerUID _playerAddObject)) throw "Собственник и так имеет все необходимые права";
	_playerToBeAddedUID = getPlayerUID _playerAddObject;
	if (_playerToBeAddedUID in _currentNeighs) throw "Этот житель уже прописан";
	_house_id = _house getVariable ["house_id", -1];
	if (_house_id isEqualTo -1) throw "Что ты сделал чтобы это увидеть???";
	
	_currentNeighs pushBack _playerToBeAddedUID;
	_house setVariable ["Neighs", _currentNeighs, true];
	format["updateNeighsHouse:%1:%2", _currentNeighs, _house_id] call RRPServer_DB_fireAndForget;
	["SuccessTitleAndText",["Мой дом",format ["Житель был добавлен!"]]] remoteExecCall ["toast",_playerObject];
	["SuccessTitleAndText",["Мой дом",format ["Вы были добавлены как со-житель в дом %1!",(_house getVariable ["house_name",""])]]] remoteExecCall ["toast",_playerAddObject];
	
	_house remoteExecCall ["RRPClient_houses_invitedPlayerResponse",_playerAddObject];
	
}
catch 
{
	["ErrorTitleAndText",["Мой дом",_exception]] remoteExecCall ["toast",_playerObject];
	_exception call RRPServer_util_log;
};
true