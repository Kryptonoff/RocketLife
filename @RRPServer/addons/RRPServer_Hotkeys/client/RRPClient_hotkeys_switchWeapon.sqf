/*

	Filename:	RRPClient_hotkeys_switchWeapon.sqf
	Project:	Fatum Altis Life
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
private _weapon = param [0,"",[""]];
if (_weapon isEqualTo "") exitWith {};

private _unit = player;
switch (_weapon) do {
	case "hotkey_primary";
	case (primaryWeapon _unit): {
		if ((primaryWeapon _unit) isEqualTo "") exitWith {};
		if ((currentWeapon player) isEqualTo (primaryWeapon _unit)) exitWith {};

		_weapon = primaryWeapon _unit;
	};
	case "hotkey_secondary";
	case (secondaryWeapon _unit): {
		if ((secondaryWeapon _unit) isEqualTo "") exitWith {};
		if ((currentWeapon player) isEqualTo (secondaryWeapon _unit)) exitWith {};

		_weapon = secondaryWeapon _unit;
	};
	case "hotkey_handgun";
	case (handgunWeapon _unit): {
		if ((handgunWeapon _unit) isEqualTo "") exitWith {};
		if ((currentWeapon _unit) isEqualTo (handgunWeapon _unit)) exitWith {};

		_weapon = handgunWeapon _unit;
	};
	default {};
};
_wepIdx = 0;
_unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
while {true} do {
	if ((currentWeapon _unit) isEqualTo _weapon) exitWith {
		[] call RRPClient_hotkeys_switchWeaponHandler;
	};
	_wepIdx = _wepIdx + 1;
	_unit action ["SWITCHWEAPON", _unit, _unit, _wepIdx];
};
[] call RRPClient_hotkeys_hudWeaponUpdate;