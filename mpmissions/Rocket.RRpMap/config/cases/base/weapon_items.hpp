
class WeaponCommon
{
	image = "";
	type = CASE_WEAPON;
	name = "";
	value = 0;
	quality = CASE_RARITY_COMMON;
	chance = 100;
};
class WeaponRare: WeaponCommon
{
	image = "";
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class WeaponEpic: WeaponCommon
{
	image = "";
	quality = CASE_RARITY_EPIC;
	chance = 30;
};
class WeaponLegendary: WeaponCommon
{
	image = "";
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class WeaponMythic: WeaponCommon
{
	image = "";
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
