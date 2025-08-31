/*
	Filename: 	RRPClient_system_varToStr.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _var = param [0,"",[""]];
if (EQUAL(_var,"")) exitWith {""};

switch (_var) do {
	case "depo_kavala": {"Кавала"};
	case "depo_molos": {"Молос"};
	case "depo_mazi": {"Мази"};
	case "depo_tonos": {"Тонос"};
	case "Salt_Prof": {( "Навык - соль")};
	case "Sand_Prof": {( "Навык - песок")};
	case "Ticket_Prof": {( "Навык - штрафы")};
	case "Arrest_Prof": {( "Навык - арест")};
	case "Impound_Prof": {( "Навык - конфисковывание")};
	case "Revive_Prof": {( "Навык - реанимация")};
	case "Repair_Prof": {( "Навык - механик")};
	case "Rogue_Prof": {( "Коп-изгой")};
	case "Hero_Prof": {( "Коп-герой")};
	case "Citizen_Prof": {( "Гражданин")};
	case "Criminal_Prof": {( "Преступник")};
	case "Hunting_Prof": {( "Навык - охота")};
	case "Thief_Prof": {( "Навык - воровство")};
	// PROF
	case "Diving_Prof": {"Дайвер"};
	case "Drug_Prof": {"Наркоделие"};
	case "Mech_Prof": {("Механик")};
	case "Oil_Prof": {("Нефтяник")};
	case "Gas_Prof": {("Газовик")};
	case "Mining_Prof": {"Горнорудное дело"};
	case "Minerals_Prof": {"Минералы"};
	case "Alco_Prof": {"Алкоголеварение"};
	case "Fishing_Prof": {("Навык - рыбная ловля")};
	case "Fruit_Prof": {"Фермер"};
	// MINING
	case "farm_mining_rock": {"Камень"};
	case "farm_mining_coal": {"Уголь"};
	case "farm_mining_iron": {"Железо"};
	case "farm_mining_copper": {"Медь"};
	case "farm_mining_tin": {"Олово"};
	case "farm_mining_galena": {"Галенит"};
	case "farm_mining_nikelin": {"Никелин"};
	case "farm_mining_silver": {"Серебро"};
	case "farm_mining_gold": {"Золото"};
	case "farm_mining_platinum": {"Платина"};
	case "farm_mining_titaniu": {"Титаний"};
	case "farm_mining_mithril": {"Мифрил"};
	//MINERALS
	case "farm_minerals_yashma": {"Яшма"};
	case "farm_minerals_quartz": {"Кварц"};
	case "farm_minerals_nephritis": {"Нефрит"};
	case "farm_minerals_obsidian": {"Обсидиан"};
	case "farm_minerals_apatite": {"Апатит"};
	case "farm_minerals_malachite": {"Малахит"};
	case "farm_minerals_amber": {"Янтарь"};
	case "farm_minerals_topaz": {"Топаз"};
	case "farm_minerals_opal": {"Опал"};
	case "farm_minerals_ruby": {"Рубин"};
	case "farm_minerals_sapphire": {"Сапфир"};
	case "farm_minerals_emerald": {"Изумруд"};
	case "farm_minerals_diamond": {"Алмаз"};
	//Alco
	case "farm_minerals_vino": {"Виноград"};
	case "farm_minerals_syslo": {"Сусло"};
	case "farm_minerals_hmel": {"Хмель"};
	case "farm_minerals_sugar": {"Сахар"};
	case "farm_minerals_shipovnik": {"Шиповник"};
	case "farm_minerals_klykva": {"Клюква"};
	case "farm_minerals_drojji": {"Дрожжи"};
	case "depo_kavala": {"Кавала"};
	case "depo_molos": {"Молос"};
	case "depo_panagia": {"Ферес"};
	case "depo_center": {"Центральное"};
	//uran
	case "Uran_Prof": {"Химик"};
	case "Maroder": {"Сыщик"};
};