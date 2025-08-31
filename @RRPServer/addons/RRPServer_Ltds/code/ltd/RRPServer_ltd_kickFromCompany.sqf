/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_kickedUID","",[""]],
	["_player",objNull,[objNull]],
	"_id"
];

try
{
	if(isNull _player) throw "Вас не существует??";
	_hash = missionNameSpace getVariable [format["ltdData_%1",_id],[]];
	_hash params ["_owner","_name","_bank","_members"];
	if (_hash isEqualTo []) throw "Family data is broken!";
	if (_kickedUID isEqualTo (_owner)) throw "Вы не можете уволить сами себя! Для начала передайте лидера!";
	if !((getPlayerUID _player) isEqualTo (_owner)) throw "Вы не руководитель компании!";
	
	_index = [_members,_kickedUID] call RRPClient_util_find;
	if (_index isEqualTo -1) throw "Он не состоите в компании!";
	
	_memberName = (_members select _index) select 0; 
	_members deleteAt _index;
	_hash set [3,_members];
	format["kickLTDsMember:%1", _kickedUID] call RRPServer_DB_fireAndForget;
	missionNameSpace setVariable [format["ltdData_%1",_id],_hash,true];

	_kickPlayer = _kickedUID call RRPClient_util_objectFromPlayerUid;
	if!(isNull _kickPlayer) then
	{	
		RRPClientLTDsData = [];
		(owner _kickPlayer) publicVariableClient "RRPClientLTDsData";
		["ErrorTitleOnly", [format["Вы были уволены с компании '%1'",_name]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_kickPlayer];
	};
	["SuccessTitleOnly", [format["%1 был уволены с вашей компании",_memberName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[] remoteExec ["RRPClient_ltd_updateLtdMenu",_player];
}
catch
{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
