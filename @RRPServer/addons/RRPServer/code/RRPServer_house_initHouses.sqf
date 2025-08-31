private["_continueLoading", "_page", "_pageSize", "_houseIDs", "_numberOfHouse", "_i"];
"Loading houses from database..." call RRPServer_DB_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_houseIDs = format ["loadingIdPageHouseContainer:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfHouse = count _houseIDs;
	// format ["Houses in Database - %1",_numberOfHouse] call RRPServer_DB_log;
	if (_numberOfHouse > 0) then 
	{
		for "_i" from 0 to _numberOfHouse - 1 do 
		{
			((_houseIDs select _i)select 0) call RRPServer_house_loadHouses;
		};
	};
	_page = _page + 1;
	if (_numberOfHouse < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading houses!" call RRPServer_DB_log;
true