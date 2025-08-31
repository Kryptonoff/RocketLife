/*
	
	Filename: 	RRPClient_delivery_getMissionMenu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private["_nearVehicles","_cargoDepo","_control","_displayName","_className","_picture","_cargoDeliver","_fromTitle","_toTitle","_vehicle","_title","_getButton","_doneButton","_price","_depos"];

try{
	life_depo = param [0,ObjNull,[ObjNull]];
	if (life_action_inUse) throw "Вы чем то заняты...";

	_nearVehicles = nearestObjects[life_depo,["LandVehicle"],25];
	if(count _nearVehicles > 0) then {
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x GVAR ["vehicle_info_owners",[]];		
			if(count _vehData  > 0 && (typeOf _x) in ["B_Truck_01_mover_F","C_Offroad_01_F","C_Van_01_transport_F"]) then {
				_vehOwner = (_vehData select 0) select 0;
				if((steamid) == _vehOwner) exitWith {
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};

	if(isNil "_vehicle") throw "Проверьте, чтобы ваш грузовик был рядом и повторите попытку";
	if(isNull _vehicle) throw "Техника не определена";
	if(!(_vehicle in life_vehicles)) throw "У вас нет ключей от этой техники";

	_cargoDeliver = _vehicle GVAR ["cargoDeliver",[]];
	_displayName = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	_picture = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "picture");
	if (count _cargoDeliver > 0) throw "Вы уже взяли заказ на доставку";
	if (count (attachedObjects _vehicle) > 0) throw "На вашей технике нет места для контейнера из-за модификация или другого контейнера...";

	disableSerialization;
	if(isNull (findDisplay 4300)) then {
		if !(createDialog "UnionDialogDeliver") exitWith {};
	};

	_title = CONTROL(4300,4301);
	_control = CONTROL(4300,4302);
	_getButton = CONTROL(4300,4303);
	_doneButton = CONTROL(4300,4304);

	_depoName = [str(life_depo)] call RRPClient_system_varToStr;

	_title ctrlSetText format["Заказ на доставку груза из депо %1",_depoName];
	_getButton ctrlShow true;
	_doneButton ctrlShow false;
	lbclear _control;

	_depos = ["depo_kavala","depo_molos","depo_mazi","depo_tonos"];
	_depos = _depos - [str(life_depo)];

	{	
		_toTitle = [_x] call RRPClient_system_varToStr;		
		_price = [str(life_depo),_x,(typeOf _vehicle)] call RRPClient_delivery_price;
		
		_control lbAdd format["Доставка груза в депо %1 на %2",_toTitle,_displayName];
		_control lbSetData [(lbSize _control)-1,_x];
		_control lbSetPicture [(lbSize _control)-1,_picture];			
		_control lbSetTextRight [(lbSize _control)-1, format["Оплата: $%1",[_price] call RRPClient_util_numberText]];							
	} foreach _depos;

}catch{
	["ErrorTitleAndText",["Доставка", _exception]] call toast;
};