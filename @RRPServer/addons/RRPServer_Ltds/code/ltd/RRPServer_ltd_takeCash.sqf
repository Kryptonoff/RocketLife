/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_player",objNull,[objNull]],	
	["_id",-1],
	["_value",0]
];
try
{
	if (isNull _player) throw "Игрок не определен";
	if (_id isEqualTo -1) throw "ID не определен";
	if (_value isEqualTo 0) throw "Значение 0";

	private _companyOwner = missionNamespace getVariable [format["ltdData_%1",_id],[]];
	_companyOwner params ["_owner","_name","_bank","_members"];
	private _uid = getPlayerUID _player;
	private _new = _bank - _value;
	_companyOwner set [2,_new];
	missionNamespace setVariable [format["ltdData_%1",_id],_companyOwner,true];
	format ["ltdsUpdateBank:%1:%2",_new,_id] call RRPServer_DB_fireAndForget;
}catch{
	_exception call RRPServer_util_log;
};
true
