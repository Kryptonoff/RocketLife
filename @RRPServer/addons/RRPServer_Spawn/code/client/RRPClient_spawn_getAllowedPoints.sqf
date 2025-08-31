RRPClient_spawn_getAllowedPoints = {
private ["_config","_hash","_config","_configName","_displayName","_spawnMarker","_icon","_condition","_city"];
private _config = getMissionConfig "LifeCfgSpawnPoints" >> worldName >> (player call getSide);
private _hash = createHashMap;

comment "
	// Hash params 
	[
		key,[
			displayName,
			icon,
			marker,
			city?
		]
	]";

private _safeMarker = {
	private _ret = [14026.5,18684.4,0.00151634];
	switch (worldName) do 
	{
		case "RRpMap": 
		{
			switch (player call getSide) do
				{
					case "civ" : {_ret = getMarkerPos "Stolica_1"};
					case "reb" : {_ret = getMarkerPos "base_reb_1"};
					case "cop" : {_ret = getMarkerPos "cop_spawn_1"};
					case "med" : {_ret = getMarkerPos "base_hospital_1"};
					default {};
				};

		};
		default {};
	};
	_ret
};

if (life_logout_position isNotEqualTo []) then 
{
	if (life_logout_position distance (getMarkerPos "players_spawn_zone") <= 800) then 
	{
		life_logout_position = call _safeMarker;
	};
	private _logoutname = format["spawn_%1_%2",getPlayerUID player,round(daytime * 10000)];
	private _logoutpos = [life_logout_position select 0,life_logout_position select 1,(life_logout_position select 2)+0.5];

	private _marker = createMarkerLocal [ _logoutname, _logoutpos];
	_marker setMarkerPosLocal _logoutpos;
	_hash set ["logout",["Точка отключения","\rimas_pack\icons\exit.paa",_logoutname,false]];
};

if (life_houses isNotEqualTo [] && {[getText(missionConfigFile >> "LifeCfgSettings" >> "life_houseSpawnCondition")] call condition}) then
{
	private ["_house","_houseName"];
	{
		_house = nearestObject [_x select 0,_x select 1];
		_houseName = _house getVariable ["house_name",""];
		if (getNumber(getMissionConfig "LifeCfgHousing" >> typeOf _house >> "canGarage") isEqualTo 0) then 
		{
			_hash set [_houseName + round(random(999)),["\rimas_pack\icons\home.paa",format["house_%1",round ((getPosWorld _house)#0)],false]];
		};
	} forEach life_houses;
};


{
	_config = _x;
	_configName = configName _config;
	_displayName = getText(_x >> "displayName");
	_spawnMarker = getText(_x >> "spawnMarker");
	_icon = getText(_x >> "icon");
	_condition = getText(_x >> "conditions");
	_city = getNumber(_x >> "city") isEqualTo 1;
	if !([_condition] call condition) then {continue};
	_hash set [_configName,[_displayName,_icon,_spawnMarker,_city]];
} forEach ("true" configClasses _config);

comment "
life_death_markers = [
	_markerID,
	(getPos life_corpse),
	time,
	RRPPublicSessionID];
";

if !(life_death_markers isEqualTo []) then
{
	{
		_keyName = _x;
		diag_log format ["Key: %1",((_hash get _keyName) select 2)];
		{
			_deathMarker = _x;
			if (getMarkerPos "Stolica_1" distance2d (_deathMarker select 1)) then 
			{
				_hash deleteAt _keyName;
			};
		} forEach life_death_markers;
	} forEach (keys _hash);
};


if (keys _hash isEqualTo []) then {
	life_logout_position = call _safeMarker;
	private _logoutname = format["spawn_%1_%2",getPlayerUID player,round(daytime * 10000)];
	private _logoutpos = [life_logout_position select 0,life_logout_position select 1,(life_logout_position select 2)+0.5];

	private _marker = createMarkerLocal [ _logoutname, _logoutpos];
	_marker setMarkerPosLocal _logoutpos;
	_hash set ["logout",["Точка отключения","\rimas_pack\icons\exit.paa",_logoutname,false]];
};

_hash
};
call RRPClient_spawn_getAllowedPoints