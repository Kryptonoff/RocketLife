
private["_display", "_hint"];
disableSerialization;
false call RRPClient_hud_show;
call SmartClient_gui_toaster_removealltoasts;
false call SmartClient_gui_toaster_toggle;
false call RRPClient_gui_baguetteExt_toggle;
RRPClientLayerRussianRoulette cutRsc ["RscExileRussianRoulette", "PLAIN", 1, false];
RRPClientRussianRouletteHudVisible = true;
_display = uiNameSpace getVariable ["RscExileRussianRoulette", displayNull];
_hint = _display displayCtrl 4003;
_hint ctrlShow false;
_hint ctrlCommit 0;
