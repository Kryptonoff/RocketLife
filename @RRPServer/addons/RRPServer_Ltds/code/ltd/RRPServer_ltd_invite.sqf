/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params 
[
	["_id",0,[0]],
	["_netID","",[""]],
	["_player",objNull,[objNull]]
];

try
{
	if (isNull _player) throw "WHAAAT? #5424";
	if (_netID isEqualTo "") throw "WHAAAAT??? #7865";
	_invited = objectFromNetId _netID;
	if (isNull _invited) throw "С приглашаемым что-то не так? #6734";
	if (_id isEqualTo 0) throw "ID компании 0??? #2152";
	_hash = missionNamespace getVariable [format["ltdData_%1",_id],[]];
	if (_hash isEqualTo []) throw "Проблемы с компанией! #1657";
	_hash params ["_owner","_name","_bank","_members"];
	
	_invitedUID = getPlayerUID _invited;
	_invitedName = _invited call getNickName;
	_array = [_invitedName,_invitedUID];
	_members pushBackUnique _array;
	_hash set [3,_members];
	missionNamespace setVariable [format ["ltdData_%1",_id],_hash,true];
	format ["invitedLTDsMember:%1:%2",_id,_invitedUID] call RRPServer_DB_fireAndForget;
	
	["SuccessTitleOnly", [format["Вы были приняты в компанию '%1'! Поздравляем!",_name]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_invited];
	["SuccessTitleOnly", [format["Сервер одобрил вступление %1 в вашу компанию!",_invitedName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLTDsData = [_id,_name];
	(owner _invited) publicVariableClient "RRPClientLTDsData";
	
	[] remoteExec ["RRPClient_updateLtdMenu",_player];
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	["ErrorTitleOnly", ["Со вступлением в компанию что-то не так..."]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_invited];
};