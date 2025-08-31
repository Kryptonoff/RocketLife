/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params 
[
	["_id",0,[0]],
	["_player",objNull,[objNull]]
];

try
{
	if (isNull _player) throw "WHAAAT?";
	if (_id isEqualTo 0) throw "WHAAAAAAAAAT?";
	_hash = missionNamespace getVariable [format ["ltdData_%1",_id],[]];
	if (_hash isEqualTo []) throw "С ООО какие-то проблемы...";
	_hash params ["_owner","_name","_bank","_members"];
	if (_uid isEqualTo _owner) throw "Назначьте сначала своего преемника!";
	_uid = getPlayerUID _player;
	_index = [_members,_uid] call RRPClient_util_find;
	if (_index isEqualTo -1) throw "Хм, вас не нашли в компании...";
	_members deleteAt _index;
	_hash set [3,_members];
	missionNamespace setVariable [format["ltdData_%1",_id],_hash,true];
	format ["kickLTDsMember:%1",_uid] call RRPServer_DB_fireAndForget;
	
	RRPClientLTDsData = [];
	(owner _player) publicVariableClient "RRPClientLTDsData";
	["SuccessTitleOnly", [format["Вы покинули компанию '%1'! Спасибо за сотрудничество!",_name]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};