_cw = currentWeapon player;
if (_cw == "") exitWith {};

_selection 	= "";
switch (true) do {
	case (_cw == primaryWeapon player) : {
		_selection = "proxy:\a3\characters_f\proxies\weapon.001";
	};
	case (_cw == handgunWeapon player) : {
		_selection = "proxy:\a3\characters_f\proxies\pistol.001";
	};
	case (_cw == secondaryWeapon player) : {
		_selection = "proxy:\a3\characters_f\proxies\launcher.001";
	};
};

player playActionNow "throwGrenade";
UiSleep 0.3;
player removeWeapon _cw;
_pos = player modelToWorld (player selectionPosition _selection);
_weaponHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
_weaponHolder setPos _pos;
_weaponHolder setVectorDir [0,0,1];
_weaponHolder addWeaponCargoGlobal [_cw,1];
_dir = getDir player;
_vel = vectorDir player;
_speed = (speed player) max 5;
_weaponHolder setVelocity [
	(_vel # 0) + (sin _dir * _speed),
	(_vel # 1) + (cos _dir * _speed),
	(_vel # 2) + 5
];