/*
	Filename: 	RRPClient_system_escortCheckRelog.sqf
	Project: 	Rimas Altis Life RPG
*/
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};

waitUntil {isNull _unit || !(player getVariable ["Escorting",false])};

if (isNull _unit) then {
	[player,"Escorting"] call RRPClient_system_clearGlobalVar;
	[player,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
};
