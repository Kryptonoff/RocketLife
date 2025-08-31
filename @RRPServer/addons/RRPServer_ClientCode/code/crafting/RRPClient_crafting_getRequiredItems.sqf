/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ['_CurCfgName','_needetTools','_amount','_requiredTools','_itemInfo','_displayName'];

_CurCfgName = _this;
_needetTools = getArray(missionconfigfile >> 'LifeCfgRecipes' >> _CurCfgName >> 'requaredTools');
_requiredTools = '';
{
	_amount = [_x] call RRPClient_util_itemCount;
	if (_amount < 1) then {
		_itemInfo = [_x] call RRPClient_util_itemDetails;
		_displayName = _itemInfo select 1;
		 if (_forEachIndex isEqualto 0) then {
			 _requiredTools = _requiredTools + _displayName;
		 } else {
			 _requiredTools = _requiredTools + ' ,';
			 _requiredTools = _requiredTools + _displayName;
		 };
	};
} forEach _needetTools;

_requiredTools
