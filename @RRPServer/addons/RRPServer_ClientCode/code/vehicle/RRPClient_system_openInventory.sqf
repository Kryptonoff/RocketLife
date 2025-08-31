/*
	Filename: 	RRPClient_system_openInventory.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_vehicle","_veh_data","_waitingtime","_house_box_slots","_house","_trunk"];
try{
	if(dialog and {(isNull findDisplay 1000)}) throw "???";
	if(life_action_inUse) throw "Вы чем-то заняты...";

	_vehicle = objNull;
	switch(true) do {
		case (!(NOTINVEH(player)) && {alive (objectParent player)} && {(objectParent player) in life_vehicles} && {locked (objectParent player) == 0}): {
			_vehicle = objectParent player;
		};
		case (NOTINVEH(player) && {alive cursorObject} && {player distance cursorObject < 7}): {
			switch(true) do {
				case ([cursorObject] call RRPClient_system_isVehicleKind): {
					if (cursorObject in life_vehicles OR {EQUAL(locked cursorObject,0)}) then {
						_vehicle = cursorObject;
					};
				};
				case (EQUAL((typeOf cursorObject),"Land_LuggageHeap_03_F")): {
					_house = cursorObject GVAR ["house_box_inHouse",objNull];
					if (!isNull _house && {!isNil {_house GVAR "house_owner"} && !(_house GVAR ["locked",false])}) then {
						_vehicle = cursorObject;
					};
				};
				case (EQUAL((typeOf cursorObject),"Box_Wps_F")): {
					_vehicle = cursorObject;
				};
				case ((typeOf cursorObject) == LIFE_SETTINGS(getText,"life_trunkClass")): {
					if !(cursorObject GVAR ["locked",false]) then {
						_vehicle = cursorObject;
					};
				};
				case ((typeOf cursorObject) in ARC_SETTINGS(getArray,"spawnItem")): {
					_vehicle = cursorObject;
				};
			};
		};
	};

	if (isNull _vehicle) exitWith {};
	if (_vehicle GVAR ["trunk_inUseBy",""] != "") then
	{
		if (_vehicle GVAR ["trunk_inUseBy",""] != steamid) throw "Уже используется";
	};
	if (EQUAL((typeOf _vehicle),"O_Truck_03_device_F") && {(!isNil {_vehicle GVAR "mining"})} ) throw "Дождитесь пока устройство закончит работу...";
	if ([_vehicle] call RRPClient_system_isTrunkInUse) throw "Багажник уже используется.";

	disableSerialization;
	if !(createDialog "UnionDialogTrunk") throw "Не удалось создать диалог.";
	waitUntil {!isnull (findDisplay 3500)};

	_trunk = _vehicle GVAR ["Trunk",[[],0]];

	switch (true) do {
		case (EQUAL((typeOf _vehicle),"Land_LuggageHeap_03_F")): {
			_house_box_slots = _vehicle GVAR ["house_box_slots",0];
			private _mWeight = (LIFE_SETTINGS(getNumber,"life_virtualMax")) * _house_box_slots;
			_veh_data = [_mWeight,_trunk select 1];
			ctrlSetText[3501,format[("Домашний ящик")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")]];
		};

		case ((typeOf _vehicle) isEqualTo LIFE_SETTINGS(getText,"life_trunkClass")): {
			private _trunk_slots = _vehicle GVAR ["slots",1];
			private _mWeight = (LIFE_SETTINGS(getNumber,"life_trunkVirtualWeight")) * _trunk_slots;
			_veh_data = [_mWeight,_trunk select 1];
			ctrlSetText[3501,"Хранилище банды"];
		};

		case ((typeOf _vehicle) isEqualTo LIFE_SETTINGS(getText,"life_vaultBoxClass")): {
			private _mWeight = LIFE_SETTINGS(getNumber,"life_vaultBoxVirtualWeight");
			_veh_data = [_mWeight,_trunk select 1];
			ctrlSetText[3501,"Национальный Резерв"];
		};

		case ((typeOf _vehicle) in ARC_SETTINGS(getArray,"spawnItem")): {
			_veh_data = [120,120];
			ctrlSetText[3501,format["%1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
		};

		case (EQUAL((typeOf _vehicle),"Box_Wps_F")): {
			_veh_data = [120,120];
			ctrlSetText[3501,format["%1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
		};

		default {
			_veh_data = [_vehicle] call RRPClient_system_vehicleWeight;
			ctrlSetText[3501,format[("Багажник")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
		};
	};

	if (EQUAL((typeOf _vehicle),"Land_LuggageHeap_03_F") && {EQUAL(_house_box_slots,0)}) throw "У вас не добавлены слоты для хранения вещей";
	if (EQUAL((_veh_data select 0),-1)) throw "Этот транспорт не способен хранить виртуальные предметы.";

	player say3D "open_trunk";
	[_vehicle,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;

	life_veh_trunk_sync = +(_trunk select 0);
	life_trunk_vehicle = _vehicle;

	[_vehicle] call RRPClient_system_vehInventory;

	_vehicle spawn {
		while {true} do {
			if(_this GVAR ["trunk_inUseBy",""] != steamid) exitWith 
			{
				[_this,"trunk_inUseBy"] call RRPClient_system_clearGlobalVar;
				throw "Инвентарь уже используется другим игроком.";
			};

			if(isNull (findDisplay 3500)) exitWith 
			{
				[_this,"trunk_inUseBy"] call RRPClient_system_clearGlobalVar;
				private _data = (_this GVAR ["Trunk",[[],0]]) select 0;

				switch (true) do {
					case (EQUAL((typeOf _this),"Land_LuggageHeap_03_F")): 
					{
						if !(EQUAL(life_veh_trunk_sync,_data)) then 
						{
							life_veh_trunk_sync = [];
							[_this,player] remoteExecCall ["RRPServer_house_updateHouseContainers",2];
							call RRPClient_system_saveGear;
						};
					};
					case ((typeOf _this) in ARC_SETTINGS(getArray,"spawnItem") OR EQUAL((typeOf _this),"Box_Wps_F")): 
					{
						if (EQUAL(_data,[])) then {
							if ((EQUAL((magazineCargo _this),[])) && {(EQUAL((WeaponCargo _this),[]))} && {(EQUAL((itemCargo _this),[]))}) then {
								deleteVehicle _this;
							};
						};
					};
					default {
						if !(EQUAL(life_veh_trunk_sync,_data)) then 
						{
							life_veh_trunk_sync = [];
						};
					};
				};
			};

			uiSleep 0.03;
		};
	};
}catch{
	["Инвентарь",_exception] call toastError;
	closeDialog 0;
};