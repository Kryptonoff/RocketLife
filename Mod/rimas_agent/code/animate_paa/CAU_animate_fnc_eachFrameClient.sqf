/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _remove = [];
{
	_x params ["_type","_target","_selection","_path","_iteration","_maxIteration","_tick","_delay","_mode","_increment"];
	if (diag_tickTime >= _tick) then 
	{
		switch _type do 
		{
			case "object":
			{
				if (isNull _target) then 
				{
					_remove pushBack _target;
				} else {
					{
						if (_x != "") then 
						{
							_target setObjectTexture [_selection,format[_x,_iteration]];
						};
					} foreach _path;
				};
			};
			case "marker":
			{
				if (_target in allMapMarkers) then 
				{
					_target setMarkerTypeLocal format[_path,_iteration];
				} else {
					_remove pushBack _target;
				};
			};
		};
		_iteration = _iteration + _increment;
		switch _mode do 
		{

			case 0:
			{
				if (_iteration >= _maxIteration) then {_iteration = 0};
			};

			case 1:
			{
				switch true do 
				{
					case (_iteration >= _maxIteration):
					{
						_iteration = _maxIteration - 2;
						_increment = -1;
					};
					case (_iteration < 0):
					{
						_iteration = 1;
						_increment = 1;
					};
				};			
				_x set [8,_increment];
			};

			case 2:
			{
				if (_iteration >= _maxIteration) then 
				{
					_remove pushBack _target;
				};
			};
		};

		_x set [4,_iteration];
		_x set [6,diag_tickTime + _delay];
	};
} foreach CAU_animate_list_local;


{
	[_x] call CAU_animate_fnc_remove;
} foreach _remove;
