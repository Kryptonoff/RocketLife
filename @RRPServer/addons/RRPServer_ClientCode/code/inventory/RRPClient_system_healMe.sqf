/*

	Filename: 	RRPClient_system_healMe.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];

if (EQUAL(_item,"")) exitWith {};

switch(true) do {
	case (_item == "extItem_ItemDetoxin"): {
		titleText["Применяем детоксин...","PLAIN"];
		player say3D "action_morphine";
		life_action_inUse = true;
		if (NOTINVEH(player)) then {
			call RRPClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};
		life_action_inUse = false;
		[_item] call RRPClient_system_removeItem;

		if (random(100) < 70) then {
			RRPClientNarcomania = 0;
			titleText["Вы избавились от наркозависимостей.","PLAIN"];
		} else {titleText["Не удалось избавиться от зависимости. Попробуйте еще.","PLAIN"]};

	};

	case (_item == "extItem_bandage"): {
		titleText["Бинтуемся...","PLAIN"];
		player say3D "action_bandage_0";
		life_action_inUse = true;
		if (NOTINVEH(player)) then {
			call RRPClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};
		life_action_inUse = false;
		if ((getPlayerUID player in (getArray(missionConfigFile >> "ptw" >> "bandageExlusive"))) OR ('bandage' in secretShop )) then {
			player setDammage 0;
		} else {[_item] call RRPClient_system_removeItem};

		["life_bleeding"] call RRPClient_system_removeBuff;
		titleText["Вы перебинтовались и остановили кровотечение.","PLAIN"];
	};

	case (_item == "extItem_ItemMorphine"): {
		titleText["Делаем укол Морфина...","PLAIN"];
		player say3D "action_morphine";
		life_action_inUse = true;
		if (NOTINVEH(player)) then {
			call RRPClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};
		life_action_inUse = false;
		[_item] call RRPClient_system_removeItem;

		if (random(100) < 90) then {
			["life_critHit"] call RRPClient_system_removeBuff;
			titleText["Укол снял эффект от критического ранения.","PLAIN"];
		} else {titleText["Не удалось избавиться от критического ранения. Попробуйте еще...","PLAIN"];};
	};

	case (_item == "extItem_vitaminbottle"): {

		titleText["Принимаем витамины...","PLAIN"];
		player say3D "action_painkiller_3";
		life_action_inUse = true;
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};
		life_action_inUse = false;
		[_item] call RRPClient_system_removeItem;

		if (random(100) < 50) then {
			life_diarrhea = false;
			titleText["Витамины поправили ваще здоровье и избавили от диареи.","PLAIN"];
		} else {titleText["Не удалось избавиться от диареи. Попробуйте еще...","PLAIN"]};

	};

	case (_item == "extItem_antibiotic"): {

		titleText["Принимаем антибиотики...","PLAIN"];
		player say3D "action_painkiller_3";
		life_action_inUse = true;
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};
		life_action_inUse = false;
		[_item] call RRPClient_system_removeItem;

		if (random(100) < 50) then {
			life_sickness = false;
			titleText["Курс антибиотиков поправил ваще здоровье и избавил от болезней.","PLAIN"];
		} else {titleText["Не удалось вылечиться от болезней. Попробуйте еще...","PLAIN"]};

	};

	case (_item == "extItem_painkillers"): {

		titleText["Принимаем болеутоляющее...","PLAIN"];
		player say3D "action_painkiller_3";
		life_action_inUse = true;
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};
		life_action_inUse = false;
		[_item] call RRPClient_system_removeItem;

		if (random(100) < 80) then {
			["life_pain_shock"] call RRPClient_system_removeBuff;
			titleText["Эффект от травматического шока нейтрализован.","PLAIN"];
		} else {titleText["Не удалось избавиться от травматического шока. Попробуйте еще...","PLAIN"]};

	};
};
call RRPClient_session_saveStats;
