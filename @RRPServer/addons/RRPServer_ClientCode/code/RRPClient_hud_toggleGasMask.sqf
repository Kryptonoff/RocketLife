

if (_this) then 
{
	if !(RRPClientGasMaskVisible) then {
		RRPClientGasMaskVisible = true;
		LayerGasMask cutRsc ["RscGasMask", "PLAIN", 1, false];
	};
	if (alive player) then 
	{
		if (diag_tickTime >= GasMaskNextSoundAt) then 
		{
			playSound format ["Sound_GasMaskBreathing0%1", 1 + (floor (random 2))];
			GasMaskNextSoundAt = diag_tickTime + (2.2 + (random 1));
		};
	};
}
else 
{
	RRPClientGasMaskVisible = false;
	LayerGasMask cutText ["", "PLAIN"]; 
};
