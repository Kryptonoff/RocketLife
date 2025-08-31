
class TrxCommon
{
	image = "\rimas_agent\assets\hud\trx.paa";
	type = CASE_TRX;
	name = "0 TRX";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class TrxRare: TrxCommon
{
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class TrxEpic: TrxCommon
{
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class TrxLegendary: TrxCommon
{
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class TrxMythic: TrxCommon
{
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
