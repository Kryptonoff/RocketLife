params [
	["_farmingModels", [], [[]]],
	["_pugaloModels", [], [[]]]
];

private _drawRadius = 30;
if (_farmingModels isNotEqualTo []) then {
	{
		_c = profileNamespace getVariable ["PRNS_TagsColors",[1, 0, 0.27, 1]];
		_distanceForPlayer = player distance2D _x;
		_pos = getPosATL _x;
		_scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);

		_text = "У растения нет статуса";
		_state = _x getVariable["growState", []];
		if (_state isNotEqualTo []) then {
			private _curState = _state select 0;
			private _totalState = _state select 1;
			private _curGrowKoef = _state select 2;
			private _watered = _state select 4;
			private _fertilized = _state select 5;
			private _percentage = ((_curstate / _totalstate) * 100);

			private _zrelost = call { 
				if (_percentage < 50) exitWith {"низкая"}; 
				if (_percentage >= 50 && _percentage < 80) exitWith {"средняя"};
				if (_percentage >= 80 && _percentage < 100) exitWith {"высокая"};
				if (_percentage >= 100) exitWith {"полностью созрело"}; 
				"Ошибка!"; 
			};

			private _rost = call { 
				if ((_curGrowKoef * _watered) == 0) exitWith {"не растёт"}; 
				if ((_curGrowKoef * _watered) <= 1) exitWith {"очень низкая"}; 
				if ((_curGrowKoef * _watered) >= 1 && (_curGrowKoef * _watered) < 1.15) exitWith {"средняя"};
				if ((_curGrowKoef * _watered) >= 1.15 && (_curGrowKoef * _watered) < 1.25) exitWith {"выше среднего"};
				if ((_curGrowKoef * _watered) >= 1.25 && (_curGrowKoef * _watered) < 1.4) exitWith {"высокая"};
				if ((_curGrowKoef * _watered) >= 1.4 && (_curGrowKoef * _watered) < 1.65) exitWith {"очень высокая"};
				if ((_curGrowKoef * _watered) > 1.65) exitWith {"растёт как на дрожжах"}; 
				"Ошибка!"; 
			};

			private _polito = call { 
				if (_watered == 1) exitWith {"полито"}; 
				if (rain >= 0.4) exitWith {"будет полито дождём"};
				if (rain >= 0.2) exitWith {"скоро будет полито дождём"};
				if (rain >= 0.1) exitWith {"медлено поливается дождём"};
				if (rain >= 0.01) exitWith {"очень медлено поливается дождём"}; 
				if (_watered >= 0.1) exitWith {"требует полива"};
				if (_watered == 0) exitWith {"не полито"};
				"Ошибка!"; 
			};

			private _udobreno = call { 
				if (_fertilized == -1) exitWith {"не требует удобрения"}; 
				if (_fertilized >= 1) exitWith {"удобрено"};
				if (_fertilized == 0) exitWith {"не удобрено"};
				"Ошибка!"; 
			};

			drawIcon3D ["",
				[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],
				[(_pos select 0),(_pos select 1),((_pos select 2) + 0.5)],1/_scale,1/_scale,0,
				format["Зрелость - %1%2", round(_percentage), "%"],
			2,0.038/_scale,"RobotoCondensedLight","center",false,0,-0.5];

			drawIcon3D ["",
				[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],
				[(_pos select 0),(_pos select 1),((_pos select 2) + 0.5)],1/_scale,1/_scale,0,
				format["Рост - %1", _rost],
			2,0.038/_scale,"RobotoCondensedLight","center",false,0,-0.45];

			drawIcon3D ["",
				[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],
				[(_pos select 0),(_pos select 1),((_pos select 2) + 0.5)],1/_scale,1/_scale,0,
				format["Поливка - %1", _polito],
			2,0.038/_scale,"RobotoCondensedLight","center",false,0,-0.4];

			drawIcon3D ["",
				[1,1,1,((_c select 3 + 0.35) -( (1 / _drawRadius) * _distanceForPlayer))],
				[(_pos select 0),(_pos select 1),((_pos select 2) + 0.5)],1/_scale,1/_scale,0,
				format["Удобрен - %1", _udobreno],
			2,0.038/_scale,"RobotoCondensedLight","center",false,0,-0.35];
		};
	} forEach (nearestObjects [cameraOn, _farmingModels, _drawRadius]);
};
if (_pugaloModels isNotEqualTo []) then {
	{
		_c = profileNamespace getVariable ["PRNS_TagsColors",[1, 0, 0.27, 1]];
		_distanceForPlayer = player distance2D _x;
		_pos = getPosATL _x;
		_scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);
		_text = format ["Пугало разрушится %1", [(_x getVariable ["dateEnd", []])] call RRPClient_util_dateToString];
		drawIcon3D ["",
			[1,1,1,((_c select 3 + 0.35) -( (0.5 / _drawRadius) * _distanceForPlayer))],
			[(_pos select 0),(_pos select 1),((_pos select 2) + 2)],1/_scale,1/_scale,0,
			_text,
		2,0.038/_scale,"RobotoCondensedLight","center",false];

		_radius = getNumber(missionConfigFile >> "LifeCfgPugalo" >> (_x getVariable ["class", ""]) >> "radius");
		_inRadius = [" не", ""] select (_distanceForPlayer < _radius);
		_text = format ["Радиус действия %1 м. (Вы%2 в радиусе)", _radius, _inRadius];
		drawIcon3D ["",
			[1,1,1,((_c select 3 + 0.35) -( (0.5 / _drawRadius) * _distanceForPlayer))],
			[(_pos select 0),(_pos select 1),((_pos select 2) + 1.8)],1/_scale,1/_scale,0,
			_text,
		2,0.038/_scale,"RobotoCondensedLight","center",false];
	} forEach (nearestObjects [cameraOn, _pugaloModels, _drawRadius]);
};