class VipCommon
{
	image = "";
	type = CASE_VIP;
	name = "0";
	value = 0;
	level = 1;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class VipRare: VipCommon
{
	image = "";
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class VipEpic: VipCommon
{
	image = "";
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class VipLegendary: VipCommon
{
	image = "";
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class VipMythic: VipCommon
{
	image = "";
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
