
if (isNull life_cs_vehicle) exitWith {
	life_cs_start = 0;
	life_cs_vehicle = objNull;
	life_cs_renting = false;
	["carsharing"] call RRPClient_gui_DestroyRscLayer;
	deleteMarkerLocal format["%1_cs",getPlayerUID player];
};
life_cs_vehicle setVelocity[0, 0, 0];
if !(alive life_cs_vehicle) exitWith {
	_fine = getNumber(getMissionConfig "CfgCar2Go" >> "fine_notRoad") * 10;
	if (_fine > RRPClientAtmMoney) then {
		life_cs_warn = life_cs_warn + 1;
		["Car2Go",format["Вы уничтожили автомобиль, так как у вас нет средств на погашение штрафа, вы получили %1-е предупреждение в сервисе", life_cs_warn]] call toastError;
	} else {
		[player,"atm","take",_fine] remoteExecCall ["RRPServer_system_moneyChange",2];
		["Car2Go",format["Вы уничтожили автомобиль, с вас будет списано $%1 в качестве штрафа", _fine]] call toastError;
	};
	life_cs_start = 0;
	life_cs_vehicle = objNull;
	life_cs_renting = false;
	["carsharing"] call RRPClient_gui_DestroyRscLayer;
	deleteMarkerLocal format["%1_cs",getPlayerUID player];
};
private _fine = 0;
private _text = "";
private _warns = 0;

private _nearestLoc = nearestLocations [player, ["NameCity","NameVillage", "NameCityCapital"], 1100] select 0;
if (isNil "_nearestLoc") then {
	_fine = _fine + getNumber(getMissionConfig "CfgCar2Go" >> "fine_distance");
	_text = _text + "Автомобиль был оставлен вне разрешенной зоны<br/>";
	_warns = _warns + 1;
};

private _parts_damaged = {life_cs_vehicle getHitPointDamage _x > 0.65} count ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody"];
if (_parts_damaged > 0) then {
	_fine = _fine + (_parts_damaged * getNumber(getMissionConfig "CfgCar2Go" >> "fine_damage"));
	_text = _text + "У автомобиля были обнаружены существенные повреждения<br/>";
	_warns = _warns + 1;
};

if !(isOnRoad life_cs_vehicle) then {
	_fine = _fine + getNumber(getMissionConfig "CfgCar2Go" >> "fine_notRoad");
	_text = _text + "Автомобиль был оставлен не на дороге<br/>";
	_warns = _warns + 1;
};

if (_warns > 0) then {
	if (_fine > RRPClientAtmMoney) then {
		life_cs_warn = life_cs_warn + _warns;
		[format["После прекращения аренды были выявлены следующие нарушения:<br/>%1. Так как у вас нет средств на погашение штрафа, вы получили %2-е предупреждение в сервисе", _text, life_cs_warn],"info"] call hints;
	} else {
		private _action = [
			parseText format["После прекращения аренды были выявлены следующие нарушения:<br/>%1 Вы готовы оплатить штраф в размере $%2? Если вы откажетесь, вы получите %3-е предупреждение в сервисе", _text, _fine, life_cs_warn + _warns],
			"Нарушения при прекращении аренды",
			"Да",
			"Нет"
		] call BIS_fnc_guiMessage;
		if (_action) then {
			[player,"atm","take",_fine] remoteExecCall ["RRPServer_system_moneyChange",2]
		} else {life_cs_warn = life_cs_warn + 1};
	};
};

[life_cs_vehicle] remoteExecCall ["RRPClient_jobs_carsharingStop",2];
["carsharing"] call RRPClient_gui_DestroyRscLayer;
life_vehicles = life_vehicles - [life_cs_vehicle];
life_cs_start = 0;
life_cs_vehicle = objNull;
life_cs_renting = false;
deleteMarkerLocal format["%1_cs",getPlayerUID player];

["Аренда автомобиля завершена", "done"] call hints;
// [["vehicle",format["%1 (%2) ended rent",GVAR_RNAME(player),steamid]],"customLog"] call AvalonClient_system_hcExec;