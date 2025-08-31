class DefaultEventhandlers;
class CfgPatches
{
	class RRPServer
	{
		units[]=
		{
			"C_man_1"
		};
		weapons[]={};
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_Soft_F",
			"A3_Soft_F_Offroad_01",
			"A3_Characters_F"
		};
		fileName="RRPServer.pbo";
		author="Tonic";
	};
};
class RCON
{
	password="9cy28q37rcw348ycrn7q2t3r0cx";
};
class CfgFunctions
{
	class RRPServer
	{
		class Bootstrap
		{
			file="\RRPServer\bootstrap";
			class postInit
			{
				postInit=1;
			};
			class preInit
			{
				preInit=1;
			};
		};
	};
};
class CfgScheduler 
{
	/*
		По дням недели
		EVERYDAY = ежедневно
		MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY

		Год = 2020 - только в 2020, {2020,2021,2022} - в эти года
		Месяц = 1 - только в январе, {1,2,3} - в январе, феврале и марте
		День = 10 - 10 число месяца, {20,10,25} - каждое число месяца
		//Ниже по часам, принцип такой же
		Час
		Минута
		Секунда
	*/
	class lottery 
	{
		description = "лоттерея";
		//Timer: Years, months, days, hours, minutes, seconds
		timer[] = {{},{},{},17,1,10};
		days[] = {"EVERYDAY"};
		code = "call RRPServer_lottery_fetchWinners2";
	};
	class dailyReward
	{
		description = "Сброс таймера ежедневок";
		timer[] = {{},{},{},21};
		days[] = {"EVERYDAY"};
		code = "call RRPServer_dg_resetTimer";
	};
};
class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F: Civilian
	{
		class EventHandlers;
	};
	class C_man_1: Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init="(_this select 0) execVM '\RRPServer\fix_headgear.sqf'";
		};
	};
};
class CfgCleanup
{
	class CleanupVehicle
	{
		cleanupCycle = 15;
		savePhysInventory = 0;
		costForWaterPenny = 1000;
	};
	class Global
	{
		cleanupModels[]=
		{
			"wreck_truck_dropside_f.p3d",
			"wreck_truck_f.p3d",
			"wreck_car3_f.p3d",
			"wreck_car2_f.p3d",
			"wreck_car_f.p3d",
			"wreck_offroad2_f.p3d",
			"wreck_ural_f.p3d",
			"wreck_offroad_f.p3d",
			"wreck_skodovka_f.p3d",
			"toiletbox_f.p3d",
			"bricks_v4_f.p3d",
			"bricks_v2_f.p3d",
			"bricks_v1_f.p3d",
			"metalbarrel_f.p3d",
			"garbagepallet_f.p3d",
			"coil_f.p3d",
			"garbagebags_f.p3d",
			"junkpile_f.p3d",
			"pallets_f.p3d",
			"concretepipe_f.p3d",
			"workstand_f.p3d",
			"woodenbox_f.p3d",
			"ironpipes_f.p3d",
			"garbagewashingmachine_f.p3d",
			"pipes_small_f.p3d",
			"tyres_f.p3d",
			"tyre_f.p3d",
			"pallet_vertical_f.p3d",
			"cages_f.p3d",
			"bricks_v3_f.p3d",
			"pipes_large_f.p3d",
			"garbagebarrel_01_f.p3d",
			"crabcages_f.p3d",
			"fishinggear_02_f.p3d",
			"pallet_f.p3d",
			"canisterplastic_f.p3d",
			"cratesplastic_f.p3d",
			"fishinggear_01_f.p3d",
			"metalbarrel_empty_f.p3d",
			"cratesshabby_f.p3d",
			"cinderblocks_f.p3d",
			"sack_f.p3d"
		};
		cleanupClasses[]=
		{
			"yourclassname"
		};
	};
	class RRpMap
	{
		cleanupModels[]=
		{
			"yourModel.p3d"
		};
		cleanupNetID[]=
		{
			"0:0"
		};
		cleanupClasses[]=
		{
			"yourclassname"
		};
	};
};
