
private _curWeapon = currentWeapon player;
if (_curWeapon isEqualTo "") exitWith {};

private _items = switch (_curWeapon) do { 
	case (primaryWeapon player): {
		player playActionNow "Burrer_human_take_rifle";
		player playActionNow "Burrer_human_take_rifle";
		(primaryWeaponItems player + [_curWeapon]) select {!(_x isEqualTo "")};
	}; 
	case (handgunWeapon player): {
		player playActionNow "Burrer_human_take_pistol";
		player playActionNow "Burrer_human_take_pistol";
		(handgunItems player + [_curWeapon]) select {!(_x isEqualTo "")};
	}; 
	default {[]}; 
};
if (_items isEqualTo []) exitWith {};

[player, ["controller_hit_first", 100]] remoteExecCall ["say3D",-2];

[{
	[player, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove",-2];
	player removeWeapon (currentWeapon player);
	_weaponHolder = createVehicle ["GroundWeaponHolder", (player modelToWorld [0,1.7,0]), [], 0, "CAN_COLLIDE"];
	{[_x, _weaponHolder, true] call RRPClient_system_addItemToBox} forEach _this;
	[] call RRPClient_system_throwWeapon
}, _items, 0.3] call CBA_fnc_waitAndExecute;