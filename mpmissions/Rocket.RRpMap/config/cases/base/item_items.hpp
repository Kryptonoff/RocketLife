class ItemCommon
{
	image = "";
	type = CASE_ITEM;
	name = "0$";
	item = "";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class ItemRare: ItemCommon
{
	image = "";
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class ItemEpic: ItemCommon
{
	image = "";
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class ItemLegendary: ItemCommon
{
	image = "";
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class ItemMythic: ItemCommon
{
	image = "";
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
