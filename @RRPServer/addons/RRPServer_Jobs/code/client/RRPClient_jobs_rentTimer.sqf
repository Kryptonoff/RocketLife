/*

	Filename: 	RRPClient_jobs_rentTimer.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !(params [
		["_vehicle",objNull,[objNull]],
		["_timer_name","",[""]]
	]) throw "Параметры не прошли фильтр";

	disableSerialization;
	private _timer = [_timer_name] call RRPClient_gui_util_createTimer;
	private _price = getNumber(missionConfigFile >> "CfgJobs" >> "life_carrent_price");
	private _start_time = time;
	[{
		params ["_args","_handle"];
		_args#0 ctrlSetText format ["Время аренды: %1",[(time - _args#3),"HH:MM"] call BIS_fnc_secondsToString];
		_vehicle = _args#2;
		_cost = if (objectParent player isEqualTo _vehicle) then {_args select 1} else {(_args select 1) / 2}; 

		if (_cost > RRPClientAtmMoney) exitWith {
			["Работа", "У вас закончились деньги на банковском счете, аренда завершена"] call toastError;
			[_handle] call CBA_fnc_removePerFrameHandler;
			[_args#4] call RRPClient_gui_DestroyRscLayer;
			_vehicle setVelocity[0, 0, 0];
			[_vehicle] remoteExecCall ["RRPClient_jobs_carsharingStop",2];
		};
		if (!(alive _vehicle) OR isNull _vehicle) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;[_args#4] call RRPClient_gui_DestroyRscLayer};
		
		
		[player,"atm","take", _cost] remoteExecCall ["RRPServer_system_moneyChange",2];
		format ["С вас списано $%1 за аренду машины", _cost] call chat;	
	},60,[_timer,_price,_vehicle,_start_time,_timer_name]] call CBA_fnc_addPerFrameHandler;
} catch {
	["Работа", _exception] call toastError;
};
