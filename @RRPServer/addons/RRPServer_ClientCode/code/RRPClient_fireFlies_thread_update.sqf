private["_hour", "_startHour", "_endHour", "_position", "_i"];

private _dropParticle = {
	private["_position", "_glow"];
	_position = [_this, random 2, random 360] call BIS_fnc_relPos; 
	_position set [2, 1 + (random 1)];       
	_glow = 1.5 + (random 1.25);
	drop
	[
		["\exile_assets\model\Exile_Animal_FireFly",1,0,1],
		"",
		"Billboard",
		1,
		20,
		_position,
		[0, 0, 0],
		random 1,
		1.275,
		1.0,
		0.009,
		[0.3],
		[
			[1,1,1,0],
			[_glow,_glow,_glow,_glow],
			[_glow,_glow,_glow,_glow],
			[_glow,_glow,_glow,0]
		],
		[1],
		2.0,
		0.05,
		"",
		"",
		"",
		random 360,
		false,
		-1
	];
};

if (diag_tickTime >= RRPNextFireFliesSpawnAt) then 
{
	_hour = date select 3;
	_startHour = 19;
	_endHour = 6;
	if (_hour >= _startHour || _hour <= _endHour) then 
	{
		if !(isNull player) then 
		{
			_position = [player, 5 + (random 10), random 360] call BIS_fnc_relPos; 
			for "_i" from 0 to (1 + floor (random 5)) do 
			{
				_position call _dropParticle; 
			};
		};
		RRPNextFireFliesSpawnAt = diag_tickTime + (20 + (random 20));
	}
	else 
	{
		RRPNextFireFliesSpawnAt = diag_tickTime + 60;
	};
};