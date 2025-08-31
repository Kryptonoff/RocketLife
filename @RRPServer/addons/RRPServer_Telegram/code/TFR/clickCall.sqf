disableSerialization;

_display = uiNamespace getVariable ["RRPDialogTelegram",displayNull];

_ctrlList = _display displayCtrl 9001;
private _curSel = lbCurSel _ctrlList;

if (_curSel isEqualTo -1) exitWith {};

private _lbValue = _ctrlList lbValue _curSel;
private _playerUID = _ctrlList lbData _curSel;

if (_lbValue isEqualTo -1) exitWith {};

_unit = _playerUID call RRPClient_util_objectFromPlayerUID;
if (isNull _unit) exitWith {};

if (isNil "PhoneTaskForceRadioCall") then {
	_unit call TFAR_fnc_phoneCall;
}else{
	_netId = netId _unit;
	if ((_netId isEqualTo (PhoneTaskForceRadioCall select 1)) || (_netId isEqualTo (PhoneTaskForceRadioCall select 0))) then {
		call TFAR_fnc_hungUp;
	}else{
		_unit call TFAR_fnc_phoneCall;
	};
};
