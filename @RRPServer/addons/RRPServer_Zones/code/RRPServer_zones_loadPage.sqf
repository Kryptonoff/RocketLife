/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _load = {
	_query = format ["loadTerritory:%1",_this] call RRPServer_DB_selectSingle;
	_query params [
		"_id",
		["_zone",""],
		["_group_id",-1],
		["_color",[0.0967437,0.886624,0.133732,0.6]],
		["_flag_texture","\A3\ui_f\data\map\markers\flags\Altis_ca.paa"],
		["_flag_position",[0,0,0]],
		["_radius",100],
		["_borders",[]],
		["_polygons",[]],
		["_phase",1],
		["_tax",1],
		["_last_capture",[]]
	];

	private _flag = "Flag_White_F" createVehicle _flag_position;
	_flag setVariable ["ZoneId",_id,true];
	_flag setVariable ["ZoneName",_zone,true];
	_flag setVariable ["ZoneGroup",_group_id,true];
	_flag setVariable ["ZoneGroupName",((missionNamespace getVariable [format["ServerGroupsInfo_%1",_group_id],createHashMap]) param [0,"Свободна"]),true];
	_flag setVariable ["ZoneRadius",_radius,true];
	_flag setVariable ["ZoneColor",_color,true];
	_flag setVariable ["ZoneBorders",_borders,true];
	_flag setVariable ["ZonePoly",_polygons,true];
	_flag setVariable ["ZonePhase",_phase,true];
	_flag setVariable ["ZoneTax",_tax,true];
	_flag setVariable ["ZoneCaptured",_last_capture,true];
	_flag setFlagTexture _flag_texture;
	[_flag, _phase] remoteExec ["setFlagAnimationPhase", 0, true];
	RRPPublicZonesFlags pushBack _flag;

	_flag

};

private["_continueLoading", "_page", "_pageSize", "_clanIDs", "_numberOfClans"];
"Loading groups territory from database... #1111" call RRPServer_util_debugConsole;
_continueLoading = true;
_page = 0;
_pageSize = 100;
RRPPublicZonesFlags = [];
while {_continueLoading} do
{
	_clanIDs = format ["loadTerritoriesPage:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfClans = count _clanIDs;
	if (_numberOfClans > 0) then
	{
		for "_i" from 0 to _numberOfClans - 1 do
		{
			((_clanIDs select _i) select 0) call _load;
		};
	};
	_page = _page + 1;
	if (_numberOfClans < 100) then
	{
		_continueLoading = false;
	};
};
publicVariable "RRPPublicZonesFlags";
"Done loading groups territory! #0101" call RRPServer_util_debugConsole;
true