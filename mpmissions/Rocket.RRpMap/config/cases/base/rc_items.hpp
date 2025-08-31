
class RcCommon
{
	image = "\rimas_agent\assets\hud\rc.paa";
	type = CASE_RC;
	name = "0 RC";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class RcRare: RcCommon
{
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class RcEpic: RcCommon
{
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class RcLegendary: RcCommon
{
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class RcMythic: RcCommon
{
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
