
disableSerialization;
private _timer = ["carsharing"] call RRPClient_gui_util_createTimer;

private _markerName = format["%1_cs",getPlayerUID player];
private _marker = createMarkerLocal [_markerName, getPos life_cs_vehicle];
_marker setMarkerColorLocal "ColorOrange";
_marker setMarkerTypeLocal "c_car";
_marker setMarkerTextLocal "Арендуемый автомобиль";
private _price = getNumber(getMissionConfig "CfgCar2Go" >> "Cars" >> typeOf life_cs_vehicle >> "price");

[{
	params ["_args","_handle"];
	_args#0 ctrlSetText format ["Время аренды: %1",[(time - life_cs_start),"HH:MM"] call BIS_fnc_secondsToString];
	_args#1 setMarkerPosLocal getPos life_cs_vehicle;
	
	_cost = if (objectParent player isEqualTo life_cs_vehicle) then {_args select 2} else {(_args select 2) / 2}; 

	if (_cost > RRPClientAtmMoney) exitWith {
		["Car2Go","У вас закончились деньги на банковском счете, аренда завершена"] call toastError;
		[_handle] call CBA_fnc_removePerFrameHandler;
		[] call RRPClient_c2g_stop;
	};
	if (!(alive life_cs_vehicle) OR isNull life_cs_vehicle) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		[] call RRPClient_c2g_stop;
	};
	
	[player, "atm","take",_cost] remoteExecCall ["RRPServer_system_moneyChange",2];
	format["С вас списано $%1 за аренду машины", _cost] call chat;	
},60,[_timer,_marker,_price]] call CBA_fnc_addPerFrameHandler;