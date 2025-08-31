/*
		классы civdefault, rebdefault, copdefault & meddefault - должны быть всегда! не удалять!

		title - название
		image = путь к картинке паспорта
		side = для какой фракции
		conditions = условия, необходимые для использования данного паспорта

		LifeCfgPassportsTexts - каким цветом и текстом выдавать фракцию при отображении паспорта
*/
class LifeCfgPassportsTexts {
	class civ {
		text = "<t color='#cc00ff'>Гражданский</t>";
	};
	class reb {
		text = "<t color='#00FF00'>Революционер</t>";
	};
	class cop {
		text = "<t color='#4ab0ff'>Полиция</t>";
	};
	class med {
		text = "<t color='#ff0000'>МЧС</t>";
	};
};

class LifeCfgPassports 
{
	class civdefault {
		title = "Гражданский";
		image = "\RRP_Passports\passport_Civil.paa";
		side = "civ";
		conditions = "!license_reb";
	};
	class flightschool {
		title = "Летная школа";
		image = "\RRP_Passports\passport_Civil.paa";
		side = "civ";
		conditions = "license_flightschool";
	};
	class emsdefault {
		title = "EMS";
		image = "\RRP_Passports\passport_EMS_M.paa";
		side = "med";
		conditions = "";
	};
	class rebdefault {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_reb";
	};
	class copdefault {
		title = "Полицейский";
		image = "\RRP_Passports\passport_Police_cop.paa";
		side = "cop";
		conditions = "";
	};
	/////
	class passport_7news {
		title = "7NEWS";
		image = "\RRP_Passports\passport_7news.paa";
		side = "civ";
		conditions = "license_press && {!license_isGirl}";
	};
	class passport_7news_FEM {
		title = "7NEWS";
		image = "\RRP_Passports\passport_7news_FEM.paa";
		side = "civ";
		conditions = "license_press && {license_isGirl}";
	};
	class passport_BS {
		title = "Black Snow";
		image = "\RRP_Passports\passport_BS.paa";
		side = "civ";
		conditions = "license_blacksnow";
	};
	class passport_BS_FEM {
		title = "Black Snow";
		image = "\RRP_Passports\passport_BS_FEM.paa";
		side = "civ";
		conditions = "license_blacksnow && {license_isGirl}";
	};
	class passport_cigane {
		title = "Cigane";
		image = "\RRP_Passports\passport_Civil.paa";
		side = "civ";
		conditions = "license_cigane";
	};
	class passport_inagawakai {
		title = "Inagawa Kai";
		image = "\RRP_Passports\passport_inagawakai.paa";
		side = "civ";
		conditions = "license_inagawakai";
	};
	class passport_lacosanostra {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_lacosanostra";
	};
	class passport_blackwolves {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_blackwolves";
	};
	class passport_Sector {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_sector";
	};
	class passport_PremGRP_2 {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_PremGRP_2";
	};
	class passport_PremGRP_3 {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_PremGRP_3";
	};
	class passport_PremGRP_4 {
		title = "Бандит";
		image = "\RRP_Passports\passport_Rebel.paa";
		side = "civ";
		conditions = "license_PremGRP_4";
	};
	class passport_Civil_FEM {
		title = "Alpha";
		image = "\RRP_Passports\passport_Civil_FEM.paa";
		side = "civ";
		conditions = "license_isGirl";
	};
	class passport_FBI {
		title = "FBI";
		image = "\RRP_Passports\passport_FBI.paa";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) in [27,28,29,30]";
	};
	class passport_Justice {
		title = "Министерство юстиции";
		image = "\RRP_Passports\passport_Justice.paa";
		side = "civ";
		conditions = "license_judge";
	};
	class passport_Police_cadet {
		title = "Полицейский";
		image = "\RRP_Passports\passport_Police_cadet.paa";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3] && {!license_isGirl}";
	};
	class passport_Police_cadet_FEM {
		title = "Полицейский";
		image = "\RRP_Passports\passport_Police_cadet_FEM.paa";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3] && {license_isGirl}";
	};
	class passport_Police_detective {
		title = "Детектив";
		image = "\RRP_Passports\passport_Police_detective.paa";
		side = "cop";
		conditions = "license_press";
	};
	class passport_Police_swat {
		title = "S.W.A.T";
		image = "\RRP_Passports\passport_Police_swat.paa";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) in [23,24,25,26]";
	};
	class passport_Police_swat_FEM {
		title = "S.W.A.T";
		image = "\RRP_Passports\passport_Police_swat_FEM.paa";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) in [23,24,25,26] && {license_isGirl}";
	};
	class passport_Taxi {
		title = "Такси";
		image = "\RRP_Passports\passport_Taxi.paa";
		side = "civ";
		conditions = "license_taxi && !license_isGirl";
	};
	class 1_civ {
		title = "Гражданский Котик";
		image = "\RRP_Passports\Donate\1_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 2_civ {
		title = "Гражданский PlayBoy";
		image = "\RRP_Passports\Donate\2_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 3_civ {
		title = "Гражданский Бублик";
		image = "\RRP_Passports\Donate\3_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 4_civ {
		title = "Гражданский BMWвод";
		image = "\RRP_Passports\Donate\4_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 5_civ {
		title = "Гражданский Джонни";
		image = "\RRP_Passports\Donate\5_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 6_civ {
		title = "Гражданский Ответственный";
		image = "\RRP_Passports\Donate\6_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 7_civ {
		title = "Гражданский Попец";
		image = "\RRP_Passports\Donate\7_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 8_civ {
		title = "Гражданский Сила во мне";
		image = "\RRP_Passports\Donate\8_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 9_civ {
		title = "Гражданский Лучший из нас";
		image = "\RRP_Passports\Donate\9_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 10_civ {
		title = "Гражданский Огурчик РИИИК!";
		image = "\RRP_Passports\Donate\10_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 11_civ {
		title = "Гражданский Барбосс";
		image = "\RRP_Passports\Donate\11_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 12_civ {
		title = "Гражданский Слава Трудящимся";
		image = "\RRP_Passports\Donate\12_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 13_civ {
		title = "Гражданский Террекс";
		image = "\RRP_Passports\Donate\13_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 14_civ {
		title = "Гражданский Котик";
		image = "\RRP_Passports\Donate\14_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 15_civ {
		title = "Гражданский VaultBoy";
		image = "\RRP_Passports\Donate\15_civ.paa";
		side = "civ";
		conditions = "!license_reb && (call life_donator) > 1";
	};
	class 1_reb {
		title = "Бандит 2 Ствола";
		image = "\RRP_Passports\Donate\1_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 2_reb {
		title = "Бандит Aliens";
		image = "\RRP_Passports\Donate\2_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 3_reb {
		title = "Бандит VaultBoy";
		image = "\RRP_Passports\Donate\3_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 4_reb {
		title = "Бандит PlayBoy";
		image = "\RRP_Passports\Donate\4_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 5_reb {
		title = "Бандит BMWвод";
		image = "\RRP_Passports\Donate\5_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 6_reb {
		title = "Бандит Котик";
		image = "\RRP_Passports\Donate\6_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 7_reb {
		title = "Бандит Шериф";
		image = "\RRP_Passports\Donate\7_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 8_reb {
		title = "Бандит Барбосс";
		image = "\RRP_Passports\Donate\8_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 9_reb {
		title = "Бандит Ассасин Моря";
		image = "\RRP_Passports\Donate\9_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 10_reb {
		title = "Бандит лучший из нас";
		image = "\RRP_Passports\Donate\10_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 11_reb {
		title = "Бандит Морской Волк";
		image = "\RRP_Passports\Donate\11_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 12_reb {
		title = "Бандит Пол";
		image = "\RRP_Passports\Donate\12_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 13_reb {
		title = "Бандит попка";
		image = "\RRP_Passports\Donate\13_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 14_reb {
		title = "Бандит Бычара";
		image = "\RRP_Passports\Donate\14_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
	class 15_reb {
		title = "Бандит Травокур Адидасоносец";
		image = "\RRP_Passports\Donate\15_reb.paa";
		side = "civ";
		conditions = "license_reb && (call life_donator) > 1";
	};
};
