/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params 
[
	["_toLead","",[""]],
	["_player",objNull,[objNull]],
	["_id",0,[0]]
];

try
{
	if (isNull _player) throw "Вас не существует??";
	if (_toLead isEqualTo "") throw "Вы никого не выбрали?";
	_hash = missionNameSpace getVariable [format["ltdData_%1",_id],[]];
	if (_hash isEqualTo []) throw "С компанией какие-то проблемы...";
	_hash params ["_owner","_name","_bank","_members"];
	
	if (_toLead isEqualTo _owner) throw "Вы и так руководитель компании!";
	if !(getPlayerUID _player isEqualTo _owner) throw "Вы не можете назначить руководителя!";
	
	_hash set [0,_toLead];
	missionNameSpace setVariable [format ["ltdData_%1",_id],_hash,true];
	
	_newLead = _toLead call RRPClient_util_objectFromPlayerUid;
	if !(isNull _newLead) then
	{
		["SuccessTitleOnly", [format ["Поздравляем! Вы были назначены руководителем компании '%1'!",_name]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_newLead];
	};
	format ["setNewLeader:%1:%2",_toLead,_id] call RRPServer_DB_fireAndForget;
	[] remoteExec ["RRPClient_ltd_updateLtdMenu",_player];
	
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
