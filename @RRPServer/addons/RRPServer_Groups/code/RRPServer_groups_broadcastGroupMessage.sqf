/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_clanHash","_members","_sessionID", "_parameters", "_player", "_clanID", "_clanHash"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вы не существуете! :)";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не являетесь членом организации!";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	_members = _clanHash call RRPClient_groups_getMembers;
	if !(_members isEqualTo []) then
	{
		{
			if !(isNull _x) then
			{
				[format ["Сообщение от %1!",_player call getFullName], _parameters select 0, 10, [0.247,0.831,0.988,1]] remoteExec ["RRPClient_gui_baguetteExt_show",owner _x]; 
			};
		}
		forEach _members;
	};
	[_clanID,"message",getPlayerUID _player,format ["%1 сообщил всем ""%2"" ",_player call getFullName,_parameters select 0]] call RRPServer_groups_log;

	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
