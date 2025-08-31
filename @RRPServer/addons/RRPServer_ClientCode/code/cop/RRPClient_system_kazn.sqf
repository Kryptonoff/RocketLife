/*

    Filename: 	RRPClient_system_kazn.sqf
	Project: 	Rimas Altis Life RPG

*/

params [
	["_victim",objNull,[objNull]]
];
_killer = player;
if ((player distance _victim) > 5) exitWith {["Вы слишком далеко"] call toastError};
if (_victim getVariable ["kazn",false]) exitWith {["Цель уже казнят"] call toastError};

private _kill = false;

switch (true) do {
	case ((currentWeapon player) in ["am_bat_saw","am_pickaxe","am_axe"]): {
		_victim setVariable ["kazn",true,true];
		_kill = true;
		
		_victim attachTo [player,[0,1.1,0]];
		
		uiSleep 0.5;
		
		[player,"AG_kazn_batType_headChop_main",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_victim,"AG_kazn_batType_headChop_victim",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		uiSleep 3;
		_rndSound = selectRandom ["melee_1","melee_2"];
		[player,_rndSound] remoteExecCall ["RRPClient_system_say3D",-2];
		uiSleep 0.5;
		[player,"melee_hit"] remoteExecCall ["RRPClient_system_say3D",-2];
		uiSleep 1.5;
		detach _victim;
		_victim setDamage 1;
		[player,"AmovPercMstpSrasWlnrDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	};
	case (true): {
		_victim setVariable ["kazn",true,true];
		_kill = true;
		
		_victim attachTo [player,[0,0.75,0]];
		
		uiSleep 0.5;
		
		[player,"AG_kazn_batType_main",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_victim,"AG_kazn_batType_victim",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		uiSleep 3;
		_rndSound = selectRandom ["melee_1","melee_2"];
		[player,_rndSound] remoteExecCall ["RRPClient_system_say3D",-2];
		uiSleep 0.5;
		[player,"melee_hit"] remoteExecCall ["RRPClient_system_say3D",-2];
		uiSleep 1.5;
		detach _victim;
		_victim setDamage 1;
		[player,"AmovPercMstpSrasWlnrDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	};
	case ((currentWeapon player) isEqualTo handgunweapon player): {
		if ((currentWeapon player) in ["DDOPP_X26","DDOPP_X26_b"]) exitWith {["Текущим оружием нельзя казнить цель"] call toastError};
		_victim setVariable ["kazn",true,true];
		_kill = true;
		
		_victim attachTo [player,[0.1,0.5,0]];
		
		uiSleep 0.5;
		
		[player,"AG_kazn_pistol_main",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_victim,"AG_kazn_pistol_victim",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		uiSleep 1.6;
		player forceWeaponFire [weaponState player select 1, weaponState player select 2];
		uiSleep 3.4;
		_victim setDamage 1;
		detach _victim;
		[player,"AmovPercMstpSlowWpstDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	};
	case ((currentWeapon player) isEqualTo primaryWeapon player): {
		_victim setVariable ["kazn",true,true];
		_kill = true;
		
		_victim attachTo [player,[0,0.45,0]];
		
		uiSleep 0.5;
		
		[player,"AG_kazn_rifle_main",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_victim,"AG_kazn_rifle_victim",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		uiSleep 0.9;
		player forceWeaponFire [weaponState player select 1, weaponState player select 2];
		uiSleep 3.1;
		_victim setDamage 1;
		detach _victim;
		[player,"AmovPercMstpSlowWrflDnon",true,false] remoteExecCall ["RRPClient_system_animSync",0];
	};
	default {["Текущим оружием нельзя казнить цель"] call toastError};
};

if (_kill) then {
	_victim setVariable ["kazn",false,true];

	[getPlayerUID _killer,currentWeapon _killer,"kill"] remoteExecCall ["insertKillLog",2];
	[format ["!!KILL!!: %1 (%2) убил %3 (%4) с растояния %5м с (%6) POSv: %7 POSk: %8",_killer getVariable ["realname",""],getPlayerUID _killer,_unit getVariable ["realname",""],getPlayerUID player,round(_unit distance _killer),_projectile,mapGridPosition _unit,mapGridPosition _killer],"Kill_Log"] remoteExecCall ["RRPServer_system_logIt",2];
	[
		"УБИЛ!",
		"KillLog",
		"FF4000",
		format ["%1 (%2) убил %3 (%4) %9с расcтояния %5м с %10 (%6) %9POSv: %7 POSk: %8%9 K:%11 V:%12",_killer getVariable ["realname",""],getPlayerUID _killer,_unit getVariable ["realname",""],getPlayerUID player,round(_unit distance _killer),_projectile,mapGridPosition _unit,mapGridPosition _killer,endl,currentWeapon _killer,getPosWorld _killer,getPosWorld _unit]
	] remoteExecCall ["RRPServer_discord_sendMessage",2];
};