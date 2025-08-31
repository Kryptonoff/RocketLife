/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	["_ltd",objNull,[objNull]]
];

try
{
	if (isNull _ltd) throw "Магазин не магазин";
	_ltdID = _ltd getVariable ["ltdID",0];
	if (_ltdID isEqualTo 0) throw "Проблемы с магазином!";
	_queryCheck = format ["checkOnBusy:%1",_ltdID] call RRPServer_DB_selectSingleField; 
	if (_queryCheck) throw "Магазин уже занят кем-то, возможно он на другом острове!";
	format ["setBusyStat:1:%1",_ltdID] call RRPServer_DB_fireAndForget;
	[_ltd] remoteExecCall ["RRPClient_ltd_shopmenu",remoteExecutedOwner];
}catch{
	["ErrorTitleAndText",["Бизнес",_exception]] remoteExecCall ["toast",remoteExecutedOwner];
};

