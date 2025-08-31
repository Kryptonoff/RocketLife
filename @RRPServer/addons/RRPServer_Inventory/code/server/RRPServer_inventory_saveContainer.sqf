/*

	Filename: 	RRPServer_inventory_saveContainer.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_container", objNull, [objNull]],
	["_mode", "", [""]],
	["_player", objNull, [objNull]]
];
if (isNull _container OR _mode isEqualTo "") exitWith {};
_player = owner _player;
switch (typeOf _container) do {
	case "Land_LuggageHeap_03_F": {
		_house = _container GVAR ["house_box_inHouse",objNull];
		if (isNull _house) exitWith {[0, "Не удалось определить дом, сообщите админу!"] remoteExecCall ["RRPClient_system_broadcast", _player]};
		
		_housePos = getPosATL _house;

		if (_mode isEqualTo "All") exitWith {
			_trunk = _container GVAR ["Trunk", [[], 0]];
			_inventory = _container GVAR ["inventory", [[], 0]];
			
			format["houseUpdateContainers:%1:%2:%3:%4", _trunk, _inventory, _housePos, typeOf _house] call RRPServer_DB_fireAndForget;
		};

		_items = _container getVariable [_mode, [[], 0]];
		if (EQUAL(_items,[])) exitWith {[0, "Не удалось определить содержимое контейнера!"] remoteExecCall ["RRPClient_system_broadcast", _player]};
		
		format["houseUpdate%1:%2:%3:%4", _mode, _items, _housePos, typeOf _house] call RRPServer_DB_fireAndForget;
	};

	case (LIFE_SETTINGS(getText,"life_trunkClass")) : {
		_name = _container GVAR ["varDB",""];
		if (EQUAL(_name,"")) exitWith {[0, "Не удалось определить данные контейнера!"] remoteExecCall ["RRPClient_system_broadcast", _player]};
		if (!isClass (missionConfigFile >> "LifeCfgTrunks" >> _name)) exitWith {[0, "Не удалось определить класс контейнера в LifeCfgTrunks!"] remoteExecCall ["RRPClient_system_broadcast", _player]};
				
		if (_mode isEqualTo "All") exitWith {
			_trunk = _container GVAR ["Trunk", [[], 0]];
			_inventory = _container GVAR ["inventory", [[], 0]];
			
			format["updateGangTrunk:%1:%2:%3", _trunk, _inventory, _name] call RRPServer_DB_fireAndForget;
		};

		_items = _container GVAR [_mode, [[], 0]];
		if (EQUAL(_items,[])) exitWith {[0, "Не удалось определить содержимое контейнера!"] remoteExecCall ["RRPClient_system_broadcast", _player]};
		
		format["gangBoxUpdate%1:%2:%3", _mode, _items, _name] call RRPServer_DB_fireAndForget;
	}; 

	default {
		private _id = _container getVariable ["RRPDatabaseID",-1];
		if (_id isEqualTo -1) exitWith {};
		_trunk = _container GVAR ["Trunk", [[], 0]];
		
		format["vehicleUpdateTrunk:%1:%2",_trunk,_id] call RRPServer_DB_fireAndForget;
	};
};