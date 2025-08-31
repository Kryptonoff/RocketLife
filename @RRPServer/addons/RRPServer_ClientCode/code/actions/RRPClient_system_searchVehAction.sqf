/*
	Filename: 	RRPClient_system_searchVehAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _vehicle = param [0,objNull,[objNull]];
	if (player distance _vehicle > 10 OR !alive _vehicle) throw "Транспорт не найден";
	if !([_vehicle] call RRPClient_system_isVehicleKind) throw "Это не техника";

	call RRPClient_actions_inUse;
	private _ret = "";
	uiSleep 1;
	life_action_inUse = false;

	private _dbInfo = _vehicle GVAR ["dbInfo",[]];

	if (player call getSide in ["cop","med"]) then {
		private _owners = _vehicle GVAR ["vehicle_info_owners",[]];
		if (EQUAL(_owners,[])) then {  deleteVehicle _vehicle; throw "Информация о владельце не найдена. Возможно читер.";};		
		_owners = [_owners] call RRPClient_system_vehicleOwners;
		if (EQUAL(_owners,"any<br/>")) then {
			_owners = "Нет владельцев. Конфискуйте<br/>";
		};

		private _plate = if (count _dbInfo > 0) then {[_dbInfo select 1] call RRPClient_system_plateColor} else {"Прокат"};
		[format ["<t color='#5ad400' size='1.7'>" +  "Информация о технике" + "</t><br/><br/>
		<t color='#ffffff' size='1.5'>" +  "Владельцы" + "</t><br/><br/>%1<br/><br/><t size='1.3'><t color='#ffffff'>" +  "Номер" + ":</t> %2</t>",_owners,_plate]] call hints;
	} else {
		private _plate = if (count _dbInfo > 0) then {[_dbInfo select 1] call RRPClient_system_plateColor} else {"Прокат"};	
		format ["<t color='#5ad400' size='1.7'>" +  "Информация о технике" + "</t><br/><br/>
		<t size='1.3'><t color='#ffffff'>" +  "Номер" + ":</t> %1</t>",_plate] call hints;	
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};