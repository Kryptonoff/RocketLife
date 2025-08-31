/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private["_resource","_illegal_items"];

"Loading economy from database... #1011" call RRPServer_util_debugConsole;
missionNamespace setVariable ["RRPPublicEconomyArray",[],true];
missionNamespace setVariable ["RRPPublicEconomyArrayEnded",[],true];
missionNamespace setVariable ["RRPPublicEconomyLastUpdate",0,true];

_resource = "loadEconomy" call RRPServer_DB_selectFull;
missionNamespace setVariable ["RRPPublicEconomyArray",_resource,true];
_illegal_items = [];
{
	_x params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until", "_lastprice"];
	if (_selled <= _max_selled) then {
		RRPPublicEconomyArrayEnded pushBack _x;
	};

	if !(_legal) then {
		private _rew = if (_sellprice <= 0) then {0} else {_sellprice};
		_illegal_items pushBack [_resName, _rew];
	};
} forEach _resource;

missionNamespace setVariable ["RRPPublicEconomyLastUpdate",serverTime,true];
missionNamespace setVariable ["RRPPublicEconomyIlegalItems",_illegal_items,true];
format ["Done loading economy from database | Total resource loaded: %1 #1011",count RRPPublicEconomyArray] call RRPServer_util_debugConsole;
true
