RRPClient_containers_virtual_openMenu = {
params [
	"_action"
];

try
{
	switch _action do
	{
		case "request": 
		{
			_vehicle = objNull;
			switch (true) do 
			{
				case (!(isNull objectParent player) && {alive(objectParent player)} && {(objectParent player) in life_vehicles} && {locked(objectParent player) == 0}):
				{
					_vehicle = objectParent player;
				};
				case (isNull objectParent player && {alive cursorObject} && {player distance cursorObject < 7}):
				{
					switch (true) do 
					{
						case ([cursorObject] call RRPClient_system_isVehicleKind):
						{
							if (cursorObject in life_vehicles OR {locked cursorObject isEqualTo 0}) then 
							{
								_vehicle = cursorObject;
							};
						};
						case ((typeOf cursorObject) isEqualTo "Land_LuggageHeap_03_F"):
						{
							_house = cursorObject getVariable["house_box_inHouse", objNull];
							if (!isNull _house && {!isNil {_house getVariable "house_owner"} && !(_house getVariable["locked", false])}) then 
							{
								_vehicle = cursorObject;
							};
						};
						case ((typeOf cursorObject) isEqualTo "Box_Wps_F"):
						{
							_vehicle = cursorObject;
						};
						case ((typeOf cursorObject) == getText(missionConfigFile >> "LifeCfgSettings" >> "life_trunkClass")):
						{
							if !(cursorObject getVariable["locked", false]) then {
								_vehicle = cursorObject;
							};
						};
						case ((typeOf cursorObject) in getArray(missionConfigFile >> "LifeCfgArcheology" >> "spawnItem")):
						{
							_vehicle = cursorObject;
						};
					};
				};
			};
			if (isNull _vehicle) throw "Хранилище не определено";
			if (_vehicle getVariable["trunk_inUseBy", ""] != "") then {
				if (_vehicle getVariable["trunk_inUseBy", ""] != getPlayerUID player) throw "Уже используется";
			};
			if ((typeOf _vehicle) isEqualTo "O_Truck_03_device_F" && (!isNil {_vehicle getVariable "mining"})) throw "Дождитесь пока устройство закончит работу...";
			if ([_vehicle] call RRPClient_system_isTrunkInUse) throw "Уже используется";
			"Отправили серверу" call chat;
			[SessionId,_vehicle] remoteExecCall ["RRPServer_containers_virtual_openMenu",2];
		};
		case "response": 
		{
			_vehicle = param [1,objNull,[objNull]];
			_trunk = _vehicle getVariable["Trunk",[[],0]];
			createDialog "UnionDialogTrunk";
			switch (true) do {
				case ((typeOf _vehicle) isEqualTo "Land_LuggageHeap_03_F"):
				{
					_house_box_slots = _vehicle getVariable["house_box_slots", 0];
					private _mWeight = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_virtualMax")) * _house_box_slots;
					_veh_data = [_mWeight, _trunk select 1];
					ctrlSetText[3501, format["Домашний ящик - %1", getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")]];
				};

				case ((typeOf _vehicle) isEqualTo getText(missionConfigFile >> "LifeCfgSettings" >> "life_trunkClass")):
				{
					private _trunk_slots = _vehicle getVariable["slots", 1];
					private _mWeight = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_trunkVirtualWeight")) * _trunk_slots;
					_veh_data = [_mWeight, _trunk select 1];
					ctrlSetText[3501, "Хранилище банды"];
				};

				case ((typeOf _vehicle) isEqualTo getText(missionConfigFile >> "LifeCfgSettings" >> "life_vaultBoxClass")):
				{
					private _mWeight = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_vaultBoxVirtualWeight");
					_veh_data = [_mWeight, _trunk select 1];
					ctrlSetText[3501, "Национальный Резерв"];
				};

				case ((typeOf _vehicle) in getArray(missionConfigFile >> "LifeCfgArcheology" >> "spawnItem")):
				{
					_veh_data = [120, 120];
					ctrlSetText[3501, format["%1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
				};

				case ((typeOf _vehicle) isEqualTo "Box_Wps_F"):
				{
					_veh_data = [120, 120];
					ctrlSetText[3501, format["%1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
				};
				default 
				{
					_veh_data = [_vehicle] call RRPClient_system_vehicleWeight;
					ctrlSetText[3501, format["Багажник - %1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
				};
			};

			if ((typeOf _vehicle) isEqualTo "Land_LuggageHeap_03_F" && {_house_box_slots isEqualTo 0}) then {
				closeDialog 0;
				throw "У вас не добавлены слоты для хранения вещей";
			};
			if ((_veh_data select 0) isEqualTo - 1) then {
				closeDialog 0;
				throw "Этот транспорт не способен хранить виртуальные предметы.";
			};
			[player,"open_trunk"] remoteExecCall ["RRPClient_system_say3d",0];
			[_vehicle, "trunk_inUseBy", getPlayerUID player] call CBA_fnc_setVarNet;

			life_veh_trunk_sync = +(_trunk select 0);
			life_trunk_vehicle = _vehicle;

			[_vehicle] call RRPClient_system_vehInventory;
		};
		case "error": {
			throw (param [1,"",[""]]);
		};
	};
}catch{
	["ErrorTitleAndText",["Хранилище",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
};
["request"] call RRPClient_containers_virtual_openMenu