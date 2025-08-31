// Common:
// RRPitem_perventiPills_1_1 (3шт) 
// RRPitem_jivchik_1(3шт) 
// RRPitem_flash (5шт) 
// RRPitem_JeamBean_F (5шт) 
// RRPitem_perventinSyringe (4шт) 

class Perventin: ItemCommon
{
	image = "\RRP_items\images\RRPItem_perventiPills_1_1.paa";
	item  = "RRPitem_perventiPills_1_1";
	value = 3;
	name = "Первентин 3 шт.";
};
class Jivchik: ItemCommon
{
	image = "\RRP_items\images\RRPItem_jivchik_1.paa";
	item  = "RRPitem_jivchik_1";
	value = 3;
	name = "Живчик 3 шт.";
};
class Flash: ItemCommon
{
	image = "\RRP_items\images\RRPItem_flash.paa";
	item  = "RRPitem_flash";
	value = 5;
	name = "Флеш 5 шт.";
};
class JeamBean: ItemCommon
{
	image = "\RRP_items\images\JimBeam.paa";
	item  = "RRPitem_JeamBean_F";
	value = 5;
	name = "JeamBeam 5 шт.";
};
class PerventinSyringe: ItemCommon
{
	image = "\RRP_items\images\RRPItem_perventinSyringe.paa";
	item  = "RRPitem_perventinSyringe";
	value = 4;
	name = "Шприц Первентин 4 шт.";
};
 
// Rare 
// extitem_itemSurgeryKit (3шт) 
// RRPitem_Bafaut_F (2шт) 
// RRPitem_Jamb_F (2шт) 
// RRPitem_Container_Sheep_Potato (10шт) 

class SurgeryKit: ItemRare
{
	image = "\rimas_items\pics\bp_surgerykit_ca.paa";
	item  = "extitem_itemSurgeryKit";
	value = 3;
	name = "Хир. набор 3 шт.";
};
class Bafaut: ItemRare
{
	image = "\rimas_items\pics\buffout.paa";
	item  = "RRPitem_Bafaut_F";
	value = 2;
	name = "Баффaут 2 шт.";
};
class Jamb: ItemRare
{
	image = "\RRP_icons\items\Jamb.paa";
	item  = "RRPitem_Jamb_F";
	value = 2;
	name = "Косяк 2 шт.";
};
class SheepPotato: ItemRare
{
	image = "\RRP_items\images\Container.paa";
	item  = "RRPitem_Container_Sheep_Potato";
	value = 10;
	name = "Баранина с картошкой 10 шт.";
};


// Epic 
// RRPitem_Roll_Tuna_F (5шт) 
// RRPitem_Speedball_F (3шт) 

class TunaRoll: ItemEpic
{
	image = "\RRP_items\images\roll_tuna.paa";
	item  = "RRPitem_Roll_Tuna_F";
	value = 5;
	name = "Ролл с тунцом 5 шт.";
};
class Speedball: ItemEpic
{
	image = "\RRP_icons\items\Speedball.paa";
	item = "RRPItem_Speedball_F";
	value = 3;
	name = "Спидбол 3 шт.";
};
 
// Legendary 
// RRP_Craft_Backpack_100 (1шт) Крафтовый рюкзак на 100 слотов. 
// RRP_Treasure_10 (10шт) "Каждая монетка стоит сейчас 3000$+-"

class Backpack100: ItemLegendary
{
	image = "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_cbr.paa";
	item  = "B_Carryall_cbr";
	value = 1;
	name = "Рюкзак на 100 слотов";
};
