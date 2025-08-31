/*
	
	Filename:   RRPClient_inventory_itemActionDo.sqf
	Project:    
	Author:     UncleFedor
	E-mail:     dev@extremo.club
	Web:        

*/
#include "..\..\..\script_macros.hpp"
try {
	disableSerialization;
	params [
		["_item", "", [""]],
		["_target", objNull, [objNull]]
	];

	if (life_action_inUse or (call RRPClient_system_isInterrupted)) throw "Вы уже выполняете действие!";
	_isInVehicle = {if !(isNull objectParent player) throw "Нельзя использовать предметы в технике."};

	private _detectorArtefactList = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorArtefactItems");
	private _detectorRadimetrList = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorRadimetrItems");
	private _detectorAnomalyList = getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorAnomalyItems");
	private _pugaloItems = ("true" configClasses (missionConfigFile >> "LifeCfgPugalo")) apply {configName _x};

	switch (true) do
	{
		case (_item == "methp"): {
			if (life_turbo_used) throw "Вы уже использовали препарат для увеличения скорости добычи";
			if ([false,_item,1] call RRPClient_system_handleInv) then {
				if (random(100) < 10) then {
					RRPClientNarcomania = 2;
					["У вас появилась зависимость от тяжелых наркотиков"] call hints;
				};
				titleText["Вы использовали Мет и скорость добычи ресурсов увеличена в два раза! Эффект продлится 15 минут!","PLAIN"];
				["life_turbo_used","buff",900] spawn RRPClient_system_addBuff;
			};
		};

		case (_item =="bottledwhiskey"):
		{
			if (player call getSide in ["cop","med"]) throw "Пить на службе? Не самая лучшая идея";
			if (player GVAR ["inDrink",FALSE]) throw "Вы уже выпили, сделайте перерыв...";
			if ([false,_item,1] call RRPClient_system_handleInv) then {
				if(isNil "life_drink") then {life_drink = 0;};
				life_drink = life_drink + 0.06;
				if (life_drink < 0.07) exitWith {};
				[] spawn RRPClient_system_drinkwhiskey;
			};
		};

		case (_item =="bottledshine"):
		{
			if (player call getSide in ["cop","med"]) throw "Пить на службе? Не самая лучшая идея";
			if (player GVAR ["inDrink",FALSE]) throw "Вы уже выпили, сделайте перерыв...";
			if ([false,_item,1] call RRPClient_system_handleInv) then {
				if(isNil "life_drink") then {life_drink = 0;};
				life_drink = life_drink + 0.08;
				if (life_drink < 0.09) exitWith {};
				[] spawn RRPClient_system_drinkmoonshine;
			};
		};

		case (_item =="bottledbeer"):
		{

			if (player call getSide in ["cop","med"]) throw "Пить на службе? Не самая лучшая идея";
			if (player GVAR ["inDrink",FALSE]) throw "Вы уже выпили, сделайте перерыв..";
			if ([false,_item,1] call RRPClient_system_handleInv) then {
				if(isNil "life_drink") then {life_drink = 0;};
				life_drink = life_drink + 0.02;
				if (life_drink < 0.06) exitWith {};
				[] spawn RRPClient_system_drinkbeer;
			};
		};

		case (_item == "marijuana"):
		{
			if(([false,_item,1] call RRPClient_system_handleInv)) then
			{
				if (random(100) < 10) then {
						RRPClientNarcomania = 1;
						["У вас появилась зависимость от легких наркотиков"] call hints;
				};
				[] spawn RRPClient_system_smokeweed;
			};
		};

		case (_item == "cocainep"):
		{
			if(([false,_item,1] call RRPClient_system_handleInv)) then
			{
				RRPClientThirst = 20;
				titleText["Беги Форест! Беги!","PLAIN"];
				if (random(100) < 10) then {
						RRPClientNarcomania = 2;
						["У вас появилась зависимость от тяжелых наркотиков"] call hints;
				};
				[] spawn RRPClient_system_docoke;
			};
		};


		case (_item in _pugaloItems):
		{
			[_item] spawn RRPClient_farming_placePugalo;
		};

		case (["RRPItem_", _item] call RRPClient_util_xString):
		{
			[_item] spawn RRPClient_UseItems_sorter
		};
		case (_item isEqualTo getText(missionConfigFile >> "LifeCfgArcheology" >> "initItem")):
		{
			call _isInVehicle;
			[] spawn RRPClient_archeology_init
		};

		case (_item isEqualTo "extItem_grinder"):
		{
			call _isInVehicle;
			[_target] spawn RRPClient_system_boltcutter
		};

		case (_item isEqualTo "MineDetector"):
		{
			call _isInVehicle;
			[_target] spawn RRPClient_system_defuseKit;
		};

		case (_item isEqualTo "extItem_MetalWire" && isNull life_spikestrip):
		{
			call _isInVehicle;
			[] spawn RRPClient_system_spikeStrip;
		};

		case (_item in ["extItem_canteen_empty","extItem_bottle_empty"]):
		{
			call _isInVehicle;
			[_item] spawn RRPClient_system_refuelWater;
		};

		case (_item in ["extItem_canteen_salt","extItem_bottle_salt"] and [getPosATL player, 10] call RRPClient_system_isFireNear):
		{
			call _isInVehicle;
			[_item] spawn RRPClient_system_cooking;
		};

		case (_item isEqualTo "extItem_campFire"):
		{
			call _isInVehicle;
			[_item] spawn RRPClient_system_campFire
		};

		case (_item isEqualTo "extItem_Fuelcan_empty"):
		{
			call _isInVehicle;
			[_item] spawn RRPClient_system_refuelJerrycan
		};

		case (_item isEqualTo "extItem_Fuelcan"):
		{
			call _isInVehicle;
			[_item,_target] spawn RRPClient_system_jerryRefuel
		};

		case (_item in ["extItem_ItemDetoxin","extItem_vitaminbottle","extItem_bandage","extItem_antibiotic","extItem_painkillers","extItem_ItemMorphine"]):
		{
			[_item] spawn RRPClient_system_healMe;
		};

		case (_item in _detectorArtefactList):
		{
			[_item] call client_anomaly_detectorArtefact
		};
		case (_item in _detectorRadimetrList):
		{
			[_item] call client_anomaly_detectorRadimetr
		};
		case (_item in _detectorAnomalyList):
		{
			[_item] call client_anomaly_detectorAnomaly
		};
		case (_item in ["ftmItem_CornSeed","ftmItem_CottonSeed","ftmItem_CannabisSeed","ftmItem_BeansSeed","ftmItem_WheatSeed","ftmItem_SunflowerSeed"]): {
			[_item] call RRPClient_farming_plantPlantae;
			(findDisplay 1000) closeDisplay 1;
		};
		//Открыте мешка с удобрением, в мешке 5 удобрений.
		case (EQUAL(_item,"ftmItem_FertilizerBag")): {
			if !(["ftmItem_FertilizerBag"] call RRPClient_system_removeItem) exitWith {"Не удалось удалить предмет" call toastError};
			["ftmItem_Fertilizer", 5] call RRPClient_inventory_addItemToInventory;
			(findDisplay 1000) closeDisplay 1;
		};
		default
		{
			throw "Этот предмет не может использоваться.";
		};
	};
} catch {
	["ErrorTitleAndText",[_exception]] call toast;
};