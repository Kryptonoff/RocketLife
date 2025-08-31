/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _fnc = {
private ["_query","_obj","_saveRequired","_inv"];
_query = format ["getGangContainers:%1",_this] call RRPServer_DB_selectSingle;
_query params ["_vardb","_inventory","_trunk","_slots","_owner","_members",["_color",""],["_picture",""]];
_obj = missionNameSpace getVariable [_vardb,objNull];

if !(isNull _obj) then 
{
	_saveRequired = false;
	_inv = _inventory select 0;
	_weight = 0;
	{
		_itemDetails = [_x#0] call RRPClient_util_itemDetails;
		if (_itemDetails isEqualTo []) then 
		{
			format ["GangBox Error: Предмета %1 в ящике %2 не существует в моде, предмет удален #1001",_x#0,_vardb] call RRPServer_util_debugConsole;
			_inv deleteAt _forEachIndex;
			_saveRequired = true;
		}else{
			_weight = _weight + ((_itemDetails select 6) * (_x select 1));
		};
	}forEach _inv;
	_inventory set [1,_weight];

	_obj setVariable ["VarDB", _vardb, true];
	_obj setVariable ["inventory", _inventory, true];
	_obj setVariable ["Trunk", _trunk, true];
	_obj setVariable ["locked", true, true]; 
	_obj setVariable ["slots", _slots, true];
	_obj setVariable ["t_owner", _owner, true];
	_obj setVariable ["members", _members, true];
	_config = missionConfigFile >> "CfgTrunkColors";
	_obj setObjectTextureGlobal [0,getText(_config >> "Pictures" >> _picture >> "textures")];
	_obj setObjectTextureGlobal [1,getText(_config >> "Coloring" >> _color >> "textures")];
		
	if _saveRequired then 
	{
		[netId _obj] call RRPServer_containers_gang_UpdateDB;
		_this call _fnc;
	};
}else{
	format ["GangBox Error: Хранилища с переменной %1 не существует #1001",_vardb] call RRPServer_util_debugConsole;
};

_obj
};

private["_continueLoading", "_page", "_pageSize", "_gangIDs", "_numberOfGang", "_i"];
"Loading gang containers database...  #0101" call RRPServer_util_debugConsole;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_gangIDs = format ["loadingIdPageGangContainer:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_numberOfGang = count _gangIDs;
	if (_numberOfGang > 0) then 
	{
		for "_i" from 0 to _numberOfGang - 1 do 
		{
			((_gangIDs select _i)select 0) call _fnc;
		};
	};
	_page = _page + 1;
	if (_numberOfGang < 100) then
	{
		_continueLoading = false;
	};
};
"Done loading gang containers!  #0101" call RRPServer_util_debugConsole;
true
