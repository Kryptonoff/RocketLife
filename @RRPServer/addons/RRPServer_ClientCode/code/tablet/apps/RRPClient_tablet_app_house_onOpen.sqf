disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;

private _memberList = 	_slide controlsGroupCtrl 22002;
private _sellBtn = 		_slide controlsGroupCtrl 22003;
private _upgradeBtn = 	_slide controlsGroupCtrl 22004;
private _kickBtn = 		_slide controlsGroupCtrl 22005;
private _inviteBtn = 	_slide controlsGroupCtrl 22006;
private _houseCombo = 	_slide controlsGroupCtrl 22007;
private _payTimeText = 	_slide controlsGroupCtrl 22008;
private _payBtn = 		_slide controlsGroupCtrl 22009;
private _lightsBtn = 	_slide controlsGroupCtrl 22010;
private _secBtn = 		_slide controlsGroupCtrl 22011;
private _trunkBtn = 	_slide controlsGroupCtrl 22012;
private _listAllPlayer =_slide controlsGroupCtrl 22013;
private _setNameBtn = 	_slide controlsGroupCtrl 22014;
private _setNameBox = 	_slide controlsGroupCtrl 22015;

lbClear _houseCombo;
{
	if !(_x isEqualTo "") then
	{
		_house = objectFromNetId _x;
		_name = _house getVariable ["house_name",""];
		_index = _houseCombo lbAdd _name;
		_houseCombo lbSetData [_index,_x];
	};
} forEach life_netID_Houses;
_houseCombo lbSetCurSel 0;

private _near_units = [];
{
	if (player distance _x < 20) then {
		_near_units pushBack _x
	};
}forEach playableUnits;

lbClear _listAllPlayer;
{
	_indexInIds=[(getPlayerUID _x), life_ids] call RRPClient_system_index;
	if (!isNull _x && {alive _x} && {player distance _x < 20} && {_x != player} && (_indexInIds!=-1 or _x in (units (group player))) ) then {
		_listAllPlayer lbAdd format["%1", _x call getNickName];
		_listAllPlayer lbSetdata [(lbSize _listAllPlayer)-1,netId _x];
	};
}forEach _near_units;
lbSort [_listAllPlayer,"ASC"];
