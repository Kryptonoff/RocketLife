private["_display", "_units", "_type", "_data", "_rowData", "_msg", "_west", "_east", "_civ", "_ind", "_isPhone", "_canUse"];
_type = param [0, 0];
_data = param [1, 0, ["", [], 0]];

disableSerialization;

private ["_cPlayerList", "_cMessageList", "_cMessageHeader", "_cMessageHeader"];
_display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
_group = _display displayCtrl 26000;
_cPlayerList = 		_group controlsGroupCtrl 88881;
_cMessageList = 	_group controlsGroupCtrl 88882;
_cMessageHeader = 	_group controlsGroupCtrl 88886;
_cMessageHeader ctrlSetText format["От кого: Сообщение:"];

ctrlEnable[887892, false];

private _isPhone = call RRPClient_system_canUsePhone;
private _canUse = if (player getVariable ["tf_unable_to_use_radio", false]) then {
	false
} else {
	true
};

switch (_type) do {
	case 1:
	{
		_msg = [_data select 2, 40] call RRPClient_kron_StrLeft;
		_rowData = [_data select 0, _data select 1, _data select 2, _data select 3];
		_cMessageList lnbAddRow[_data select 3, format["%1 ...", _msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1, 0], str(_rowData)];
	};
	
	case 2: {
		ctrlEnable[887892, true];
		life_smartphoneTarget = call compile format["%1", (lbData[88881, lbCurSel 88881])];
	};

	case 3: {
		lbClear _cMessageList;
		(player) remoteExecCall ["RRPServer_msg_cleanupMessages", 2];
	};
	
	case 4: {
		if (_isPhone) then {
			if !(_canUse) exitWith {
				["Вы не можете пользоваться телефоном со связанными руками", "error"] call hints
			};
			createDialog "UnionDialogSmartphoneTargetMessage";

			ctrlSetText[88886, format["Сообщение для: %1", life_smartphoneTarget call getFullname]];
			if ((call life_adminlevel) < 1) then {
				ctrlShow[888897, false];
			};
		} else {
			["Связь недоступна, так как у вас нет телефона в соответствующем слоте. Купите его в универсальном магазине или на заправках 24-7. Вы можете связаться только с администратором.", "error"] call hints;
		};
	};
};
