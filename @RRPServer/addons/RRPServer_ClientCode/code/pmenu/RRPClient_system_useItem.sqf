/*
	Filename: 	RRPClient_system_useItem.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	disableSerialization;
	params ["_control","_index"];
	private _item = _control lbData _index;

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
		default
		{
			throw "Этот предмет не может использоваться.";
		};
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};

call RRPClient_session_saveStats;
[] spawn RRPClient_pad_openStatus;
