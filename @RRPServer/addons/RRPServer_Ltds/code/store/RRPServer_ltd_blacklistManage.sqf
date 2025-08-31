/*
	Project: Companies for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params
[
	"_mode",
	["_shop",objNull,[objNull]],
	["_ltdId",-1,[-1]],
	["_myID",-1,[-1]]
];

try
{
	if (isNull _shop) throw "Магазин NULL";
	private _blacklist = _shop getVariable ["ltdBC",[]];
	if (_ltdId isEqualTo -1) throw "";
	private _shopID = _shop getVariable ["ltdID",-1];
	if (_shopID isEqualTo -1) throw "Проблема с ID магазина";
	if (_myID isEqualTo -1) throw "Проблема с ID OOO";
	if (_shopID isEqualTo _ltdId) throw "Нельзя добавить в черный список свою же компанию!";
	
	switch (_mode) do
	{
		//--------------------- To blacklist
		case 1:
		{
			if (_ltdId in _blacklist) throw "Выбранная компания уже в черном списке";
			private _newBlacklist = +_blacklist;
			_newBlacklist pushBack _ltdId;
			_shop setVariable ["ltdBC",_newBlacklist,true];
			format ["updateBlacklist:%1:%2",_newBlacklist,_shopID] call RRPServer_DB_fireAndForget;
			["SuccessTitleOnly", ["Выбранная компания внесена в черный список!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		//--------------------- From blacklist
		case 2:
		{
			if (_blacklist isEqualTo []) throw "В ЧС и так никого нет";
			
			private _newBlacklist = +_blacklist;
			_newBlacklist deleteAt (_newBlacklist find _ltdId);
			_shop setVariable ["ltdBC",_newBlacklist,true];
			format ["updateBlacklist:%1:%2",_newBlacklist,_shopID] call RRPServer_DB_fireAndForget;
			["SuccessTitleOnly", ["Выбранная компания удалена из черного списка!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
		};
		default {};
	};
	[] remoteExecCall ["RRPClient_ltd_trashResponse",remoteExecutedOwner];
}catch{
	_exception call RRPServer_util_log;
	["ErrorTitleOnly", [_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};