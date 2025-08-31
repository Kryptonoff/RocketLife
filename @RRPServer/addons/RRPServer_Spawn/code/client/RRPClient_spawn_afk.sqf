
if ((call life_adminlevel) > 0) exitWith {};

if (isNull (missionNamespace getVariable ["life_afkhandler",scriptNull])) then 
{
	life_afkhandler = [] spawn 
	{
		uiSleep 600;
		if (player getVariable ["lifeState",""] in ["RESPAWN","DEAD"]) then 
		{
			diag_log "Must be kick";
		};
	};
} else {
	terminate life_afkhandler;
	life_afkhandler = [] spawn 
	{
		uiSleep 600;
		if (player getVariable ["lifeState",""] in ["RESPAWN","DEAD"]) then 
		{
			diag_log "Must be a kick";
		};
	};
};
