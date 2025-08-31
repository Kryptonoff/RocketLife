
params [["_unit", objNull, [objNull]]];

if (
!(uniform _unit in mutantsForms) AND 
!(animationState _unit == "plagued_armed_melee_noWeapon_catch_victim") AND 
!(animationState _unit == "plagued_armed_melee_noWeapon_catch_victim_behind") AND 
!(animationState _unit == "plagued_armed_melee_noWeapon_catch_zombie")
) then {
	if (currentWeapon _unit == "") then {
		[_unit, selectRandom ["unnarmed_hit_back","unnarmed_hit_left","unnarmed_hit_right"]] remoteExec ["playActionNow",-2];
	};
	if ((currentWeapon _unit == handgunWeapon _unit) AND !(currentWeapon _unit == "")) then {
		[_unit, selectRandom ["pistol_hit_behind","pistol_hit_left","pistol_hit_right"]] remoteExec ["playActionNow",-2];
	};
	if ((currentWeapon _unit == primaryWeapon _unit) AND !(currentWeapon _unit == "")) then {
		[_unit, selectRandom ["rifle_hit_behind","rifle_hit_left","rifle_hit_right"]] remoteExec ["playActionNow",-2];
	};
	if (canSuspend) then {
		_unit allowSprint false;
		[_unit, false] remoteExecCall ["allowSprint",-2];
		uiSleep 1;
		[_unit, true] remoteExecCall ["allowSprint",-2];
	};
};