/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

#include "..\script_macros.hpp"
private _side = param [0,"",[""]];
private _return = [];
private _exit = false;
if (count life_logout_position > 0) then {
	if (life_logout_position distance (getMarkerPos "players_spawn_zone") <= 800) then {
		life_logout_position = [_side] call RRPClient_spawn_SafeMarker;
	};
	private _logoutname = format["spawn_%1_%2",steamid,round(daytime * 10000)];
	private _logoutpos = [life_logout_position select 0,life_logout_position select 1,(life_logout_position select 2)+0.5];

	private _marker = createMarkerLocal [ _logoutname, _logoutpos];
	_marker setMarkerPosLocal _logoutpos;
	_return pushBack [_logoutname,"Точка отключения","\rimas_pack\icons\exit.paa"];
	if (_logoutpos call RRPClient_util_isInStratis) then 
	{
		_exit = true;
	};
};
if (_exit) exitWith { _return };

private _flag = player call getSide;
{
	if ([getText(_x >> "conditions")] call RRPClient_util_conditionsCheck) then {
		private _customPos = getArray(_x >> "position");
		_return pushBack (if ((count _customPos) > 0) then {
			[getText(_x >> "spawnMarker"),getText(_x >> "displayName"),getText(_x >> "icon"),_customPos];
		} else {
			[getText(_x >> "spawnMarker"),getText(_x >> "displayName"),getText(_x >> "icon")];
		});

	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgSpawnPoints" >> worldName >> _flag));

if (count life_houses > 0 && {[LIFE_SETTINGS(getText,"life_houseSpawnCondition")] call RRPClient_util_conditionsCheck}) then
{
	private ["_house","_houseName"];
	{
		_house = nearestObject [_x select 0,_x select 1];
		_houseName = _house getVariable ["house_name",""];
		_allowed = getNumber(getMissionConfig "LifeCfgHousing" >> typeOf _house >> "canGarage") isEqualTo 0;
		if (_allowed) then {_return pushBack [format["house_%1",round ((getPosWorld _house)#0)],_houseName,"\rimas_pack\icons\home.paa"]};
	} forEach life_houses;
};

if !(life_death_markers isEqualTo []) then
{
	{
		for "_i" from 0 to ((count life_death_markers) - 1) do
		{
			if ((getMarkerPos (_x select 0)) distance2d ((life_death_markers select _i) select 1) < 1510) exitWith
			{
				_return deleteAt _forEachIndex
			};
		};
	} forEach _return;
};

if (EQUAL(_return,[])) then {
	life_logout_position = [_side] call RRPClient_spawn_SafeMarker;
	private _logoutname = format["spawn_%1_%2",steamid,round(daytime * 10000)];
	private _logoutpos = [life_logout_position select 0,life_logout_position select 1,(life_logout_position select 2)+0.5];

	private _marker = createMarkerLocal [ _logoutname, _logoutpos];
	_marker setMarkerPosLocal _logoutpos;

	_return pushBack [_logoutname,"Точка отключения","\rimas_pack\icons\exit.paa"];
};
_return
