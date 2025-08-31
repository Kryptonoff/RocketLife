/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_player",objNull,[objNull]],
	["_id",0,[0]]
];
private _store = missionNamespace getVariable [format["ltdData_%1",_id],[]];
_store params ["_owner","_name","_bank","_members"];
try
{
	if (isNull _player) throw "Эй, ты как, черт побери, это сделал???";
	if !(_owner isEqualTo getPlayerUID _player) throw "Не вы создавали, не вам и уничтожать!";

	{
		if (_x getVariable ["ltdOwner",0] isEqualTo _id) then
		{
			deleteVehicle _x;
		};
	}
	forEach allMissionObjects "LtdsStore";
	missionNamespace setVariable [format["ltdData_%1",_id],nil,true];
	deleteMarker format ["LTDStore_%1",_id];
	format ["deleteAllLtdData:%1",_id] call RRPServer_DB_fireAndForget;
	
	{
		if ((getPlayerUID _x) in _members) then
		{
			[_name] remoteExecCall ["RRPClient_ltd_abolishConfirm",_x];
		};
	}
	forEach allPlayers;
	[format ["Игрок %1 (%2) упразднил компанию %3 ID:%4",name _player, _uid, _name,_id], "LTD_Logs"] call RRPServer_system_logIt;
}catch{
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	RRPClientLtdWaitResponse = false;
	(owner _player) publicVariableClient "RRPClientLtdWaitResponse";
};
