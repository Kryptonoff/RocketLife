
class MoneyCommon
{
	image = "\rimas_pack\icons\bank.paa";
	type = CASE_MONEY;
	name = "0$";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class MoneyRare: MoneyCommon
{
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class MoneyEpic: MoneyCommon
{
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class MoneyLegendary: MoneyCommon
{
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class MoneyMythic: MoneyCommon
{
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
