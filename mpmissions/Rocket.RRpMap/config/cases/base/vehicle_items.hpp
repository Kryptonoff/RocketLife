class VehicleCommon
{
	image = "";
	type = CASE_VEHICLE;
	vehicle = "Vehicle";
	quality = CASE_RARITY_COMMON;
	chance = 100;
	name = "";
};
class VehicleRare: VehicleCommon
{
	chance = 40;
	quality = CASE_RARITY_RARE;
};
class VehicleEpic: VehicleCommon
{
	chance = 30;
	quality = CASE_RARITY_EPIC;
};
class VehicleLegendary: VehicleCommon
{
	chance = 20;
	quality = CASE_RARITY_LEGENDARY;
};
class VehicleMythic: VehicleCommon
{
	chance = 5;
	quality = CASE_RARITY_MYTHIC;
};
