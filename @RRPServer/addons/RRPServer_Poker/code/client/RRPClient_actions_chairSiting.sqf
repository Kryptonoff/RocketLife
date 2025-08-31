

params [
	["_chair",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

//FIX правельной посадки на стул
["EH_em_walkonstuff"] call babe_core_fnc_removeEH;
private _cPosPlayer = getPosATL _unit;
private _cPosChair = getPosATL _chair;

[_unit,"crew"] remoteExecCall ["RRPClient_system_animSync",-2];
_unit setPosATL _cPosChair; 
_unit setDir ((getDir _chair) - 180);
_unit setPosATL [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2) +.5)];

uiSleep 1;

if ((getPosATL _unit) distance _cPosPlayer > 100) then {
	[_unit,"stand"] remoteExecCall ["RRPClient_system_animSync",-2];
	_unit setPosATL _cPosPlayer;		
};

AID_CHROUT = _unit addAction ["Встать со стула",RRPClient_actions_chairSitingUp,"",0,false,false,"",'true'];

waitUntil {uiSleep 0.3; animationState _unit != "crew"};

_unit removeAction AID_CHROUT;