private["_show"];
_show = _this;
if (_show) then
{
	if !(RRPClientBaguetteExtAreaVisible) then
	{
		("RscBaguetteExtAreaLayer" call BIS_fnc_rscLayer) cutRsc ["RscBaguetteExtArea", "PLAIN", 0, true];
		RRPClientBaguetteExtAreaVisible = true;
	};
}
else
{
	if (RRPClientBaguetteExtAreaVisible) then
	{
		("RscBaguetteExtAreaLayer" call BIS_fnc_rscLayer) cutRsc ["RscBaguetteExtArea", "PLAIN", 0, true];
		RRPClientBaguetteExtAreaVisible = false;
	};
};
