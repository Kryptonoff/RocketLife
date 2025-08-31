/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private["_continueLoading", "_page", "_pageSize", "_houseIDs", "_numberOfHouse", "_i"];
_load = {
	private _query = format ["loadLtdSlots:%1",_this] call RRPServer_DB_selectSingle;
	_query params [
		["_name",""],
		["_objectStr",""],
		["_ltd_id",-1],
		["_bank",0],
		["_bankLimit",10000],
		["_currency","AD"]
	];
	_slotObject = call compile _objectStr;
	if (isNull _slotObject) exitWith {objNull};
	_slotObject setVariable ["ltdID",_this,true];
	_slotObject setVariable ["ltdName",_name,true];
	_slotObject setVariable ["ltdOwner",_ltd_id,true];
	_slotObject setVariable ["ltdSBank",_bank,true];
	_slotObject setVariable ["ltdSBLim",_bankLimit,true];
	_slotObject setVariable ["ltdCurrency",_currency];
	RRPServerIDJIPAction = RRPServerIDJIPAction + 1;
	format ["Slots: %1 (%2) loaded #0101",_name,_objectStr] call RRPServer_util_debugConsole;
	[_slotObject,[format ["Слотмашина - %1",(_slotObject getVariable ["ltdName",""])],RRPClient_ltd_slots_start,"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player)"]] remoteExecCall ["addAction",-2,format["ActionLTD_%1",RRPServerIDJIPAction]];
	[_slotObject,[format ["Управление  - %1",(_slotObject getVariable ["ltdName",""])],{["openMenu",_this#0] call RRPClient_ltd_slots_admin},"",0,false,false,"",format ["(!isNull cursorObject) && (isNull objectParent player) AND (RRPClientLTDsData#0 isEqualTo %1)",_ltd_id]]] remoteExecCall ["addAction",-2,format["ActionLTDAD_%1",RRPServerIDJIPAction]];

	[_slotObject,["Приобрести лотерейный билет",{[0] call RRPClient_lottery_checklotteryinput},"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player) && (cursorObject isKindOf 'LtdsStore')"]] remoteExecCall ["addAction",-2,format["ActionLTD_%1",RRPServerIDJIPAction + round(random(9999))]];
	[_slotObject,["Проверить выигрыши лотереи",{[3] call RRPClient_lottery_checklotteryinput},"",0,false,false,"","(!isNull cursorObject) && (isNull objectParent player) && (cursorObject isKindOf 'LtdsStore')"]] remoteExecCall ["addAction",-2,format["ActionLTD_%1",RRPServerIDJIPAction + round(random(9999))]];

	_slotObject
};

"Loading ltd slots from database... #1111" call RRPServer_util_debugConsole;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do
{
	_houseIDs = format ["loadingIdPageSlots:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfHouse = count _houseIDs;
	if (_numberOfHouse > 0) then
	{
		for "_i" from 0 to _numberOfHouse - 1 do
		{
			((_houseIDs select _i)select 0) call _load;
		};
	};
	_page = _page + 1;
	if (_numberOfHouse < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading ltd slots! #0101" call RRPServer_util_debugConsole;
true
