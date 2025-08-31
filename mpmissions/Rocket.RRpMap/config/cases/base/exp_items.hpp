
class ExpCommon
{
	image = "";
	type = CASE_EXP;
	name = "0";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class ExpRare: ExpCommon
{
	image = "";
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class ExpEpic: ExpCommon
{
	image = "";
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class ExpLegendary: ExpCommon
{
	image = "";
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class ExpMythic: ExpCommon
{
	image = "";
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
