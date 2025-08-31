/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

private _isEmptyArray = {
	private _save = false;
	private _deathmarkers = life_death_markers;
	reverse _deathmarkers;
	{
		_sessionId = _x param [3];
		if (_sessionId isNotEqualTo RRPPublicSessionID) then {
			_deathmarkers deleteAt _forEachIndex;
			_save = true;
		};
	} forEach _deathmarkers;
	if (_save) then {[["life_death_markers",life_death_markers,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec};
	life_death_markers = _deathmarkers;

	life_death_markers isEqualTo []
};

try {

	if (call _isEmptyArray) throw "";
	if (missionNamespace getVariable ["deathTimerActive",false]) throw "";
	if (player call getSide isEqualTo "med") throw "";
	if (((player call getSide) isEqualTo "cop")  and {(["cop"] call RRPClient_system_playerCount) < (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_cop_min"))}) throw "";
	call RRPClient_dz_createMarker;
	["WarningTitleAndText", ["Новая жизнь", "В зоне «НОВОЙ ЖИЗНИ» некоторые функции игры будут отключены!"]] call SmartClient_gui_toaster_addTemplateToast;

	missionNamespace setVariable ["deathTimerActive",true];
	private _isUseEffects = false;
	while {!(life_death_markers isEqualTo [])} do
	{
		private _inZone = false;
		{
			private ["_marker","_markerPos","_endTime"];
			_marker = _x # 0;
			_markerPos = _x # 1;
			_endTime = _x # 2;
			("death_warn_" + _marker) setMarkerTextLocal format ["Место смерти! Таймер: %1",([(_endTime - time)/60, "HH:MM"] call BIS_fnc_timeToString)];

			if (time >= _endTime) then {
				["WarningTitleAndText", ["Зона сметри удалена!", format ["Локация: %1",([_markerPos] call mav_taxi_fnc_nearestLocation)]]] call SmartClient_gui_toaster_addTemplateToast;
				[_x] call RRPClient_dz_deathZoneDelete;
				false call RRPClient_dz_deathZoneEffectUI;
			};
			if ((_markerPos distance player) < 500) then {
				_inZone = true;
			};
		} forEach life_death_markers;

		if (_inZone) then {
			if !(_isUseEffects) then {
				true call RRPClient_dz_deathZoneEffectUI;
				_isUseEffects = true;
			};
		} else {
			if (_isUseEffects) then {
				false call RRPClient_dz_deathZoneEffectUI;
				_isUseEffects = false;
			};
		};
		uiSleep 15;
	};
	missionNamespace setVariable ["deathTimerActive",nil];
} catch {
	if !(_exception isEqualTo "") then {
		["WarningTitleAndText", ["Зона сметри", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	};
};
