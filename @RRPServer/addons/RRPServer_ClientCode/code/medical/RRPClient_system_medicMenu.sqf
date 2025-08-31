
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet", displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 34000;
private _cPlayerList = _slide controlsGroupCtrl 34002;

private _ctrlMap = _display ctrlCreate ["RscMapControl", 34011, _slide];
_ctrlMap ctrlMapSetPosition [0.3 * safeZoneW, 0.198 * safeZoneH, 0.190796 * safeZoneW, 0.274978 * safeZoneH];
_ctrlMap ctrlMapAnimAdd [0, ctrlMapScale _ctrlMap, player];
ctrlMapAnimCommit _ctrlMap;

lbClear _cPlayerList;
private "_statustext";
{
	if ((_x getVariable ["realname", ""] != "") && (alive _x) && (_x getVariable ["lifeState", ""] isEqualTo "INCAPACITATED") && (((_x getVariable ["medicStatus", []]) select 0) >= 0)) then {
		_statustext = switch ((_x getVariable ["medicStatus", []]) select 0) do
		{
			case 0: {"Ожидает"};
			case 1: {"Отказано"};
			case 2: {"Вызов принят"};
			case 3: {"Ожидает. Идет бой"};
			case 4: {"Ожидает. Военное положение"};
			case 5: {"Отказано. Красная зона"};
			case 6: {"Отказано. Черный список"};
			case 7: {"Отказано. В розыске"};
		};
		_cPlayerList lbAdd format["%1", _x getVariable ["realname", ""]];
		_cPlayerList lbSetTextRight [(lbSize _cPlayerList)-1, format["[ %1 %2]", _statustext, ((_x getVariable ["medicStatus", []]) select 1)]];
		_cPlayerList lbSetData [(lbSize _cPlayerList)-1, netId _x];
	};
} forEach playableUnits;
