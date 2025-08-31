/*
	
	Filename: 	RRPClient_system_animSync.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

params [
	["_unit",ObjNull,[Objnull]],
	["_anim","",[""]],
	["_isSwitchMove",true,[true]],
	["_isPlayMove",true,[true]],
	["_isPlayMoveNow",false,[false]],
	["_isPlayActionNow",false,[false]]
];

if(isNull _unit) exitWith {};

if(_isSwitchMove) then {_unit switchMove _anim};
if(_isPlayMove) then {_unit playMove _anim};
if(_isPlayMoveNow) then {_unit playMoveNow _anim};
if(_isPlayActionNow) then {_unit playActionNow _anim};
