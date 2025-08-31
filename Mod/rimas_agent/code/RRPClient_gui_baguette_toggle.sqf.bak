/**
 * RRPClient_gui_baguette_toggle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_show"];
_show = _this;
if (_show) then
{
	if !(RRPClientBaguetteAreaVisible) then
	{
		("RscBaguetteAreaLayer" call BIS_fnc_rscLayer) cutRsc ["RscBaguetteArea", "PLAIN", 0, true];
		RRPClientBaguetteAreaVisible = true;
	};
}
else
{
	if (RRPClientBaguetteAreaVisible) then
	{
		("RscBaguetteAreaLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		RRPClientBaguetteAreaVisible = false;
	};
};