

private _pos = _this select 0;
private _type = param [1,"Car"];
_type = if (_type isEqualTo "") then {"Car"}else{_type};
private _nearVehicles = nearestObjects [_pos, [_type], 50];
private _localVehicles = [];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			if !((_x getVariable ["dbInfo",[]]) isEqualTo []) then 
			{
				if (((_x getVariable "dbInfo") select 0) isEqualTo (getPlayerUID player)) then
				{
					_localVehicles pushBack _x;
				};
			};
		};
	};
}
forEach _nearVehicles;

_localVehicles
