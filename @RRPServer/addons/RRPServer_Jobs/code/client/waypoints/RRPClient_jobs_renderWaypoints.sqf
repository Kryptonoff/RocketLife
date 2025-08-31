if (isNil "RRP_job_waypoints") then {RRP_job_waypoints = createHashMap};

if (alive player AND (RRP_job_waypoints isNotEqualTo [])) then {
	{
		_distance = player distance _y;
		_color set [3,(linearConversion[0, 200, _distance, 0.25, 1, true])];
		drawIcon3D[
			"\rimas_agent\assets\waypoints\01.paa", 
			[1,0.4,0,1],
			_y, 
			0.85, 
			0.85,
			0, 
			format["%1m", floor _distance], 
			0, 
			0.03, 
			"RobotoCondensed", "center", true];
	} forEach RRP_job_waypoints;
};