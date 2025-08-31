/*

	Filename:	RRPClient_hotkeys_switchWeaponHandler.sqf
	Project:	Fatum Altis Life
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
if (isNull (missionNamespace getVariable ["life_weaponSwitchHandler",objNull])) then {
	life_weaponSwitchHandler = [] spawn {
		life_switchWeapon_handler = true;
		uiSleep 4;
		life_switchWeapon_handler = false;
	};
} else {
	terminate life_weaponSwitchHandler;
	life_weaponSwitchHandler = [] spawn {
		life_switchWeapon_handler = true;
		uiSleep 4;
		life_switchWeapon_handler = false;
	};
};