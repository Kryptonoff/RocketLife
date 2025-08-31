
private ["_unit"];
private _unit = param [0,objNull,[objNull]];
systemChat str _unit;
try {
    if (isNull _unit) throw "Юнит не определен!";
    if (player distance _unit > 5) exitWith {};

    {inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction","Action"];


    switch (currentWeapon player) do {
	case "am_policeStick": {
        systemChat "am_policeStick";
		comment "[100] call life_fnc_switchWeapon;";
		uiSleep 2.9;
		player playActionNow "am_hostageEscort_unnarmed";
		_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
	};
	case "": {
        systemChat "empty";
		player playActionNow "am_hostageEscort_unnarmed";
		_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
	};
    case (primaryWeapon player): {
        systemChat "primaryWeapon player";
		player playActionNow "Disable_Gesture";
		[player,"am_hostage_primary_main_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_unit,"am_hostage_primary_victim_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		_unit attachTo [player,[0,0.85,0]];
		uiSleep 1.7;
		player playActionNow "am_hostage_primary_main_loop";
		uiSleep 0.181;
		[player,"am_hostage_idle_MS",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		player forceWalk true;
		[_unit,"am_hostage_primary_victim_loop",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		_unit attachTo [player,[-0.06,0.31,-1.53],"LeftHand"];
	};
    case (handgunWeapon player): {
        systemChat "handgunWeapon player";
		player playActionNow "Disable_Gesture";
		escort_weapon_lowered = 0;
		_unit attachTo [player,[0,0.75,0]];
		[player,"am_hostage_main_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		[_unit,"am_hostage_victim_in",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		uiSleep 1.7;
		player playActionNow "am_hostage_main_loop";
		uiSleep 0.118;
		[player,"am_hostage_idle_MS",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		player forceWalk true;
		[_unit,"am_hostage_victim_loop",true,false] remoteExecCall ["RRPClient_system_animSync",0];
		_unit attachTo [player,[-0.1,0.92,-1.36],"Spine3"];
	};
    case (secondaryWeapon player): {
        systemChat "secondaryWeapon player";
		comment "[100] call life_fnc_switchWeapon;";
		uiSleep 2.9;
		player playActionNow "am_hostageEscort_unnarmed";
		_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
	};
    default {
        systemChat "secondaryWeapon player";
		player playActionNow "am_hostageEscort_unnarmed";
		_unit attachTo [player,[0,0.67,-1.36],"Spine3"];
	};
};

} catch {
    {inGameUISetEventHandler [_x, "false"]} forEach ["PrevAction", "NextAction","Action"];
}
