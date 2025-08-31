/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params [
	["_player",objNull,[objNull]],
	["_prof","",[""]],
	["_neededXpToBuy", 0, [0]]
];

try {
	if (isNull _player) throw "Вы NULL";
	if (_prof isEqualTo "") throw "Навык не определен!";
		
	private _xpPerRc = getNumber(getMissionConfig "CfgSkills" >> _prof >> "xpPerRc");
	private _cost = ceil(_neededXpToBuy / _xpPerRc);

	if (_player getVariable ["RRPPoint",0] < _cost) throw "Недостаточно средств для покупки!";
	[_player,"point","take",_cost] call RRPServer_system_moneyChange;
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"savedTime",_cost,
		format ["Апнул опыт проф %1 - %2 XP",_prof, _neededXpToBuy]
	] call RRPServer_DB_lk_fireAndForget;

	[true, _prof, _neededXpToBuy] remoteExecCall ["RRPClient_skills_buyTimeSaverResponse",owner _player];
} catch {
	[false, _prof, _neededXpToBuy, _exception] remoteExecCall ["RRPClient_skills_buyTimeSaverResponse",owner _player];
};
