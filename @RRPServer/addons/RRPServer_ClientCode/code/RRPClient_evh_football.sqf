
_balls = player nearEntities ["Land_Football_01_F", 2];
if (_balls isNotEqualTo []) then {
	{
		if((velocity _x) vectorDistance [0,0,0] < 1) then {
			if((velocity player) vectorDistance [0,0,0] > 1) then {
				if((getPosATL player) vectorDistance (getPosATL _x) < 0.5) then {
					_p = ((velocity player) vectorDistance [0,0,0]) * 2;
					_v = velocity player;
					_m = 1.5;
					_z = 1 + random 2;

					_v set [0, (_v select 0) * _m];
					_v set [1, (_v select 1) * _m];
					_v set [2, _z];

					[_x, _v] remoteExecCall ["setVelocity",_x];
				};
			};
		};
	} forEach (_balls);
};
