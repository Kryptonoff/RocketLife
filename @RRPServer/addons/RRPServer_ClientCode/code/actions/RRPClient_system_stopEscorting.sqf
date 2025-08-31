/*

	Filename: 	RRPClient_system_stopEscorting.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\..\script_macros.hpp"
private _unit = player getVariable ["escortingPlayer",objNull];
if (isNull _unit) exitWith {};
if !(_unit getVariable ["Escorting",false]) exitWith {};

switch (currentWeapon player) do {
    case (primaryWeapon player): {
		player playActionNow "Disable_Gesture"; 
		[player,"ag_hostage_primary_main_out",true,false] remoteExecCall ["RRPClient_system_animSync",0];	  
		[_unit,"ag_hostage_primary_victim_out",true,false] remoteExecCall ["RRPClient_system_animSync",0];	
		_unit attachTo [player,[0,0.85,0]];
		uiSleep 1.818;
		player forceWalk false; 
		detach _unit;
		[player,"AmovPercMstpSrasWrflDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_unit,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	};
    case (handgunWeapon player): {
		player playActionNow "Disable_Gesture"; 
		_unit attachTo [player,[0,0.75,0]]; 
		[player,"ag_hostage_main_out",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_unit,"ag_hostage_victim_out",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		uiSleep 1.818;
		player forceWalk false; 
		detach _unit;
		[player,"AmovPercMstpSrasWpstDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_unit,"AmovPercMstpSnonWnonDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	};
    case (secondaryWeapon player): {
		detach _unit;  
	};
    default {
		detach _unit; 
	};
};
escort_action = false;

[_unit,"Escorting"] call RRPClient_system_clearGlobalVar;