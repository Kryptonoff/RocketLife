/*
	Filename: 	RRPClient_system_containerMenu.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	disableSerialization;
	if (dialog) exitWith {};
	life_house_box = cursorObject;
	if (isNull life_house_box OR {(typeOf life_house_box != "Land_LuggageHeap_03_F")}) exitWith {}; //Either a null or invalid vehicle type.
	if (life_action_inUse) throw "Вы чем-то заняты...";
	if ([life_house_box] call RRPClient_system_isTrunkInUse) throw "Багажник уже используется.";

	private _house = life_house_box GVAR ["house_box_inHouse",objNull];
	if (isNull _house OR isNil {(_house GVAR "house_owner")}) throw "Этот дом никому не принадлежит.";

	private _uid = (_house GVAR "house_owner") select 0;
	if !([_uid] call RRPClient_system_isUIDActive) throw "Владелец дома не в сети!";

	private _house_box_slots = life_house_box GVAR ["house_box_slots",0];
	if (EQUAL(_house_box_slots,0)) throw "У вас не добавлены слоты для хранения вещей";

	if !(createDialog "UnionDialogContainer") throw "Не удалось создать диалог.";

	[life_house_box,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;
	player say3D "house_cont";

	private _title = CONTROL(4100,4104);
	private _houseEdit = CONTROL(4100,4105);
	private _playerEdit = CONTROL(4100,4106);
	private _filters = CONTROL(4100,4107);

	private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");
	private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _house,"displayName");

	_title ctrlSetText format[("Домашний ящик")+ " - %1 - Слоты: %2/%3",_houseName,_house_box_slots,_numberCrates];

	_filters lbAdd "Все снаряжение";
	_filters lbAdd "Амуниция";
	_filters lbAdd "Оружие";
	_filters lbAdd "Боеприпасы";
	_filters lbAdd "Обвес";
	_filters lbAdd "Предметы";

	_filters lbSetCurSel 0;

	life_veh_trunk_sync = +((life_house_box GVAR ["inventory",[[],0]]) select 0);

	life_house_box spawn {
		while {true} do {
			if(_this GVAR ["trunk_inUseBy",""] != steamid) exitWith {
				[_this,"trunk_inUseBy"] call RRPClient_system_clearGlobalVar;
				closeDialog 0;
				throw "Инвентарь уже используется другим игроком.";
			};
			if(isNull (findDisplay 4100)) exitWith {
				[_this,"trunk_inUseBy"] call RRPClient_system_clearGlobalVar;
				private _data = (_this GVAR ["inventory",[[],0]]) select 0;
				if !(EQUAL(life_veh_trunk_sync,_data)) then {
					life_veh_trunk_sync = [];

					[_this,player] remoteExecCall ["RRPServer_house_updateHouseContainers",2];

					call RRPClient_system_saveGear;
				};
			};
			uiSleep 0.03;
		};
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};