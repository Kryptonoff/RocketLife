
call RRPClient_russianRoulette_stopCountDown;
if (RRPClientRussianRouletteHudVisible) then 
{
	RRPClientLayerRussianRoulette cutText ["", "PLAIN"]; 
	RRPClientRussianRouletteHudVisible = false;
};
true call SmartClient_gui_toaster_toggle;
true call RRPClient_gui_baguetteExt_toggle;
