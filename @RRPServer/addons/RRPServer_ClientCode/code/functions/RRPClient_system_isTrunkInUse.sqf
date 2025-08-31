/*

	Filename: 	RRPClient_system_isTrunkInUse.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

private _trunk = param [0,objNull,[objNull]];
private _player = param [1,player,[objNull]];
if (isNull _trunk) exitWith {false};
_tVar = _trunk getVariable "trunk_inUseBy";
if (isNil "_tVar") exitWith {false};
private _ret = false;
private _usedByPID = _trunk getVariable ["trunk_inUseBy",""];

if !(_usedByPID isEqualTo "") then {
	if (!(_usedByPID isEqualTo (getPlayerUID _player)) && {[_usedByPID] call RRPClient_system_isUIDActive}) then 
	{
		_ret = true
	};
};

_ret