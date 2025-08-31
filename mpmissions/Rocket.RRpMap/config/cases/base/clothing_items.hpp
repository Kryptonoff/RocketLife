
class ClothingCommon
{
	image = "";
	type = CASE_CLOTHING;
	name = "";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
	item = "";
};
class ClothingRare: ClothingCommon
{
	image = "";
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class ClothingEpic: ClothingCommon
{
	image = "";
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class ClothingLegendary: ClothingCommon
{
	image = "";
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class ClothingMythic: ClothingCommon
{
	image = "";
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
