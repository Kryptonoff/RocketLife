/*
Exampe: [Positions array, 15, ["ColorWhite", 1]] call RRPClient_util_drawToMap;
*/

	private ["_alpha", "_center", "_color", "_direction", "_length", "_marker", "_markerArray", "_posArray", "_width"];
	_posArray = _this select 0;
	_width = _this select 1;
	_color = _this select 2 select 0;
	_alpha = _this select 2 select 1;
	_markerArray = [];
	for "_x" from 0 to count _posArray - 2 do {
		_center = [((_posArray select _x select 0) + (_posArray select _x + 1 select 0)) / 2, ((_posArray select _x select 1) + (_posArray select _x + 1 select 1)) / 2];
		_direction = ((_posArray select _x + 1 select 0) - (_posArray select _x select 0)) atan2 ((_posArray select _x + 1 select 1) - (_posArray select _x select 1));
		_length = sqrt (((_posArray select _x select 0) - (_posArray select _x + 1 select 0)) ^ 2 + ((_posArray select _x select 1) - (_posArray select _x + 1 select 1)) ^ 2);
		for "_y" from 1 to 9001 do {
			_marker = "other_drawToMap_" + str(_y);
			if (markerShape _marker == "") exitWith {};
		};
		createMarkerLocal [_marker, _center];
		_marker setMarkerShapeLocal "RECTANGLE";
		_marker setMarkerBrushLocal "SolidFull";
		_marker setMarkerSizeLocal [_width / 2, _length / 2];
		_marker setMarkerDirLocal _direction;
		_marker setMarkerAlphaLocal _alpha;
		_marker setMarkerColorLocal _color;
		_markerArray pushback _marker;
	};
	{
		for "_y" from 1 to 9001 do {
			_marker = "other_drawToMap_" + str(_y);
			if (markerShape _marker == "") exitWith {};
		};
		createMarkerLocal [_marker, _x];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerBrushLocal "SolidFull";
		_marker setMarkerSizeLocal [_width / 2, _width / 2];
		_marker setMarkerAlphaLocal _alpha;
		_marker setMarkerColorLocal _color;
		_markerArray pushback _marker;
	} forEach _posArray;
	_markerArray
