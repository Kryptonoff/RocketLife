

private ["_changeApplicants","_index"];
params [
	["_register",true,[true]],
	["_resource","",[""]]
];

_player = remoteExecutedOwner call RRPServer_util_get_RE_player;

try{
	if (isNull _player) throw "Вы не определены, попробуйте позже";
	private _groupId = _player getVariable ["GroupId",-1];
	if (_groupId isEqualTo -1) throw "У вас нет доступа";
	private _groupHash = missionNamespace getVariable [format["ServerGroupsInfo_%1",_groupId],createHashMap];
	if (count _groupHash isEqualTo 0) throw "Данные организации повреждены";
	private _captures = enabledCaptures select ([enabledCaptures,_resource] call RRPClient_util_find);
	_captures params ["_objectString","_procName","_groupOwner", ["_groupName",""],"_earned","_applics","_nextBattle","_captured", "_applicantsNames","_applicantsIDs"];
	if (_register) then 
	{
		if (_groupId in _applicantsIDs) throw "Вы уже зарегистрировались";
		_captures pushBack [_groupHash select 1, _groupId];
	}else{
		(_captures select 5) deleteAt (([(_captures select 5),_groupId] call RRPClient_util_find)); 
	};
	format ["manageCaptures:%1:%2",_captures select 5,_resource] call RRPServer_DB_fireAndForget;
	[] remoteExecCall ["RRPClient_resource_capture_Menu",_player];
	call RRPServer_resource_capture_loadEnabledCaptures;

}catch{
	["ErrorTitleAndText",["Битва за ресурс", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
true
