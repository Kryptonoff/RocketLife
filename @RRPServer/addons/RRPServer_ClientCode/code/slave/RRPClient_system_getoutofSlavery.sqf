/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/
if (life_inv_RRP_Cotton >= 50) then {
	["SuccessTitleAndText", ["Свобода!", "Вы обрели свободу! Долой кандалы!"]] call SmartClient_gui_toaster_addTemplateToast;
	uiSleep 10;
	[false,"RRP_Cotton",life_inv_RRP_Cotton] call RRPClient_system_handleInv;
	[player,"slave"] call RRPClient_system_clearGlobalVar;
	life_slave = false;
	player setPos (getMarkerPos "jail_release_civ");
	player remoteExecCall ["RRPServer_system_loadPlayerLoot",2];
	[8] call RRPClient_session_updatePartial;
} else {
	["ErrorTitleAndText", ["Ошибка!", "Вам нужно ровно 50 единиц хлопка."]] call SmartClient_gui_toaster_addTemplateToast;
};
