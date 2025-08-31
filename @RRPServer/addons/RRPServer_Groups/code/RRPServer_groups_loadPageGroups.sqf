/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_continueLoading", "_page", "_pageSize", "_clanIDs", "_numberOfClans"];
"Loading groups from database... #1111" call RRPServer_util_debugConsole;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do
{
	_clanIDs = format ["loadGroupPage:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfClans = count _clanIDs;
	if (_numberOfClans > 0) then
	{
		for "_i" from 0 to _numberOfClans - 1 do
		{
			((_clanIDs select _i) select 0) call RRPServer_groups_loadGroup;
		};
	};
	_page = _page + 1;
	if (_numberOfClans < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading groups! #0101" call RRPServer_util_debugConsole;
true