/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

_load = {
	private _ID = _this;
	private _data = format ["loadLTD:%1", _ID] call RRPServer_DB_selectSingle;
	private _position = (_data # 7);
	private _vectorDirection = (_data # 8);
	private _vectorUp = (_data # 9);

	private _constructionObject = createVehicle [(_data select 6), _position, [], 0, "CAN_COLLIDE"];
	_constructionObject setPosATL _position;
	_constructionObject setVectorDirAndUp [_vectorDirection, _vectorUp];
	_constructionObject setVariable ["ltdID", (_data select 0),true];
	_constructionObject setVariable ["ltdName", (_data select 1),true];
	_constructionObject setVariable ["ltdTax",(_data select 2),true];
	_constructionObject setVariable ["ltdOwner", (_data select 3),true];
	_constructionObject setVariable ["ltdActive",([_data # 4,1] call RRPServer_util_tinyIntConverter),true];
	_constructionObject setVariable ["ltdLicense",(_data # 5),true];
	_constructionObject setVariable ["ltdPayedUntil",(_data # 10),true];
	_constructionObject setVariable ["ltdMaxGds",(_data # 11),true];
	_constructionObject setVariable ["ltdDiscount",(_data # 12),true];
	_constructionObject setVariable ["ltdDiscountDate",(_data # 13),true];
	_constructionObject setVariable ["ltdMode",[(_data # 14),1] call RRPServer_util_tinyIntConverter,true];
	_constructionObject setVariable ["ltdBC",(_data # 15),true];
	_constructionObject setVelocity [0, 0, 0];
	_constructionObject setPosATL _position;
	_constructionObject setVectorDirAndUp [_vectorDirection, _vectorUp];
	_constructionObject enableSimulationGlobal false;

	private _marker = createMarker [format ["LTDStore_%1",_data select 0],getPos _constructionObject];
	_marker setMarkerText format["%1",_data # 1];
	_marker setMarkerType "welmen_shop_grey_local_business";
	_marker setMarkerSize [0.7,0.7];

	private _dataStore = format ["getGoodsInLTD:%1",_ID] call RRPServer_DB_selectFull;
	_constructionObject setVariable ["ltdItems",_dataStore,true];
	missionNamespace setVariable [format ["LTD_%1",_data # 0],[(_data # 1),(_data # 2),(_data # 11),(_data # 4),(_data # 6)]];
	RRPServerIDJIPAction = RRPServerIDJIPAction + 1;
	[_constructionObject,[format ["%1",(_constructionObject getVariable ["ltdName",""])],RRPClient_ltd_shopMenu,"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player) && (cursorObject isKindOf 'LtdsStore')"]] remoteExecCall ["addAction",-2,format["ActionLTD_%1",RRPServerIDJIPAction]];

	[_constructionObject,["Приобрести лотерейный билет",{[0] call RRPClient_lottery_checklotteryinput},"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player) && (cursorObject isKindOf 'LtdsStore')"]] remoteExecCall ["addAction",-2,format["ActionLTD_%1",RRPServerIDJIPAction + round(random(9999))]];
	[_constructionObject,["Проверить выигрыши лотереи",{[3] call RRPClient_lottery_checklotteryinput},"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player) && (cursorObject isKindOf 'LtdsStore')"]] remoteExecCall ["addAction",-2,format["ActionLTD_%1",RRPServerIDJIPAction + round(random(9999))]];

	format ["Store %1 loaded  #1011",_data select 1] call RRPServer_util_debugConsole;
	_constructionObject

};

private["_continueLoading", "_page", "_pageSize", "_ltdIDs", "_numberOfLTD", "_i"];
"Loading ltds objects from database... #0101" call RRPServer_DB_log;

_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_ltdIDs = format ["loadingIdPageLtdsObject:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfLTD = count _ltdIDs;
	if (_numberOfLTD > 0) then 
	{
		for "_i" from 0 to _numberOfLTD - 1 do 
		{
			((_ltdIDs select _i)select 0) call _load;
		};
	};
	_page = _page + 1;
	if (_numberOfLTD < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading ltds objects from database... #0101" call RRPServer_DB_log;
true