{
	_x params ["_type", "_name", "_id", "_val"];
	
	switch (_type) do 
	{
		case "mission":
		{
			removeMissionEventHandler [_name, _id];
		};
		
		case "music":
		{
			removeMusicEventHandler [_name, _id];
			playMusic "";
			0 fadeMusic _val;
		};
	};
}
forEach (AlienInvasion getVariable "EH");

deleteLocation AlienInvasion;
AlienInvasion = nil;