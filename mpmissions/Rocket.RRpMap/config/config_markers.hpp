class RRPConfig_mapMarkers
{
	List_IgnorChangeAlpha[] =
	{
		"other_ZZ_capitalRebels",
		"other_ZZ_DP11",
		"other_ZZ_Avia",
		"RRP_Anomaly_ZZ_1",
		"RRP_Anomaly_ZZ_2",
		"other_ZZ_KPP",
		"other_ZZ_Pirgos",
		"ZZ_PD_Kavala",
		"ZZ_7NEWS_Kavala",
		"ZZ_EMS_Pirgos",
		"nz_soa",
		"other_ZZ_centralHospital",
		"other_ZZ_Prison",
		"other_ZZ_northRebBase",
		"other_ZZ_rebHospital",
		"other_ZZ_Sud",
		"other_ZZ_EVENT",
		"death_marker_",
		"death_warn_",
		"other_ZZ_Pirgos_1",
		"ZZ_EMS_Kavala",
		"other_ZZ_prison",
		"gather_coke_area_3",
		"mi_6_zz",
		"anomaly_zone_1",
		"anomaly_zone_2",
		"anomaly_zone_3",
		"anomaly_zone_4",
		"anomaly_zone_5",
		"anomaly_zone_6",
		"other_party_meat"
	};


	List_IgnorChangeSize[] =
	{
		"stratis_zone",
		"gather_diving_zone",
		"RRP_Mark_Diving_1",
		"RRP_Mark_Scallops",
		"RRP_GasZone_1",
		"gather_coke_area_3",
		"gather_gornorudka_cirle",
		"gather_gornorudka_1_circle",

		"gather_mineral_circle",
		"gather_mineral_1",

		"gather_fish_radius",
		"gather_oyster_radius_4",
		"gather_oceangreben_radius",
		"gather_oyster_radius",
		"gather_fish_radius_1",
		"gather_oceangreben_radius_1",
		"gather_oceangreben_radius_3",
		"gather_fish_radius_3",
		"gather_oyster_radius_3",
		"gather_turtle_radius",
		"gather_kombain_pshenica_radius",

		"other_ZZ_capitalRebels",
		"other_ZZ_DP11",
		"other_ZZ_Avia",
		"RRP_Anomaly_ZZ_1",
		"RRP_Anomaly_ZZ_2",
		"ZZ_EMS_Pirgos",
		"nz_soa",
		"other_ZZ_KPP",
		"gather_hunt_zone",
		"gather_hunt_zone_1",
		"other_ZZ_Pirgos",
		"ZZ_PD_Kavala",
		"ZZ_7NEWS_Kavala",
		"other_ZZ_centralHospital",
		"other_ZZ_Prison",
		"other_ZZ_northRebBase",
		"other_ZZ_rebHospital",
		"other_ZZ_Sud",
		"other_ZZ_EVENT",
		"death_marker_",
		"death_warn_",
		"other_freshspawn_zone",
		"other_ZZ_Pirgos_1",
		"ZZ_EMS_Kavala",
		"prison_zone",
		"other_ZZ_prison",
		"gather_coke_area_3",
		"mi_6_zz",
		"anomaly_zone_1",
		"anomaly_zone_2",
		"anomaly_zone_3",
		"anomaly_zone_4",
		"anomaly_zone_5",
		"anomaly_zone_6",
		"other_party_meat"
	};

	class markers_category
	{
		class other {
			name = "Прочее";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_other.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_other_hide.paa";
		};
		class port {
			name = "Порты";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_port.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_port_hide.paa";
		};
		class grp {
			name = "Организации";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_grp.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_grp_hide.paa";
		};
		class dp {
			name = "Пункты доставки";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_dp.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_dp_hide.paa";
		};
		class garage {
			name = "Гаражи";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_garage.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_garage_hide.paa";
		};
		class shop {
			name = "Магазины";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_shop.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_shop_hide.paa";
		};
		class vehshop {
			name = "Автосалоны";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_car.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_car_hide.paa";
		};
		class RRP_Buyer {
			name = "Скупщики";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_sell.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_sell_hide.paa";
		};
		class RRP_Proc {
			name = "Зоны переработки";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_processing.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_Processing_hide.paa";
		};
		class RRP_Gather {
			name = "Зоны добычи";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_gather.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_gather_hide.paa";
	    };
		class all {
			name = "Вкл/выкл все";
			icon_on = "\RRP_icons\legendmap\RRPImage_markers_all.paa";
			icon_off = "\RRP_icons\legendmap\RRPImage_markers_all_hide.paa";
		};
	};

	DrawToMap[] = {};
};
