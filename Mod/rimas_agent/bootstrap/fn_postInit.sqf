HuntingMarkersPosAndSize = [];
{
	switch (_x) do 
	{
		case "hunt_zone":
		{
			HuntingMarkersPosAndSize pushBack 
			[
				getMarkerPos _x, 
				(getMarkerSize _x) select 0
			];
		};
	};
}
forEach allMapMarkers;

[] spawn {
	waitUntil {!isNull player};
	player addEventHandler ["Fired",{_this spawn RRPClient_system_danceGrenade}];
	player addEventHandler ["Respawn",{player addEventHandler ["Fired",{_this spawn RRPClient_system_danceGrenade}]}];
};

true