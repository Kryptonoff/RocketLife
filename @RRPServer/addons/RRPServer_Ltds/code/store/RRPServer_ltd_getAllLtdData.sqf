/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

_load = {
	params ["_id","_owner","_name","_bank"];
	private _getMembers = format ["getLTDsMembers:%1",_ID] call RRPServer_DB_selectFull;
	private _bank = parseNumber(_bank);
	missionNamespace setVariable [format ["ltdData_%1",_id],[_owner,_name,_bank,_getMembers],true];
	format ["Company %1 loaded  #1011",_name] call RRPServer_util_debugConsole;		
};

private["_continueLoading", "_page", "_pageSize", "_ltdIDs", "_numberOfLTD", "_i"];
"Loading ltds from database... #0101" call RRPServer_util_debugConsole;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_ltdIDs = format ["loadingIdPageLtdsData:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfLTD = count _ltdIDs;
	if (_numberOfLTD > 0) then 
	{
		for "_i" from 0 to _numberOfLTD - 1 do 
		{
			(_ltdIDs select _i) call _load;
		};
	};
	_page = _page + 1;
	if (_numberOfLTD < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading ltds from database... #0101" call RRPServer_util_debugConsole;
true