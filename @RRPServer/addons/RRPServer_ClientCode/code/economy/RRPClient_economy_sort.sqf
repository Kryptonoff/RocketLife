
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 32000;

(_display getVariable "filter") params ["_all","_cbLegal","_cbPrivate","_cbPublic","_cbillegal","_cbLocked"];
private _ret = [];
{
	_x params ["_resName", "_localize", "_sellprice", "_selled", "_max_selled", "_legal", "_prem", "_locked_time", "_locked_until"];
	if (cbChecked (_slide controlsGroupCtrl 32003)) then {_ret = RRPPublicEconomyArray; break};
	if ((cbChecked (_slide controlsGroupCtrl 32005)) && {_legal}) then {_ret pushBackUnique _x};
	if ((cbChecked (_slide controlsGroupCtrl 32007)) && {_prem}) then {_ret pushBackUnique _x};
	if ((cbChecked (_slide controlsGroupCtrl 32009)) && {!_prem}) then {_ret pushBackUnique _x};
	if ((cbChecked (_slide controlsGroupCtrl 32011)) && {!_legal}) then {_ret pushBackUnique _x};
	if ((cbChecked (_slide controlsGroupCtrl 32013)) && {!(_locked_until isEqualTo "")}) then {_ret pushBackUnique _x};
}forEach RRPPublicEconomyArray;

_ret
