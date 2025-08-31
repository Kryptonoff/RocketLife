
class PermCommon
{
	image = "";
	type = CASE_PERMITEMS;
	name = "0$";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class PermRare: PermCommon
{
	image = "";
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class PermEpic: PermCommon
{
	image = "";
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class PermLegendary: PermCommon
{
	image = "";
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class PermMythic: PermCommon
{
	image = "";
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
