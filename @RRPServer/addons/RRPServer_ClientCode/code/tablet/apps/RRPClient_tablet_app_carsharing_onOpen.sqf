[] spawn {
	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 21000;
	waitUntil {ctrlCommitted _slide};

	private _map = _slide controlsGroupCtrl 21006;
	_map ctrlMapSetPosition [0.281 * safezoneW,0.03 * safezoneH,0.211394 * safezoneW,0.3652 * safezoneH]; 
	private _carsList = _slide controlsGroupCtrl 21007;

	private _cs_refreshed = profileNamespace getVariable ["cs_refreshed",0];
	private _positions_array = profileNamespace getVariable ["cs_cars",[]];
	private _cs_cars = ("true" configClasses (getMissionConfig "CfgCar2Go" >> "Cars")) apply {configName _x};
	
	if ((time - _cs_refreshed) > 300 OR {(time - _cs_refreshed) < -300} OR {_cs_refreshed isEqualTo []}) then {
		profileNamespace setVariable ["cs_refreshed", time];
		_positions_array = [];

		private _nearestLoc = nearestLocations [player, ["NameCity","NameVillage", "NameCityCapital"], 1500] select 0;
		if (isNil "_nearestLoc") exitWith {};

		private _loc_distance = player distance (getpos _nearestLoc);
		private _tries = 0;
		while {count _positions_array < 10 AND {_tries < 20}} do {
			private _car_position = [[[getPos _nearestLoc, _loc_distance]],["water"],{isOnRoad _this AND (count(nearestObjects[_this,["LandVehicle","Ship","Air"],20]) isEqualTo 0)}] call BIS_fnc_randomPos;
			if !(_car_position isEqualTo [0,0]) then {_positions_array pushBack [[_car_position select 0, _car_position select 1, 0], selectRandom _cs_cars]};
			_tries = _tries + 1;
		};

		profileNamespace setVariable ["cs_cars",_positions_array];
		"Данные о доступных машинах обновлены" call chat;
	};
	lbClear _carsList;
	{
		_x params ["_vehPos", "_vehClass"];
		_idx = _carsList lbAdd format["%1", getText (configfile >> "CfgVehicles" >> _vehClass >> "displayName")];
		_carsList lbSetTextRight [_idx,format["%1 м. от вас", round(player distance _vehPos)]];
		_carsList lbSetData [_idx, _vehClass];
		_marker = createMarkerLocal [format["%1_cs", _forEachIndex], _vehPos];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "c_car";
	} forEach _positions_array;
	_carsList lbSetCurSel 0;

	_marker = createMarkerLocal [format["%1_marker",player],visiblePosition player];
	_marker setMarkerColorLocal "ColorCivilian";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["%1", player call getNickName];

	private _rentBtn = _slide controlsGroupCtrl 21002;
	private _stoprentBtn = _slide controlsGroupCtrl 21005;

	if (life_cs_renting) then {_rentBtn ctrlEnable false;} else {_stoprentBtn ctrlEnable false;};
	_rentBtn ctrlEnable true;

};
