class PosesAbstract
{
	icon = "";
	name = "";
	description = "";
	action = "";
	actionIn = "";
	actionInTime = 0;
	actionOut = "";
	actionOutTime = 0;
	weapon = "";
	condition = "true";
	error = "Ошибка";
};

class CfgPoses
{
	class Smoke: PosesAbstract
	{
		title = "Курить сигарету";
		condition = "";
		action = "AG_cigaretSmoke_loop";
		actionIn = "AG_cigaretSmoke_in";
		actionInTime = 4;
		actionOut = "AG_cigaretSmoke_out";
		actionOutTime = 1.428;
		weapon = "rrp_sigaret";
	};
	class GroundSearch: PosesAbstract
	{
		icon = "";
		title = "Искать что-то";
		condition = "";
		action = "AG_groundSearching";
		actionIn = "AG_groundSearching_in";
		actionInTime = 1.818;
		actionOut = "AG_groundSearching_out";
		actionOutTime = 1.818;
	};
	class HandOnStomach: PosesAbstract
	{
		icon = "";
		title = "Руки на пояс";
		condition = "";
		action = "AG_handOnStomach_loop";
		actionIn = "AG_handOnStomach_in";
		actionInTime = 1.428;
		actionOut = "AG_handOnStomach_out";
		actionOutTime = 1.428;
	};
	class HandOnChest: PosesAbstract
	{
		icon = "";
		title = "Скрестить руки";
		condition = "";
		action = "AG_handOnChest_loop";
		actionIn = "AG_handOnChest_in";
		actionInTime = 1.428;
		actionOut = "AG_handOnChest_out";
		actionOutTime = 1.428;
	};
	///////
	class IdlePistol: PosesAbstract
	{
		icon = "";
		title = "Ожидание (пистолет)";
		condition = "";
		action = "AG_pistolIdle_loop";
		actionIn = "AG_pistolIdle_in";
		actionInTime = 1.428;
		actionOut = "AG_pistolIdle_out";
		actionOutTime = 1.428;
	};
	class IdleGun: PosesAbstract
	{
		icon = "";
		title = "Ожидание (главное оружие)";
		condition = "";
		action = "AG_rifleIdle_loop";
		actionIn = "AG_rifleIdle_in";
		actionInTime = 1.428;
		actionOut = "AG_rifleIdle_out";
		actionOutTime = 1.428;
	};
	class IdleLauncher: PosesAbstract
	{
		icon = "";
		title = "Ожидание (второстепенное оружие)";
		condition = "";
		action = "AG_launcherIdle_loop";
		actionIn = "AG_launcherIdle_in";
		actionInTime = 1.428;
		actionOut = "AG_launcherIdle_out";
		actionOutTime = 1.428;
	};
	class TabletWrite: PosesAbstract
	{
		icon = "";
		title = "Записать что-то";
		condition = "";
		action = "AG_policeTablet_loop";
		actionIn = "AG_policeTablet_in";
		actionInTime = 1.428;
		actionOut = "AG_policeTablet_out";
		actionOutTime = 1.428;
		weapon = "rrp_tablet";
	};
	class Kort: PosesAbstract
	{
		icon = "";
		title = "Сесть на корточки";
		condition = "";
		action = "AG_slavicSquat_loop";
		actionIn = "AG_slavicSquat_in";
		actionInTime = 1.428;
		actionOut = "AG_slavicSquat_out";
		actionOutTime = 1.428;
	};
	class Kort2: PosesAbstract
	{
		icon = "";
		title = "Сесть на корточки 2";
		condition = "";
		action = "AG_slavicSquat_unProper_loop";
		actionIn = "AG_slavicSquat_unProper_in";
		actionInTime = 1.428;
		actionOut = "AG_slavicSquat_unProper_out";
		actionOutTime = 1.428;
	};
	class WallLeaning: PosesAbstract
	{
		icon = "";
		title = "Облокотиться о стену";
		condition = "";
		action = "AG_wallLeaning_loop";
		actionIn = "AG_wallLeaning_in";
		actionInTime = 1.428;
		actionOut = "AG_wallLeaning_out";
		actionOutTime = 1.428;
	};
};