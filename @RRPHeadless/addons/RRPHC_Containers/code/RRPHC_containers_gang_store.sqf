/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params [
	"_sessionId",
	"_box",
	"_action",
	["_item","",["",[]]],
	"_num"
];

try
{
	switch (_action) do
	{
		case "check": {
			_player = _sessionId call RRPServer_session_getPlayerObject;
			if (isNull _player) throw "Вы существуете?";
			if (isNull _box) throw "Ящик не определен";
			if !(owner _player isEqualTo remoteExecutedOwner) throw "Чего чего чего?";
			
			_boxInventory = _box getVariable ["inventory",[[],0]];
			_boxInventory params ["_containerItems","_containerWeight"];
			_indexH = [_item,_containerItems] call RRPClient_system_index;
			["response",_item,_num] remoteExecCall ["RRPClient_containers_gang_store",remoteExecutedOwner];
		};
		case "save": {
			format ["ContainersStore: Saved %1 #0101",_box] call RRPServer_util_debugConsole;
			_box setVariable ["inventory",[_item,_num],true];
			[netId _box] call RRPServer_containers_gang_UpdateDB;
			["success"] remoteExecCall ["RRPClient_containers_gang_store",remoteExecutedOwner];
		};
	};
}catch{
	format ["ContainersStore: %1 #1001",_exception] call RRPServer_util_debugConsole;
	["error",objNull,_exception] remoteExecCall ["RRPClient_containers_gang_store",remoteExecutedOwner];
};
true
