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

{ deleteVehicle _x } forEach allMissionObjects "#soundonvehicle";

AlienInvasion getVariable "GAME" params ["_player", "_visibility", "_simulation", "_view", "_hud"];

//_player switchCamera _view;
//_player hideObject _visibility;
//_player enableSimulation _simulation;
//showHud _hud;

deleteLocation AlienInvasion;
AlienInvasion = nil;
