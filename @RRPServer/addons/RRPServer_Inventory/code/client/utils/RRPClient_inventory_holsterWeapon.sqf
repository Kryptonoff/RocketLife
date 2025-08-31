/*
	
	Filename: 	RRPClient_inventory_holsterWeapon.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
if (life_holster_delay > time) exitWith {};
private _current_weapon = currentWeapon player;
life_holster_delay = time + 1;
if (_current_weapon != "") then {
	life_curWep_h = _current_weapon;
	player action ["SwitchWeapon", player, player, 100];
	player switchcamera cameraView;
} else {
	if (!isNil "life_curWep_h" && {life_curWep_h in [primaryWeapon player, handgunWeapon player, secondaryWeapon player]}) then {
		player selectWeapon life_curWep_h;
	};
};