class LifeCfgVehMaterials
{
	class default
	{
		material = "";
		displayName = "Сток";
		conditions = "";
	};
	class glossy
	{
		material = "\rimas_agent\assets\materials\glossy";
		displayName = "Глянцевый";
		conditions = "";
	};
	class metallic
	{
		material = "\rimas_agent\assets\materials\metallic";
		displayName = "Металлик";
		conditions = "(call life_donator) > 0";
	};
	class matte
	{
		material = "\rimas_agent\assets\materials\matte";
		displayName = "Матовый";
		conditions = "(call life_donator) > 0";
	};
	class chrome
	{
		material = "\rimas_agent\assets\materials\chrome";
		displayName = "Хром";
		conditions = "(call life_donator) > 0";
	};
	class firered
	{
		material = "\rimas_agent\assets\materials\metallic";
		displayName = "Firered";
		conditions = "(call life_donator) > 0";
	};
	class glow_red
	{
		material = "\rimas_agent\assets\materials\glow_red";
		displayName = "Glow Red";
		conditions = "(call life_donator) > 0";
	};
	class glow_yellow
	{
		material = "\rimas_agent\assets\materials\glow_yellow";
		displayName = "Glow Yellow";
		conditions = "(call life_donator) > 0";
	};
	class shine_blue
	{
		material = "\rimas_agent\assets\materials\shine_blue";
		displayName = "Shine Blue";
		conditions = "(call life_donator) > 0";
	};
	class shine_blueocean
	{
		material = "\rimas_agent\assets\materials\shine_blueocean";
		displayName = "Shine Blue ocean";
		conditions = "(call life_donator) > 0";
	};
	class shine_red
	{
		material = "\rimas_agent\assets\materials\shine_red";
		displayName = "Shine Red";
		conditions = "(call life_donator) > 0";
	};
	class shine_gold
	{
		material = "\rimas_agent\assets\materials\shine_red";
		displayName = "Shine Gold";
		conditions = "(call life_donator) > 0";
	};
	class damage
	{
		material = "\RRP_structures\Data\textures\GG\damage";
		displayName = "БУ";
		conditions = "false";
	};
	class destruct
	{
		material = "\RRP_structures\Data\textures\GG\destruct";
		displayName = "Старая";
		conditions = "false";
	};
	class matte_prem
	{
		material = "\rimas_agent\assets\materials\matte";
		displayName = "Матовый";
		conditions = "";
	};
	class chrome_prem
	{
		material = "\rimas_agent\assets\materials\chrome";
		displayName = "Хром";
		conditions = "";
	};
	class chrome_bs
	{
		material = "\RimasRP\osk_MER_C63AMG_12\data\chrome.rvmat";
		displayName = "Хром";
		conditions = "";
	};
};

class LifeCfgVehTextures {
	class RRP_Lada_2114 {
		displayName = "Стандарт";
		texture[] = {
			"ver_2114\data\colors\black.paa",
			"ver_2114\data\ayf.paa",
		};
	};
	class RRP_RDS_Lada_1 {
		displayName = "Луна";
		texture[] = {"rds_a2port_civ\Lada\Data\lada_white_co.paa"};
	};
	class RRP_RDS_Lada_2 {
		displayName = "Баклажан";
		texture[] = {"rds_a2port_civ\Lada\Data\lada_bacla_co.paa"};
	};
	class RRP_RDS_Lada_3 {
		displayName = "Волна";
		texture[] = {"rds_a2port_civ\Lada\Data\lada_blue_co.paa"};
	};
	class RRP_RDS_Lada_4 {
		displayName = "Старость";
		texture[] = {"rds_a2port_civ\Lada\Data\lada_eciv1_co.paa"};
	};
	class RRP_RDS_Lada_5 {
		displayName = "Муслим";
		texture[] = {"rds_a2port_civ\Lada\Data\lada_eciv2_co.paa"};
	};

	class RRP_RDS_Gaz24_1 {
		displayName = "Карбид";
		texture[] = {"rds_a2port_civ\volha\Data\Volha_Gray_ECIV_CO.paa"};
	};
	class RRP_RDS_Gaz24_2 {
		displayName = "Битум";
		texture[] = {"rds_a2port_civ\volha\Data\Volha_Black_ECIV_CO.paa"};
	};
	class RRP_RDS_Gaz24_3 {
		displayName = "Старость";
		texture[] = {"rds_a2port_civ\volha\Data\Volha_ECIV_CO.paa"};
	};

	class RRP_RDS_Golf_1 {
		displayName = "Орхидея";
		texture[] = {"rds_a2port_civ\VWGOLF\Data\vwgolf_body_white_CO.paa"};
	};
	class RRP_RDS_Golf_2 {
		displayName = "Тьма";
		texture[] = {"rds_a2port_civ\VWGOLF\Data\vwgolf_body_co.paa"};
	};
	class RRP_RDS_Golf_3 {
		displayName = "Рубин";
		texture[] = {"rds_a2port_civ\VWGOLF\Data\vwgolf_body_red_CO.paa"};
	};
	class RRP_RDS_Golf_4 {
		displayName = "Подсолнух";
		texture[] = {"rds_a2port_civ\VWGOLF\Data\vwgolf_body_yellow_CO.paa"};
	};
	class RRP_RDS_Golf_5 {
		displayName = "Океан";
		texture[] = {"rds_a2port_civ\VWGOLF\Data\vwgolf_body_blue_CO.paa"};
	};
	class RRP_RDS_Golf_6 {
		displayName = "Зелень";
		texture[] = {"rds_a2port_civ\VWGOLF\Data\vwgolf_body_green_CO.paa"};
	};

	class RRP_Color_1 {
		displayName = "Абрикос";
		texture[] = {"#(rgb,8,8,3)color(0.8,0.4,0.2,1)"};
	};
	class RRP_Color_2 {
		displayName = "Авантюрин";
		texture[] = {"#(rgb,8,8,3)color(0,0.0666667,0.105882,1)"};
	};
	class RRP_Color_3 {
		displayName = "Айсберг";
		texture[] = {"#(rgb,8,8,3)color(0.521569,0.521569,0.521569,1)"};
	};
	class RRP_Color_4 {
		displayName = "Акапулько";
		texture[] = {"#(rgb,8,8,3)color(1,1,0.2,1)"};
	};
	class RRP_Color_5 {
		displayName = "Аквамарин";
		texture[] = {"#(rgb,8,8,3)color(0.0390625,0.140625,0.265625,1)"};
	};
	class RRP_Color_6 {
		displayName = "Лягушонок";
		texture[] = {"#(rgb,8,8,3)color(0.2,0.4,0,1)"};
	};
	class RRP_Color_7 {
		displayName = "Аметист";
		texture[] = {"#(rgb,8,8,3)color(0.196078,0.00392157,0.121569,1)"};
	};
	class RRP_Color_8 {
		displayName = "Андриатика";
		texture[] = {"#(rgb,8,8,3)color(0.227451,0.368627,0.454902,1)"};
	};
	class RRP_Color_9 {
		displayName = "Антарес";
		texture[] = {"#(rgb,8,8,3)color(0.184314,0,0,1)"};
	};
	class RRP_Color_10 {
		displayName = "Апатия";
		texture[] = {"#(rgb,8,8,3)color(0.827451,0.403922,0.121569,1)"};
	};
	class RRP_Color_11 {
		displayName = "Дефиле";
		texture[] = {"#(rgb,8,8,3)color(0.466667,0.235294,0.235294,1)"};
	};
	class RRP_Color_12 {
		displayName = "Дипломат";
		texture[] = {"#(rgb,8,8,3)color(0,0.231373,0.384314,1)"};
	};
	class RRP_Color_13 {
		displayName = "Жимолость";
		texture[] = {"#(rgb,8,8,3)color(0.294118,0.301961,0.392157,1)"};
	};
	class RRP_Color_14 {
		displayName = "Вишня";
		texture[] = {"#(rgb,8,8,3)color(0.156863,0,0.00392157,1)"};
	};
	class RRP_Color_15 {
		displayName = "Капучино";
		texture[] = {"#(rgb,8,8,3)color(0.537255,0.439216,0.4,1)"};
	};
	class RRP_Color_16 {
		displayName = "Магма";
		texture[] = {"#(rgb,8,8,3)color(0.827451,0.34902,0.0666667,1)"};
	};
	class RRP_Color_17 {
		displayName = "Асфальт";
		texture[] = {"#(rgb,8,8,3)color(0.117647,0.117647,0.117647,1)"};
	};
	class RRP_Color_18 {
		displayName = "Оливки";
		texture[] = {"#(rgb,8,8,3)color(0.117647,0.133333,0.117647,1)"};
	};
	class RRP_Color_19 {
		displayName = "Олимпия";
		texture[] = {"#(rgb,8,8,3)color(0.196078,0.352941,0.647059,1)"};
	};
	class RRP_Color_20 {
		displayName = "Ривьера";
		texture[] = {"#(rgb,8,8,3)color(0.0941176,0,0.188235,1)"};
	};
	class RRP_Color_21 {
		displayName = "Сирень";
		texture[] = {"#(rgb,8,8,3)color(0.498039,0.403922,0.592157,1)"};
	};
	class RRP_Color_22 {
		displayName = "Астероид";
		texture[] = {"#(rgb,8,8,3)color(0.0588235,0.0588235,0.0588235,1)"};
	};
	//C_Offroad_01_F
	class ffrd_r {
		displayName = "Красный";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"};
	};
	class ffrd_y {
		displayName = "Желтый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"};
	};
	class ffrd_w {
		displayName = "Белый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"};
	};
	class ffrd_b {
		displayName = "Синий";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"};
	};
	class ffrd_br {
		displayName = "Темно-красный";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"};
	};
	class ffrd_bw {
		displayName = "Сине-белый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"};
	};
	class ffrd_sb {
		displayName = "VIP Стикеры";
		texture[] = {"\rimas_textures\vip1\offroad_blau_sickerbomb.paa"};
	};
	class ffrd_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\police_offroad.paa"};
	};
	class rgb_cy {
		displayName = "Кислотно-желтый";
		texture[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
	};
	class ffrd_med {
		displayName = "Скорая";
		texture[] = {"\rimas_textures\medic\notarzt_offroad.paa"};
	};
	class ffrd_v1 {
		displayName = "VIP 1";
		texture[] = {"\rimas_textures\vip\TRG_AMC_offroad1_ex.paa"};
	};
	class ffrd_7n {
		displayName = "7новостей";
		texture[] = {"\rimas_textures\7news\offroad_01_ext_base02_co.paa"};
	};
	class ffrd_ro {
		displayName = "Ржавчина";
		texture[] = {"\rimas_textures\vip1\civ_offroad_rost.paa"};
	};
	class ffrd_bear {
		displayName = "Медведь";
		texture[] = {"\rimas_textures\vip1\bear_offroad.paa"};
	};
	class ffrd_2l {
		displayName = "Две полоски";
		texture[] = {"\rimas_textures\vip1\CIV_OFF1.paa"};
	};
	class ffrd_gv {
		displayName = "GTA V";
		texture[] = {"\rimas_textures\vip2\offroad_gta5.paa"};
	};

	//C_Offroad_01_repair_F
	class ffrd_r_m1 {
		displayName = "МЧС - Механик";
		texture[] = {"\a3\soft_f_bootcamp\offroad_01\Data\offroad_01_ext_repair_civ_co.paa"};
	};
	class ffrd_r_m2 {
		displayName = "МЧС - Медик";
		texture[] = {"\rimas_textures\medic\notarzt_offroad.paa"};
	};

	//B_G_Offroad_01_F
	class ffrd_bg_r {
		displayName = "Бандитский";
		texture[] = {"\A3\soft_F_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa"};
	};
	class ffrd_bg_rv {
		displayName = "VIP Бандитский";
		texture[] = {"\rimas_textures\vip1\offroad_reb.paa"};
	};

	//B_Quadbike_01_F
	class qdbk_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\quad_police_co2.paa"};
	};
	class qdbk_reb {
		displayName = "Зеленый камуфляж";
		texture[] = {"\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"};
	};
	class qdbk_b {
		displayName = "Черный";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"};
	};
	class qdbk_bl {
		displayName = "Синий";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"};
	};
	class qdbk_r {
		displayName = "Красный";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"};
	};
	class qdbk_w {
		displayName = "Белый";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"};
	};
	class qdbk_g {
		displayName = "Зеленый";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"};
	};
	class qdbk_cm {
		displayName = "Камуфляж";
		texture[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
	};

	//C_Hatchback_01_F
	class htchb_bs {
		displayName = "Бежевый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"};
	};
	class htchb_g {
		displayName = "Зеленый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"};
	};
	class htchb_bl {
		displayName = "Синий";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"};
	};
	class htchb_bbl {
		displayName = "Темно-синий";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"};
	};
	class htchb_y {
		displayName = "Желтый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"};
	};
	class htchb_w {
		displayName = "Белый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"};
	};
	class htchb_gr {
		displayName = "Серый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"};
	};
	class htchb_b {
		displayName = "Черный";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"};
	};

	//C_Hatchback_01_sport_F
	class htchbs_r {
		displayName = "Красный";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"};
	};
	class htchbs_br {
		displayName = "Темно-красный";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"};
	};
	class htchbs_o {
		displayName = "Оранжевый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"};
	};
	class htchbs_bw {
		displayName = "Черно-белый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"};
	};
	class htchbs_t {
		displayName = "Tan";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"};
	};
	class htchbs_g {
		displayName = "Зеленый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"};
	};
	class htchbs_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\police_hatchback.paa"};
	};
	class htchbs_va {
		displayName = "Vip Art";
		texture[] = {"\rimas_textures\vip\asiimov_hatchback_textures.paa"};
	};
	class htchbs_vme {
		displayName = "Vip Monster Energy";
		texture[] = {"\rimas_textures\vip\limousine_sport_monster.paa"};
	};
	class htchbs_h {
		displayName = "Халк";
		texture[] = {"\rimas_textures\vip2\hatchback_hulk.paa"};
	};
	class htchbs_s {
		displayName = "Симпсоны";
		texture[] = {"\rimas_textures\vip2\hatchback_simpsons.paa"};
	};

	//C_SUV_01_F
	class suv_br {
		displayName = "Темно-красный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"};
	};
	class suv_b {
		displayName = "Черный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"};
	};
	class suv_s {
		displayName = "Серебряный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"};
	};
	class suv_o {
		displayName = "Оранжевый";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"};
	};
	class suv_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\police_suv.paa"};
	};
	class suv_vx6 {
		displayName = "VIP BMW X6";
		texture[] = {"\rimas_textures\vip\X6_suv.paa"};
	};
	class suv_vd {
		displayName = "VIP пончики";
		texture[] = {"\rimas_textures\vip\donut_suv_textures.paa"};
	};
	class suv_vnc {
		displayName = "VIP NyanCat";
		texture[] = {"\rimas_textures\vip\nyan_suv.paa"};
	};
	class suv_vo {
		displayName = "VIP океан";
		texture[] = {"\rimas_textures\vip1\suv_1.paa"};
	};
	class suv_vs {
		displayName = "VIP космос";
		texture[] = {"\rimas_textures\vip1\suv_universe.paa"};
	};
	class suv_vpm {
		displayName = "VIP PacMan";
		texture[] = {"\rimas_textures\vip1\suvPacMan.paa"};
	};
	class suv_vme {
		displayName = "VIP Monster Energy";
		texture[] = {"\rimas_textures\vip1\suv_Monster_energy_block.paa"};
	};
	class suv_vgr {
		displayName = "VIP Ghostrider";
		texture[] = {"\rimas_textures\vip1\suv_Ghostrider.paa"};
	};
	class suv_vsw {
		displayName = "VIP Star Wars";
		texture[] = {"\rimas_textures\vip1\suv_starwarscar.paa"};
	};
	class suv_vcx {
		displayName = "VIP Comix";
		texture[] = {"\rimas_textures\vip2\suv_comix.paa"};
	};
	class suv_vfs {
		displayName = "VIP Fire Skull";
		texture[] = {"\rimas_textures\vip2\suv_fireskull.paa"};
	};
	class suv_vme2 {
		displayName = "VIP Monster Energy 2";
		texture[] = {"\rimas_textures\vip2\suv_monsterenergy.paa"};
	};

	//C_Van_01_transport_F
	//C_Van_01_box_F
	class vtt_w {
		displayName = "Белый";
		texture[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
	};
	class vtt_r {
		displayName = "Красный";
		texture[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
	};

	//O_MRAP_02_F
	//O_MRAP_02_hmg_F
	class mrp_g {
		displayName = "Зеленый";
		texture[] = {"a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa","a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"};
	};
	class mrp_med {
		displayName = "Медик";
		texture[] = {"\rimas_textures\medic\ifrit_medic2_front.paa","\rimas_textures\medic\ifrit_medic2_hinten.paa"};
	};
	class mrp_cg {
		displayName = "Гражданские банды";
		texture[] = {"\rimas_textures\ifrit_civ_1.paa","\rimas_textures\ifrit_civ_2.paa","\rimas_textures\ifrit_civ_2.paa"};
	};
	class mrp_ur {
		displayName = "Urban";
		texture[] = {"\rimas_textures\vip1\ifrit_urban_1.paa","\rimas_textures\vip1\ifrit_urban_2.paa"};
	};
	class mrp_lz {
		displayName = "LosZetas";
		texture[] = {"\rimas_textures\ifrit_lzc_1.paa","\rimas_textures\ifrit_lzc_2.paa"};
	};
	class mrp_amc {
		displayName = "AMC";
		texture[] = {"\rimas_textures\amc\old_amc_ifrit_1.paa","\rimas_textures\amc\old_amc_ifrit_2.paa"};
	};
	class mrp_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\ifrit1.paa","\sdr_pack\vehicleTextures\ifrit2.paa"};
	};
	class mrp_aff {
		displayName = "AFF";
		texture[] = {"\rimas_textures\isf\ifrit_isf_1.paa","\rimas_textures\isf\ifrit_isf_2.paa"};
	};
	class mrp_dnd {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\ifrit_1.paa","\ec_pack\vehicles\ifrit_2.paa"};
	};
	class mrp_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\ifrit_1.paa","\arg_grk_pack\vehs\ifrit_2.paa"};
	};
	class mrp_fb {
		displayName = "FB";
		texture[] = {"\fb_pack\vehicles\ifrit\ifrit_1.paa","\fb_pack\vehicles\ifrit\ifrit_2.paa"};
	};
	class mrp_swat {
		displayName = "SWAT";
		texture[] = {"\rimas_textures\swat\swat_ifrit_0.paa","\rimas_textures\swat\swat_ifrit_1.paa"};
	};
	class mrp_dea {
		displayName = "DEA";
		texture[] = {"\rimas_veh_t\data\dea\dea_ifrit1.paa","\rimas_veh_t\data\dea\dea_ifrit2.paa"};
	};
	class mrp_7n {
		displayName = "7NEWS";
		texture[] = {"\rimas_textures\7news\mrap_02_ext_01_co.paa","\rimas_textures\7news\mrap_02_ext_02_co.paa"};
	};
	class mrp_vl {
		displayName = "VL";
		texture[] = {"\vl_pack\VehTextures\ifrit1.paa","\vl_pack\VehTextures\ifrit2.paa"};
	};
	class mrp_mc {
		displayName = "W";
		texture[] = {"\vet_mc_pack\O_MRAP_02_F\MRAP_02_ext_01_CO.paa","\vet_mc_pack\O_MRAP_02_F\MRAP_02_ext_02_CO.paa"};
	};
	class mrp_vrs {
		displayName = "VRS";
		texture[] = {"\extk_pack\vehicles\extk_ifrit1.paa","\extk_pack\vehicles\extk_ifrit2.paa"};
	};
	class mrp_rfa {
		displayName = "RFA";
		texture[] = {"\rfa_packJW\data\vehicl\RFA_ifrit_before.paa","\rfa_packJW\data\vehicl\RFA_ifrit_back.paa"};
	};
	class mrp_muj {
		displayName = "M";
		texture[] = {"\mujahedi_pack\ifrit\muj_ifrit_01.paa","\mujahedi_pack\ifrit\muj_ifrit_02.paa"};
	};
	class mrp_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\IFRIT_1.paa","\nsb_pack\vech\IFRIT_2.paa"};
	};
	class mrp_7th {
		displayName = "7th";
		texture[] = {"\un_pack\Veh\ifrit_01.paa","\un_pack\Veh\ifrit_02.paa"};
	};
	class mrp_ira {
		displayName = "IRA";
		texture[] = {"\ira_pack\vehicles\ira_ifrit_1.paa","\ira_pack\vehicles\ira_ifrit_2.paa"};
	};
	class mrp_ccp {
		displayName = "FAJ";
		texture[] = {"\cccp_pack\vehicles\ifrit0.paa","\cccp_pack\vehicles\ifrit1.paa"};
	};
	class mrp_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_ifrit_1.paa","\ics_pack\veh\ics_ifrit_2.paa"};
	};
	class mrp_la {
		displayName = "CDS";
		texture[] = {"\la_pack\veh\la_ifrit_1.paa","\la_pack\veh\la_ifrit_2.paa"};
	};
	class mrp_bst {
		displayName = "BST";
		texture[] = {"\bastion_pack\ifrit\mrap_02_ext_01_co.paa","\bastion_pack\ifrit\mrap_02_ext_02_co.paa"};
	};
	class mrp_fsg {
		displayName = "FSG";
		texture[] = {"\fsg_pack\vehs\ifrit_1.paa","\fsg_pack\vehs\ifrit_2.paa"};
	};

	//B_mas_HMMWV_UNA
	class hmmv_reb {
		displayName = "Бандитский";
		texture[] = {"\mas_cars\hmmwv\data\hmmwv_body_co.paa"};
	};
	class hmmv_fed {
		displayName = "SWAT/CIA";
		texture[] = {"\rimas_textures\swat\HMMWV\hmmwv_body_co.paa"};
	};
	class hmmv_sdr {
		displayName = "SDR";
		texture[] = {"\rimas_textures\sdr\hmmwv\hmmwv_body_co.paa.paa"};
	};
	class hmmv_fb {
		displayName = "FB";
		texture[] = {"\rimas_textures\amc\hmmwv_body_co.paa"};
	};
	class hmmv_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\hmmwv_body_co.paa"};
	};
	class hmmv_mc {
		displayName = "W";
		texture[] = {"\rimas_textures\mc\hmmwv_body_co.paa"};
	};
	class hmmv_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\hmmwv_body_co.paa"};
	};

	//B_Heli_Light_01_F
	//C_Heli_Light_01_civil_F
	class humm_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\police_heli.paa"};
	};
	class humm_cia {
		displayName = "CIA";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};
	};
	class humm_led {
		displayName = "LED";
		texture[] = {"\altmerion_prokuratura\veh\humm.paa"};
	};
	class humm_dea {
		displayName = "DEA";
		texture[] = {"\rimas_veh_t\data\dea\dea_humming.paa"};
	};
	class humm_bl {
		displayName = "Синий";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
	};
	class humm_r {
		displayName = "Красный";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
	};
	class humm_vme {
		displayName = "VIP Monster Energy";
		texture[] = {"\rimas_textures\vip\limousine_sport_monster.paa"};
	};
	class humm_bln {
		displayName = "Синяя линия";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"};
	};
	class humm_llp {
		displayName = "Эллиптический";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
	};
	class humm_fr {
		displayName = "Яростный";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
	};
	class humm_bj {
		displayName = "Голубые джинсы";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
	};
	class humm_rl {
		displayName = "Красная лента";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
	};
	class humm_sn {
		displayName = "Закат";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
	};
	class humm_vrn {
		displayName = "Ворон";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
	};
	class humm_wv {
		displayName = "Голубые волны";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
	};
	class humm_reb {
		displayName = "Бандитский";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
	};
	class humm_med {
		displayName = "Скорая";
		texture[] = {"\rimas_textures\medic\notarzt_hummingbird.paa"};
	};
	class humm_rg {
		displayName = "Бандитская группировка";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"};
	};
	class humm_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\Hemming.paa"};
	};
	class humm_swt {
		displayName = "SWAT";
		texture[] = {"\rimas_textures\swat\swat_hum.paa"};
	};
	class humm_rfa {
		displayName = "RFA";
		texture[] = {"\rfa_packJW\data\vehicl\RFA_hum.paa"};
	};
	class humm_nsb {
		displayName = "KSK";
		texture[] = {"\ksk\vh\mh-9_ksk.paa"};
	};
	class humm_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\mh_9.paa"};
	};
	class humm_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_humm.paa"};
	};
	class humm_gra {
		displayName = "Серый";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};
	};
	class humm_lg {
		displayName = "Светлый";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};
	};
	class humm_shd {
		displayName = "Тень";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};
	};
	class humm_shr {
		displayName = "Шериф";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};
	};
	class humm_wsp {
		displayName = "Оса";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};
	};
	class humm_tx {
		displayName = "Такси";
		texture[] = {"\rimas_textures\taxi_heli.paa"};
	};
	class humm_fsg {
		displayName = "FSG";
		texture[] = {"\fsg_pack\vehs\hummingbird.paa"};
	};
	class humm_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\hummingbird.paa"};
	};

	//B_mas_UH1Y_UNA_F
	class uh1y_fed {
		displayName = "Полиция";
		texture[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
	};
	class uh1y_reb {
		displayName = "Группировки";
		texture[] = {"mas_eli\UH1Y\data\uh1y_ext_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_aff {
		displayName = "AFF";
		texture[] = {"\isf_ita_pack\Vech\data\uh1y_ext_ita_cm.paa","\isf_ita_pack\Vech\data\uh1y_int_ita_co.paa"};
	};
	class uh1y_fb {
		displayName = "FB";
		texture[] = {"\fb_pack\vehicles\uh1y\uh1y_1.paa","\fb_pack\vehicles\uh1y\uh1y_2.paa"};
	};
	class uh1y_rfa {
		displayName = "RFA";
		texture[] = {"\rfa_packJW\data\vehicl\RFA_uh1_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_muj {
		displayName = "M";
		texture[] = {"\mujahedi_pack\uh1y\uh1ybody_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\UH1Y_camo.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_ira {
		displayName = "IRA";
		texture[] = {"\ira_pack\vehicles\ira_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_mc {
		displayName = "W";
		texture[] = {"\vet_mc_pack\B_mas_UH1Y_UNA_F\uh1y_ext_co.paa","\vet_mc_pack\B_mas_UH1Y_UNA_F\uh1y_int_co.paa"};
	};
	class uh1y_dea {
		displayName = "DEA";
		texture[] = {"\rimas_veh_t\data\dea\dea_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_la {
		displayName = "CDS";
		texture[] = {"\la_pack\veh\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_7th {
		displayName = "7th";
		texture[] = {"\un_pack\Veh\uh1_UN.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_fsg {
		displayName = "FSH";
		texture[] = {"\fsg_pack\vehs\uh.paa","\fsg_pack\vehs\uh2.paa"};
	};

	//I_Heli_light_03_unarmed_F
	class hllc_cia {
		displayName = "CIA";
		texture[] = {"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"};
	};
	class hllc_med {
		displayName = "МЧС";
		texture[] = {"\rimas_textures\medic\notarzt_hellcat.paa"};
	};
	class hllc_g {
		displayName = "Зеленый";
		texture[] = {"\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_co.paa"};
	};
	class hllc_7n {
		displayName = "7новостей";
		texture[] = {"\rimas_textures\press_hellcat.paa"};
	};
	class hllc_rg {
		displayName = "Бандитская группировка";
		texture[] = {"\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa"};
	};
	class hllc_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\police_hellcat.paa"};
	};
	class hllc_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\Hellcat.paa"};
	};
	class hllc_gra {
		displayName = "W";
		texture[] = {"\rimas_textures\hellcat_grey.paa"};
	};
	class hllc_13 {
		displayName = "13";
		texture[] = {"\13_pack\data\XX_hellcat_13.paa"};
	};
	class hllc_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\hellcat.paa"};
	};
	class hllc_swt {
		displayName = "SWAT";
		texture[] = {"\rimas_textures\swat\swat_hellcat.paa"};
	};
	class hllc_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\nsb_hellcat.paa"};
	};
	class hllc_muj {
		displayName = "M";
		texture[] = {"\mujahedi_pack\hellcat\heli_light_03_base_co.paa"};
	};
	class hllc_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\hellcat.paa"};
	};
	class hllc_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_hellcat.paa"};
	};
	class hllc_ccp {
		displayName = "FAJ";
		texture[] = {"\cccp_pack\vehicles\hellcat.paa"};
	};
	class hllc_dea {
		displayName = "DEA";
		texture[] = {"\rimas_veh_t\data\dea\dea_hellcat.paa"};
	};

	//B_Heli_Transport_03_unarmed_F
	class hrn_fed {
		displayName = "Полиция/CIA";
		texture[] = {"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"};
	};
	class hrn_med {
		displayName = "МЧС";
		texture[] = {"\rimas_textures\medic\huron_ext01.paa","\rimas_textures\medic\huron_ext02.paa"};
	};

	//I_Heli_Transport_02_F
	class hltt_bw {
		displayName = "Черно-белый";
		texture[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"};
	};
	class hltt_gw {
		displayName = "Зелено-белый";
		texture[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"};
	};
	class hltt_cia {
		displayName = "CIA";
		texture[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
	};

	//ext_sab_boat
	class xsb_s {
		displayName = "Sailing";
		texture[] = {"\sab_boat\data\texture.paa"};
	};
	class xsb_f {
		displayName = "Fuel";
		texture[] = {"\sab_boat\data\texture2.paa"};
	};
	class xsb_v {
		displayName = "Vrana";
		texture[] = {"\sab_boat\data\texture3.paa"};
	};
	class xsb_r {
		displayName = "Redstone";
		texture[] = {"\sab_boat\data\texture4.paa"};
	};

	//dezkit_b206_ems
	class dems_med {
		displayName = "МЧС";
		texture[] = {"\dezkit_b206\skins\ems1_1.paa","\dezkit_b206\skins\ems1_2.paa"};
	};
	class dems_7n {
		displayName = "Пресса";
		texture[] = {"\dezkit_b206\skins\tv1_1.paa","\dezkit_b206\skins\tv1_2.paa"};
	};

	//B_APC_Wheeled_01_cannon_F
	class apcw_fed {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\swat\Marshal\m_swat_base.paa","\rimas_textures\swat\Marshal\m_swat_ads.paa","\rimas_textures\swat\Marshal\m_swat_tows.paa"};
	};
	class apcw_civ {
		displayName = "Стандарт";
		texture[] = {"\a3\armor_f_beta\APC_Wheeled_01\Data\apc_wheeled_01_base_co.paa"};
	};

	//O_Heli_Light_02_unarmed_F
	class orc_cia {
		displayName = "CIA";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"};
	};
	class orc_wb {
		displayName = "Бело-синий";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"};
	};
	class orc_cm {
		displayName = "Камуфляж";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"};
	};
	class orc_reb {
		displayName = "Бандитский";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
	};
	class orc_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\police_orca.paa"};
	};
	class orc_med {
		displayName = "Нелегал";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
	};
	class orc_med_1 {
		displayName = "МЧС";
		texture[] = {"\rimas_textures\medic\orca_notarzt.paa"};
	};
	class RRPVehicle_HURON_EMS {
		displayName = "МЧС";
		texture[] = 
		{
			"\rimas_ems\helicopters\RRPVehicle_HURON_EMS_2.paa",
			"\rimas_ems\helicopters\RRPVehicle_HURON_EMS_1.paa"
		};
	};

	//B_MRAP_01_F
	class bmrp_cia {
		displayName = "CIA";
		texture[] = {"\rimas_textures\cia_front.paa","\rimas_textures\cia_back.paa"};
	};
	class bmrp_ds {
		displayName = "Пустыный";
		texture[] = {"\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa"};
	};

	//I_MRAP_03_hmg_F
	class strdh_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\striders\strider_police.paa","\rimas_textures\striders\strider_police.paa"};
	};

	//I_MRAP_03_F
	class strd_cop {
		displayName = "Полиция";
		texture[] = {"\rimas_textures\striders\strider_police.paa"};
	};
	class strd_aff {
		displayName = "AFF";
		texture[] = {"\rimas_textures\striders\strider_aff.paa"};
	};
	class strd_reb {
		displayName = "Бандитский";
		texture[] = {"\a3\soft_F_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"};
	};
	class strd_wd {
		displayName = "Лес";
		texture[] = {"\rimas_textures\striders\Wald\mrap_03_ext_wd1_co.paa"};
	};
	class strd_rst {
		displayName = "RST";
		texture[] = {"\rimas_textures\striders\strider_rst.paa"};
	};
	class strd_swt {
		displayName = "SWAT";
		texture[] = {"\rimas_textures\swat\swat_strider.paa"};
	};
	class strd_med {
		displayName = "МЧС";
		texture[] = {"\rimas_textures\striders\strider_medic.paa"};
	};
	class strd_dea {
		displayName = "DEA";
		texture[] = {"\rimas_veh_t\data\dea\dea_strider.paa"};
	};
	class strd_nsb {
		displayName = "KSK";
		texture[] = {"\ksk\vh\strider_ksk.paa"};
	};

	//B_Truck_01_fuel_CIV_F
	class tfc_def {
		displayName = "Стандарт";
		texture[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_Fuel_CO.paa"};
	};
	class tfc_bl {
		displayName = "Синий";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_blue.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_blue.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_blue.paa"};
	};
	class tfc_gs {
		displayName = "Газон";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_grass.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_grass.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_grass.paa"};
	};
	class tfc_mh {
		displayName = "Болотный";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_marsh.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_marsh.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_marsh.paa"};
	};
	class tfc_or {
		displayName = "Оранжевый";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_orange.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_orange.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_orange.paa"};
	};
	class tfc_pr {
		displayName = "Фиолетовый";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_purple.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_purple.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_purple.paa"};
	};
	class tfc_r {
		displayName = "Красный";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_red.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_red.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_red.paa"};
	};
	class tfc_y {
		displayName = "Желтый";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_yellow.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_yellow.paa","\rimas_vehicles\data\hemtt\truck_01_ext_03_yellow.paa"};
	};

	//B_Truck_01_box_CIV_F
	//B_Truck_01_mover_F
	class hmt_def {
		displayName = "Стандарт";
		texture[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"};
	};
	class hmt_bl {
		displayName = "Синий";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_blue.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_blue.paa"};
	};
	class hmt_gs {
		displayName = "Газон";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_grass.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_grass.paa"};
	};
	class hmt_mh {
		displayName = "Болотный";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_marsh.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_marsh.paa"};
	};
	class hmt_or {
		displayName = "Оранжевый";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_orange.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_orange.paa"};
	};
	class hmt_pr {
		displayName = "Фиолетовый";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_purple.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_purple.paa"};
	};
	class hmt_r {
		displayName = "Красный";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_red.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_red.paa"};
	};
	class hmt_y {
		displayName = "Желтый";
		texture[] = {"\rimas_vehicles\data\hemtt\truck_01_ext_01_yellow.paa","\rimas_vehicles\data\hemtt\truck_01_ext_02_yellow.paa"};
	};

	//I_Truck_02_covered_F
	class itc_cm {
		displayName = "Камо";
		texture[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_INDP_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_INDP_co.paa"};
	};
	class itc_cia {
		displayName = "CIA";
		texture[] = {"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)","#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"};
	};

	//I_Truck_02_covered_CIV_F
	class itcc_or {
		displayName = "Оранжевый";
		texture[] = {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
	};
	class itcc_r {
		displayName = "Красный";
		texture[] = {"\rimas_vehicles\data\zamak\zk_red_f.paa","\rimas_vehicles\data\zamak\zk_red_t.paa"};
	};
	class itcc_s {
		displayName = "Небесный";
		texture[] = {"\rimas_vehicles\data\zamak\zk_sky_f.paa","\rimas_vehicles\data\zamak\zk_sky_t.paa"};
	};
	class itcc_w {
		displayName = "Белый";
		texture[] = {"\rimas_vehicles\data\zamak\zk_white_f.paa","\rimas_vehicles\data\zamak\zk_white_t.paa"};
	};
	class itcc_y {
		displayName = "Желтый";
		texture[] = {"\rimas_vehicles\data\zamak\zk_yellow_f.paa","\rimas_vehicles\data\zamak\zk_yellow_t.paa"};
	};

	//O_Heli_Transport_04_bench_F
	class htb_cia {
		displayName = "CIA";
		texture[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_bench_black_CO.paa"};
	};

	//shounka
	class shnk_w {
		displayName = "Белый";
		texture[] = {"shounka_a3_base\couleurs\blanc.paa"};
	};
	class shnk_r {
		displayName = "Красный";
		texture[] = {"shounka_a3_base\couleurs\rouge.paa"};
	};
	class shnk_bbl {
		displayName = "Тёмно-синий";
		texture[] = {"shounka_a3_base\couleurs\bleufonce.paa"};
	};
	class shnk_gr {
		displayName = "Серый";
		texture[] = {"shounka_a3_base\couleurs\gris.paa"};
	};
	class shnk_y {
		displayName = "Желтый";
		texture[] = {"shounka_a3_base\couleurs\jaune.paa"};
	};
	class shnk_bbr {
		displayName = "Тёмно-коричневый";
		texture[] = {"shounka_a3_base\couleurs\noir.paa"};
	};
	class shnk_o {
		displayName = "Оранжевый";
		texture[] = {"shounka_a3_base\couleurs\orange.paa"};
	};
	class shnk_rs {
		displayName = "Розовый";
		texture[] = {"shounka_a3_base\couleurs\rose.paa"};
	};
	class shnk_vi {
		displayName = "Фиолетовый";
		texture[] = {"shounka_a3_base\couleurs\violet.paa"};
	};
	class shnk_bl {
		displayName = "Синий";
		texture[] = {"shounka_a3_base\couleurs\bleu.paa"};
	};
	class shnk_blr {
		displayName = "Тёмно-красный";
		texture[] = {"shounka_a3_base\couleurs\rougefonce.paa"};
	};
	class shnk_g {
		displayName = "Зеленый";
		texture[] = {"shounka_a3_base\couleurs\vert.paa"};
	};
	class shnk_blg {
		displayName = "Тёмно-зеленый";
		texture[] = {"shounka_a3_base\couleurs\vertfonce.paa"};
	};
	class shnk_b {
		displayName = "Чёрный";
		texture[] = {"#(argb,8,8,3)color(0.02,0.02,0.02,1.0,co)"};
	};
	class shnk_bT {
		displayName = "Чёрный (Тонировка)";
		texture[] = {"#(argb,8,8,3)color(0.02,0.02,0.02,1.0,co)","","dkp_gelik_sa\mercedes_g65amg_hq\quiet_vitre_rv\quiet_vitre_toned_full.paa"};
	};
	class shnk_vr {
		displayName = "Красный Extremo rally";
		texture[] = {"shounka_a3_base\couleurs\sport_r.paa"};
	};
	class shnk_vg {
		displayName = "Зеленый Extremo rally";
		texture[] = {"shounka_a3_base\couleurs\sport_g.paa"};
	};
	class shnk_vbl {
		displayName = "Синий Extremo rally";
		texture[] = {"shounka_a3_base\couleurs\sport_b.paa"};
	};
	class shnk_vfc {
		displayName = "Extremo forest camo";
		texture[] = {"shounka_a3_base\couleurs\forest_camo.paa"};
	};
	class shnk_vuc {
		displayName = "Extremo urban camo";
		texture[] = {"shounka_a3_base\couleurs\urban_camo.paa"};
	};
	class shnk_vdc {
		displayName = "Extremo desert camo";
		texture[] = {"shounka_a3_base\couleurs\desert_camo.paa"};
	};
	class shnk_led {
		displayName = "LED";
		texture[] = {"\altmerion_prokuratura\veh\cherokee.paa"};
	};

	//C_Offroad_02_unarmed_F
	class codu_w {
		displayName = "Белый";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"};
	};
	class codu_r {
		displayName = "Красный";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"};
	};
	class codu_o {
		displayName = "Оранжевый";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"};
	};
	class codu_bl {
		displayName = "Синий";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"};
	};

	//C_Plane_Civil_01_F
	class cpc_wbl {
		displayName = "Бело-синий";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_bly {
		displayName = "Сине-желтый";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_gw {
		displayName = "Зелено-белый";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_r {
		displayName = "Красный";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};

	//custom
	class cxc_1 {
		displayName = "2017 Aliceblue";
		texture[] = {"\rimas_veh_t\data\colors\aliceblue.paa"};
	};
	class cxc_2 {
		displayName = "2017 Banana";
		texture[] = {"\rimas_veh_t\data\colors\banana.paa"};
	};
	class cxc_3 {
		displayName = "2017 Blueviolet";
		texture[] = {"\rimas_veh_t\data\colors\blueviolet.paa"};
	};
	class cxc_4 {
		displayName = "2017 Brick";
		texture[] = {"\rimas_veh_t\data\colors\brick.paa"};
	};
	class cxc_5 {
		displayName = "2017 Brown";
		texture[] = {"\rimas_veh_t\data\colors\brown.paa"};
	};
	class cxc_6 {
		displayName = "2017 Burlywood";
		texture[] = {"\rimas_veh_t\data\colors\burlywood.paa"};
	};
	class cxc_7 {
		displayName = "2017 Cadmiumorange";
		texture[] = {"\rimas_veh_t\data\colors\cadmiumorange.paa"};
	};
	class cxc_8 {
		displayName = "2017 Cadmiumyellow";
		texture[] = {"\rimas_veh_t\data\colors\cadmiumyellow.paa"};
	};
	class cxc_9 {
		displayName = "2017 Carrot";
		texture[] = {"\rimas_veh_t\data\colors\carrot.paa"};
	};
	class cxc_10 {
		displayName = "2017 Chocolate";
		texture[] = {"\rimas_veh_t\data\colors\chocolate.paa"};
	};
	class cxc_11 {
		displayName = "2017 Cobalt";
		texture[] = {"\rimas_veh_t\data\colors\cobalt.paa"};
	};
	class cxc_12 {
		displayName = "2017 Coldgrey";
		texture[] = {"\rimas_veh_t\data\colors\coldgrey.paa"};
	};
	class cxc_13 {
		displayName = "2017 Coral";
		texture[] = {"\rimas_veh_t\data\colors\coral.paa"};
	};
	class cxc_14 {
		displayName = "2017 Cyan";
		texture[] = {"\rimas_veh_t\data\colors\cyan.paa"};
	};
	class cxc_15 {
		displayName = "2017 Darkseagreen";
		texture[] = {"\rimas_veh_t\data\colors\darkseagreen.paa"};
	};
	class cxc_16 {
		displayName = "2017 Darkslateblue";
		texture[] = {"\rimas_veh_t\data\colors\darkslateblue.paa"};
	};
	class cxc_17 {
		displayName = "2017 Darkturquoise";
		texture[] = {"\rimas_veh_t\data\colors\darkturquoise.paa"};
	};
	class cxc_18 {
		displayName = "2017 Darkviolet";
		texture[] = {"\rimas_veh_t\data\colors\darkviolet.paa"};
	};
	class cxc_19 {
		displayName = "2017 Dodgerblue";
		texture[] = {"\rimas_veh_t\data\colors\dodgerblue.paa"};
	};
	class cxc_20 {
		displayName = "2017 Emeraldgreen";
		texture[] = {"\rimas_veh_t\data\colors\emeraldgreen.paa"};
	};
	class cxc_21 {
		displayName = "2017 Flesh";
		texture[] = {"\rimas_veh_t\data\colors\flesh.paa"};
	};
	class cxc_22 {
		displayName = "2017 Ghostwhite";
		texture[] = {"\rimas_veh_t\data\colors\ghostwhite.paa"};
	};
	class cxc_23 {
		displayName = "2017 Gold";
		texture[] = {"\rimas_veh_t\data\colors\gold.paa"};
	};
	class cxc_24 {
		displayName = "2017 Goldenrod";
		texture[] = {"\rimas_veh_t\data\colors\goldenrod.paa"};
	};
	class cxc_25 {
		displayName = "2017 Indigo";
		texture[] = {"\rimas_veh_t\data\colors\indigo.paa"};
	};
	class cxc_26 {
		displayName = "2017 Khaki";
		texture[] = {"\rimas_veh_t\data\colors\khaki.paa"};
	};
	class cxc_27 {
		displayName = "2017 Lightskyblue";
		texture[] = {"\rimas_veh_t\data\colors\lightskyblue.paa"};
	};
	class cxc_28 {
		displayName = "2017 Limegreen";
		texture[] = {"\rimas_veh_t\data\colors\limegreen.paa"};
	};
	class cxc_29 {
		displayName = "2017 Melon";
		texture[] = {"\rimas_veh_t\data\colors\melon.paa"};
	};
	class cxc_30 {
		displayName = "2017 Moccasin";
		texture[] = {"\rimas_veh_t\data\colors\moccasin.paa"};
	};
	class cxc_31 {
		displayName = "2017 Olive";
		texture[] = {"\rimas_veh_t\data\colors\olive.paa"};
	};
	class cxc_32 {
		displayName = "2017 Olivedrab";
		texture[] = {"\rimas_veh_t\data\colors\olivedrab.paa"};
	};
	class cxc_33 {
		displayName = "2017 Orange";
		texture[] = {"\rimas_veh_t\data\colors\orange.paa"};
	};
	class cxc_34 {
		displayName = "2017 Peacock";
		texture[] = {"\rimas_veh_t\data\colors\peacock.paa"};
	};
	class cxc_35 {
		displayName = "2017 Purple";
		texture[] = {"\rimas_veh_t\data\colors\purple.paa"};
	};
	class cxc_36 {
		displayName = "2017 Royalblue";
		texture[] = {"\rimas_veh_t\data\colors\royalblue.paa"};
	};
	class cxc_37 {
		displayName = "2017 Saddlebrown";
		texture[] = {"\rimas_veh_t\data\colors\saddlebrown.paa"};
	};
	class cxc_38 {
		displayName = "2017 Sepia";
		texture[] = {"\rimas_veh_t\data\colors\sepia.paa"};
	};
	class cxc_39 {
		displayName = "2017 Slateblue";
		texture[] = {"\rimas_veh_t\data\colors\slateblue.paa"};
	};
	class cxc_40 {
		displayName = "2017 Slategray";
		texture[] = {"\rimas_veh_t\data\colors\slategray.paa"};
	};
	class cxc_41 {
		displayName = "2017 Steelblue";
		texture[] = {"\rimas_veh_t\data\colors\steelblue.paa"};
	};
	class cxc_42 {
		displayName = "2017 Tan";
		texture[] = {"\rimas_veh_t\data\colors\tan.paa"};
	};
	class cxc_43 {
		displayName = "2017 Teal";
		texture[] = {"\rimas_veh_t\data\colors\teal.paa"};
	};
	class cxc_44 {
		displayName = "2017 Tomato";
		texture[] = {"\rimas_veh_t\data\colors\tomato.paa"};
	};
	class cxc_45 {
		displayName = "2017 Turquoiseblue";
		texture[] = {"\rimas_veh_t\data\colors\turquoiseblue.paa"};
	};

	//ivory gt500 skins
	class ivgt_rw {
		displayName = "White on red";
		texture[] = {"\ivory_textures\data\gt500\bodyRW.paa"};
	};
	class ivgt_bg {
		displayName = "Gray on black";
		texture[] = {"\ivory_textures\data\gt500\bodyBG.paa"};
	};
	class ivgt_gb {
		displayName = "Black on gray";
		texture[] = {"\ivory_textures\data\gt500\bodyGB.paa"};
	};
	class ivgt_wb {
		displayName = "Blue on white";
		texture[] = {"\ivory_textures\data\gt500\bodyWB.paa"};
	};

	class wrx_ira {
		displayName = "IRA";
		texture[] = {"\ira_pack\vehicles\subaru.paa","","#(argb,8,8,3)color(0,0,0,0.99,CA)","#(argb,8,8,3)color(0,0,0,0.01,CA)"};
	};
	//d3s
	class kraz_1 {
		displayName = "AO";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_AO_co.paa"};
	};
	class kraz_2 {
		displayName = "BLUE";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_blue_co.paa"};
	};
	class kraz_3 {
		displayName = "BREEZE";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_breeze_co.paa"};
	};
	class kraz_4 {
		displayName = "GRAY";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_gray_co.paa"};
	};
	class kraz_5 {
		displayName = "GREEN";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_green_co.paa"};
	};
	class kraz_6 {
		displayName = "HAKI";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_haki_co.paa"};
	};
	class kraz_7 {
		displayName = "ORANGE";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_orange_co.paa"};
	};
	class kraz_8 {
		displayName = "RED";
		texture[] = {"\d3s_kraz_6316\data\skins\6316_red_co.paa"};
	};
	//d3s MAZ
	class maz_1 {
		displayName = "AO";
		texture[] = {"\d3s_maz_pack\data\skins\6317_AO_co.paa"};
	};
	class maz_2 {
		displayName = "Blue";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Blue.paa"};
	};
	class maz_3 {
		displayName = "Green";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Green.paa"};
	};
	class maz_4 {
		displayName = "Khaki";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Khaki.paa"};
	};
	class maz_5 {
		displayName = "Orange";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Orange.paa"};
	};
	class maz_6 {
		displayName = "Red";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Red.paa"};
	};
	class maz_7 {
		displayName = "Violet";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Violet.paa"};
	};
	class maz_8 {
		displayName = "Yellow";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Yellow.paa"};
	};
		//d3s MAZ 2
	class maz_1v {
		displayName = "1";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo1.paa"};
	};
	class maz_2v {
		displayName = "2";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo2.paa"};
	};
	class maz_3v {
		displayName = "3";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo3.paa"};
	};
	class maz_4v {
		displayName = "4";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo4.paa"};
	};
	class maz_5v {
		displayName = "5";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo5.paa"};
	};
	class maz_6v {
		displayName = "6";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo6.paa"};
	};
	class maz_7v {
		displayName = "7";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo7.paa"};
	};
	//next
	class next1 {
		displayName = "1";
		texture[] = {"\d3s_ural_next\data\skins\NEXT_cab.paa"};
	};
	class next2 {
		displayName = "2";
		texture[] = {"\d3s_ural_next\data\skins\NEXT_cab_blue.paa"};
	};
	class next3 {
		displayName = "3";
		texture[] = {"\d3s_ural_next\data\skins\NEXT_cab_green.paa"};
	};
	class next4 {
		displayName = "4";
		texture[] = {"\d3s_ural_next\data\skins\NEXT_cab_haki.paa"};
	};
	class next5 {
		displayName = "5";
		texture[] = {"\d3s_ural_next\data\skins\NEXT_cab_orange.paa"};
	};
	class next6 {
		displayName = "6";
		texture[] = {"\d3s_ural_next\data\skins\NEXT_cab_red.paa"};
	};
	//спасибо за все
	class mike {
		displayName = "Mike Pol";
		texture[] = {"\d3s_x222_18\data\skins\Mike3.paa"};
	};

	class med_donatCar {
		displayName = "Exclusive_Edition";
		texture[] = {"\d3s_x222_18\data\skins\Exclusive_Edition10.paa"};
	};

	class punisher {
		displayName = "Punisher";
		texture[] = {"\d3s_x222_18\data\skins\Panisher2.paa"};
	};
	class igorp {
		displayName = "Igor";
		texture[] = {"\d3s_x222_18\data\skins\IgorPolosatov.paa"};
	};
	//Taxi
	class Taxivckss {
		displayName = "Taxivckss";
		texture[] = {"\d3s_vklasse_17\data\skins\V250_TAXI.paa"};
	};
	class SWAT_BUS {
		displayName = "SWAT_BUS";
		texture[] = {"\d3s_vklasse_17\data\skins\Obsidiant_Black.paa"};
	};
	//OKA
	class OKA_1 {
		displayName = "Oka 1";
		texture[] = {"\d3s_oka\data\skins\1.paa"};
	};
	class OKA_2 {
		displayName = "Oka 2";
		texture[] = {"\d3s_oka\data\skins\2.paa"};
	};
	class OKA_3 {
		displayName = "Oka 3";
		texture[] = {"\d3s_oka\data\skins\3.paa"};
	};
	class OKA_4 {
		displayName = "Oka 4";
		texture[] = {"\d3s_oka\data\skins\4.paa"};
	};
	class OKA_5 {
		displayName = "Oka 5";
		texture[] = {"\d3s_oka\data\skins\5.paa"};
	};
	class OKA_6 {
		displayName = "Oka 6";
		texture[] = {"\d3s_oka\data\skins\6.paa"};
	};
	class ivent_oka_1 {
		displayName = "1";
		texture[] = {"\welmen_battle_veh\data\ivent_oka01.paa"};
	};
	class ivent_oka_2 {
		displayName = "2";
		texture[] = {"\welmen_battle_veh\data\ivent_oka02.paa"};
	};
	class ivent_oka_3 {
		displayName = "3";
		texture[] = {"\welmen_battle_veh\data\ivent_oka03.paa"};
	};
	class ivent_oka_4 {
		displayName = "4";
		texture[] = {"\welmen_battle_veh\data\ivent_oka04.paa"};
	};
	//d3s_f90_18
	class f90_1 {
		displayName = "Средиземноморский синий";
		texture[] = {"\d3s_f90_18\data\skins\F90_Mediterranean_Blue.paa"};
	};
	class f90_2 {
		displayName = "Кедр";
		texture[] = {"\d3s_f90_18\data\skins\F90_Atlas_Cedar.paa"};
	};
	class f90_3 {
		displayName = "Черный";
		texture[] = {"\d3s_f90_18\data\skins\F90_Black_Uni.paa"};
	};
	class f90_4 {
		displayName = "Кешемир";
		texture[] = {"\d3s_f90_18\data\skins\F90_Cashmere_Silver.paa"};
	};
	class f90_5 {
		displayName = "Ледяной";
		texture[] = {"\d3s_f90_18\data\skins\F90_Glacier_Silver.paa"};
	};
	class f90_6 {
		displayName = "Имперский синий";
		texture[] = {"\d3s_f90_18\data\skins\F90_Imperial_Blue.paa"};
	};
	class f90_7 {
		displayName = "Ятоба";
		texture[] = {"\d3s_f90_18\data\skins\F90_Jatoba.paa"};
	};
	class f90_8 {
		displayName = "Софисто серый";
		texture[] = {"\d3s_f90_18\data\skins\F90_Sophisto_Grey.paa"};
	};
	class f90_9 {
		displayName = "Альмандин Браун";
		texture[] = {"\d3s_f90_18\data\skins\F90_Almandine_Brown.paa"};
	};
	class f90_10 {
		displayName = "Белый";
		texture[] = {"\d3s_f90_18\data\skins\F90_Alpine_White.paa"};
	};

	class f90_11 {
		displayName = "Остин Желтый";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Austin_Yellow.paa"};
	};
	class f90_12 {
		displayName = "Черный Азурит";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Azurite_Black.paa"};
	};
	class f90_13 {
		displayName = "Черный Сапфир";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Black_Sapphire.paa"};
	};
	class f90_14 {
		displayName = "Кварцевое Шампанское";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Champagne_Quartz.paa"};
	};
	class f90_15 {
		displayName = "Донингтон Грей";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Donington_Gray.paa"};
	};
	class f90_16 {
		displayName = "Холодный Темно-красный";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Frozen_Dark_Red.paa"};
	};
	class f90_17 {
		displayName = "Зеленый Жемчуг";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Green_Pearl.paa"};
	};
	class f90_18 {
		displayName = "Marina Bay Blue";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Marina_Bay_Blue.paa"};
	};
	class f90_19 {
		displayName = "Минеральный Серый";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Mineral_Grey.paa"};
	};
	class f90_20 {
		displayName = "Мощность";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_MPower.paa"};
	};
	class f90_21 {
		displayName = "Серебряный Родонит";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Rhodonite_Silver.paa"};
	};
	class f90_22 {
		displayName = "Сахир Оранж";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Sakhir_Orange.paa"};
	};
	class f90_23 {
		displayName = "Черный Сапфир";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Sapphire_Black.paa"};
	};
	class f90_24 {
		displayName = "Сильверстоун";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Silverstone.paa"};
	};
	class f90_25 {
		displayName = "Сингапурский Серый";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Singapore_Gray.paa"};
	};
	class f90_26 {
		displayName = "Snapper Rocks Blue";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Snapper_Rocks_Blue.paa"};
	};
	class f90_27 {
		displayName = "Яс Марина Синий";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_Yas_Marina_Blue.paa"};
	};
	class f90_28 {
		displayName = "Яс Марина Синий";
		texture[] = {"\d3s_f90_18\data\skins\VIP\F90_AO_co.paa"};
	};
	//d3s_charger_15
	class charger_1 {
		displayName = "Синий";
		texture[] = {"\d3s_charger_15\data\skins\CHR_B5_Blue.paa"};
	};
	class charger_2 {
		displayName = "Серебряный залив";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Billet_Silver.paa"};
	};
	class charger_3 {
		displayName = "Гранитный Кристалл";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Granite_Crystal.paa"};
	};
	class charger_4 {
		displayName = "Белый";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Ivory_White.paa"};
	};
	class charger_5 {
		displayName = "Jazz";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Jazz_Blue.paa"};
	};
	class charger_6 {
		displayName = "Черный призрак";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Phantom_Black.paa"};
	};
	class charger_7 {
		displayName = "Черная Смоль";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Pitch_Black.paa"};
	};
	class charger_8 {
		displayName = "Красная Линия";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Redline.paa"};
	};
	class charger_9 {
		displayName = "Tor Red";
		texture[] = {"\d3s_charger_15\data\skins\CHR_Tor_Red.paa"};
	};
	class charger_10 {
		displayName = "Заводской";
		texture[] = {"\d3s_charger_15\data\skins\CHR_AO_co.paa"};
	};
	//d3s_e350_16
	class e350_1 {
		displayName = "Синий";
		texture[] = {"\d3s_w213_16\data\skins\w213_brilliant_blue.paa"};
	};
	class e350_2 {
		displayName = "Синий";
		texture[] = {"\d3s_w213_16\data\skins\w213_cavansite_blue.paa"};
	};
	class e350_3 {
		displayName = "Коричневый";
		texture[] = {"\d3s_w213_16\data\skins\w213_citrin_brown.paa"};
	};
	class e350_4 {
		displayName = "Серебро";
		texture[] = {"\d3s_w213_16\data\skins\w213_diamond_silver.paa"};
	};
	class e350_5 {
		displayName = "Белый";
		texture[] = {"\d3s_w213_16\data\skins\w213_diamond_white.paa"};
	};
	class e350_6 {
		displayName = "Красный";
		texture[] = {"\d3s_w213_16\data\skins\w213_hyazinth_red.paa"};
	};
	class e350_7 {
		displayName = "Серебро";
		texture[] = {"\d3s_w213_16\data\skins\w213_iridium_silver.paa"};
	};
	class e350_8 {
		displayName = "Стандарт";
		texture[] = {"\d3s_w213_16\data\skins\w213_ivory.paa"};
	};
	class e350_9 {
		displayName = "Red";
		texture[] = {"\d3s_w213_16\data\skins\w213_jupiter_red.paa"};
	};
	class e350_10 {
		displayName = "Блек";
		texture[] = {"\d3s_w213_16\data\skins\w213_obsidian_black.paa"};
	};
	class e350_11 {
		displayName = "Коричневый";
		texture[] = {"\d3s_w213_16\data\skins\w213_orient_brown.paa"};
	};
	class e350_12 {
		displayName = "Серый";
		texture[] = {"\d3s_w213_16\data\skins\w213_selenit_grey.paa"};
	};
	class e350_13 {
		displayName = "Заводской";
		texture[] = {"\d3s_w213_16\data\skins\W213_AO_co.paa"};
	};
	//d3s_e400_16
	class e400_1 {
		displayName = "Черная";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_black.paa"};
	};
	class e400_2 {
		displayName = "Синий";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_blue.paa"};
	};
	class e400_3 {
		displayName = "Ветер";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_breeze.paa"};
	};
	class e400_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_green.paa"};
	};
	class e400_5 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_orange.paa"};
	};
	class e400_6 {
		displayName = "Красный";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_red.paa"};
	};
	class e400_7 {
		displayName = "Серебряный";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_silver.paa"};
	};
	class e400_8 {
		displayName = "Белый";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_white.paa"};
	};
	class e400_9 {
		displayName = "Желтый";
		texture[] = {"\d3s_w213_16\data\skins\w213_amg_yellow.paa"};
	};
	//d3s_s560_18
	//d3s_uaz_3162
	class d3s_uaz_1 {
		displayName = "Черный";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_black_co.paa"};
	};
	class d3s_uaz_2 {
		displayName = "Синий";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_blue_co.paa"};
	};
	class d3s_uaz_3 {
		displayName = "Кориченый";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_brown_co.paa"};
	};
	class d3s_uaz_4 {
		displayName = "Белый";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_co.paa"};
	};
	class d3s_uaz_5 {
		displayName = "Серый";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_gray_co.paa"};
	};
	class d3s_uaz_6 {
		displayName = "Зеленый";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_green_co.paa"};
	};
	class d3s_uaz_7 {
		displayName = "Оранжевый";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_orange_co.paa"};
	};
	class d3s_uaz_8 {
		displayName = "Красный";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_red_co.paa"};
	};
	class d3s_uaz_9 {
		displayName = "Желтый";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_AO_yellow_co.paa"};
	};
	class d3s_uaz_10 {
		displayName = "Диск";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_Disk.paa"};
	};
	class d3s_uaz_11 {
		displayName = "Черный диск";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_Disk_black.paa"};
	};
	class d3s_uaz_12 {
		displayName = "Стекло";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_Window.paa"};
	};
	class d3s_uaz_13 {
		displayName = "Тонированный";
		texture[] = {"\d3s_uaz_3162\data\skins\3162t_Window_black.paa"};
	};
	//тахо
	class tahoe_1 {
		displayName = "Тонированный";
		texture[] = {"\d3s_tahoe_08\data\skins\TAHOE_Black.paa"};
	};
	class tahoe_2 {
		displayName = "Тонированный";
		texture[] = {"\d3s_tahoe_08\data\skins\TAHOE_Black_Granite.paa"};
	};
	class tahoe_3 {
		displayName = "Тонированный";
		texture[] = {"\d3s_tahoe_08\data\skins\TAHOE_Crystal_Red.paa"};
	};
	class tahoe_4 {
		displayName = "Тонированный";
		texture[] = {"\d3s_tahoe_08\data\skins\TAHOE_Gold_Mist.paa"};
	};
	class tahoe_5 {
		displayName = "Тонированный";
		texture[] = {"\d3s_tahoe_08\data\skins\TAHOE_Mocha_Steel.paa"};
	};
	class tahoe_6 {
		displayName = "Тонированный";
		texture[] = {"\d3s_tahoe_08\data\skins\TAHOE_Silver_Ice.paa"};
	};
	//d3s_raptor_17
	class raptor_1 {
		displayName = "Желтый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Yellow.paa"};
	};
	class raptor_2 {
		displayName = "Белый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_White.paa"};
	};
	class raptor_3 {
		displayName = "Фиолетовый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Violette.paa"};
	};
	class raptor_4 {
		displayName = "Серебряный лед";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Silver_Ice.paa"};
	};
	class raptor_5 {
		displayName = "Красный";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Red.paa"};
	};
	class raptor_6 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Orange.paa"};
	};
	class raptor_7 {
		displayName = "Неон";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Neon.paa"};
	};
	class raptor_8 {
		displayName = "Сталь";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Mocha_Steel.paa"};
	};
	class raptor_9 {
		displayName = "Лайм";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Lime.paa"};
	};
	class raptor_10 {
		displayName = "Зеленый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Green.paa"};
	};
	class raptor_11 {
		displayName = "Серый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Gray.paa"};
	};
	class raptor_12 {
		displayName = "Золотой";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Gold_Mist.paa"};
	};
	class raptor_13 {
		displayName = "Кристальнй Красный";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Crystal_Red.paa"};
	};
	class raptor_14 {
		displayName = "Бриз";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Breeze.paa"};
	};
	class raptor_15 {
		displayName = "Синий";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Blue.paa"};
	};
	class raptor_16 {
		displayName = "Черный гранит";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Black_Granite.paa"};
	};
	class raptor_17 {
		displayName = "Черный";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Black.paa"};
	};
	class raptor_18 {
		displayName = "Белый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_AO_co.paa"};
	};
	class raptor_19 {
		displayName = "VIP1";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\F22.paa"};
	};
	class raptor_20 {
		displayName = "VIP2";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\Fabtech.paa"};
	};
	class raptor_21 {
		displayName = "VIP3";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\FX4.paa"};
	};
	class raptor_22 {
		displayName = "VIP4";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\Roush.paa"};
	};
	class raptor_23 {
		displayName = "VIP5";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\Shelby.paa"};
	};
	class raptor_24 {
		displayName = "VIP6";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\TSDesigns.paa"};
	};
	//d3s_g350d_15
	class g350d_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_g65amg_16\data\skins\G35_AO_co.paa"};
	};
	class g350d_2 {
		displayName = "Коричневый1";
		texture[] = {"\d3s_g65amg_16\data\skins\G35_Citrin_Brown.paa"};
	};
	class g350d_3 {
		displayName = "Красный Гиацинт";
		texture[] = {"\d3s_g65amg_16\data\skins\G35_Hyacinth_Red.paa"};
	};
	class g350d_4 {
		displayName = "Полярный Белый";
		texture[] = {"\d3s_g65amg_16\data\skins\G35_Polar_White.paa"};
	};
	class g350d_5 {
		displayName = "Синий1";
		texture[] = {"\d3s_g65amg_16\data\skins\G35_Tansanite_Blue.paa"};
	};
	class g350d_6 {
		displayName = "Серый1";
		texture[] = {"\d3s_g65amg_16\data\skins\G35_Tenorite_Grey.paa"};
	};
	class g350d_7 {
		displayName = "Синий2";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Tansanite_Blue.paa"};
	};
	class g350d_8 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Polar_White.paa"};
	};
	class g350d_9 {
		displayName = "Зеленый";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Periklas_Green.paa"};
	};
	class g350d_10 {
		displayName = "Черный";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Obsidian_Black.paa"};
	};
	class g350d_11 {
		displayName = "Красный1";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Hyacinth_Red.paa"};
	};
	class g350d_12 {
		displayName = "Зеленый1";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Emerald_Green.paa"};
	};
	class g350d_13 {
		displayName = "Коричневый1";
		texture[] = {"\d3s_g65amg_16\data\skins\463_Citrin_Brown.paa"};
	};
	class g350d_14 {
		displayName = "Красный2";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Thulit_Red.paa"};
	};
	class g350d_15 {
		displayName = "Серый2";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Tenorite_Grey.paa"};
	};
	class g350d_16 {
		displayName = "Синий3";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Tansanite_Blue.paa"};
	};
	class g350d_17 {
		displayName = "Зеленый2";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Periklas_Green.paa"};
	};
	class g350d_18 {
		displayName = "Черный";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Obsidian_Black.paa"};
	};
	class g350d_19 {
		displayName = "Синий";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Mysti_Blue.paa"};
	};
	class g350d_20 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Hyacinth_Red.paa"};
	};
	class g350d_21 {
		displayName = "Зеленый";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Emerald_Green.paa"};
	};
	class g350d_22 {
		displayName = "Серебряный Брилиант";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Diamant_Silver.paa"};
	};
	class g350d_23 {
		displayName = "Песок";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Desert_Sand.paa"};
	};
	class g350d_24 {
		displayName = "Коричневый3";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_Citrin_Brown.paa"};
	};
	class g350d_25 {
		displayName = "Заводской";
		texture[] = {"\d3s_g65amg_16\data\skins\G350_AO_co.paa"};
	};
	//гелик амг
	class 63amg_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_AO_co.paa"};
	};
	class 63amg_2 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Colour_Orange.paa"};
	};
	class 63amg_3 {
		displayName = "Пурпурный";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Colour_Purple.paa"};
	};
	class 63amg_4 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Colour_Red.paa"};
	};
	class 63amg_5 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Colour_White.paa"};
	};
	class 63amg_6 {
		displayName = "Желтый";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Colour_Yellow.paa"};
	};
	class 63amg_7 {
		displayName = "Серебро";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Diamant_Silve.paa"};
	};
	class 63amg_8 {
		displayName = "Зеленый";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Emerald_Green.paa"};
	};
	class 63amg_9 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Hyacinth_Red.paa"};
	};
	class 63amg_10 {
		displayName = "Синий";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Mystic_Blue.paa"};
	};
	class 63amg_11 {
		displayName = "Обсидиан";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Obsidian_Black.paa"};
	};
	class 63amg_12 {
		displayName = "Зеленый";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Periklas_Green.paa"};
	};
	class 63amg_13 {
		displayName = "Синий";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Tansanite_Blue.paa"};
	};
	class 63amg_14 {
		displayName = "Серый";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Tenorite_Grey.paa"};
	};
	class 63amg_15 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Thulit_Red.paa"};
	};
	class 63amg_16 {
		displayName = "Десерт";
		texture[] = {"\d3s_g65amg_16\data\skins\G63_Desert_Sand.paa"};
	};
	/////////kodiaq_1
	class kodiaq_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_AO_co.paa"};
	};
	class kodiaq_2 {
		displayName = "Черная Магия";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Black_Magic.paa"};
	};
	class kodiaq_3 {
		displayName = "Серебряный Брилиант";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Brilliant_Silver.paa"};
	};
	class kodiaq_4 {
		displayName = "Серый";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Business_Grey.paa"};
	};
	class kodiaq_5 {
		displayName = "Бежевый Капучино";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Cappuccino_Beige.paa"};
	};
	class kodiaq_6 {
		displayName = "Красный";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Corrida_Red.paa"};
	};
	class kodiaq_7 {
		displayName = "Зеленый";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Jungle_Green.paa"};
	};
	class kodiaq_8 {
		displayName = "Белый";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Laser_White.paa"};
	};
	class kodiaq_9 {
		displayName = "Синий";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Lava_Blue.paa"};
	};
	class kodiaq_10 {
		displayName = "Коричневый11";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Magnetic_Brown.paa"};
	};
	class kodiaq_11 {
		displayName = "Коричневый2";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Mato_Brown.paa"};
	};
	class kodiaq_12 {
		displayName = "Белый";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Moon_White.paa"};
	};
	class kodiaq_13 {
		displayName = "Синий";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Pacific_Blue.paa"};
	};
	class kodiaq_14 {
		displayName = "Серый";
		texture[] = {"\d3s_kodiaq_17\data\skins\Kodiaq_Quartz_Grey.paa"};
	};
	///////d3s_explorer_13
	class explorer_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_explorer_13\data\skins\exp_AO_co.paa"};
	};
	class explorer_2 {
		displayName = "Огонь";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Bronze_Fire.paa"};
	};
	class explorer_3 {
		displayName = "Имбирь";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Ginger_Ale.paa"};
	};
	class explorer_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Green_Gem.paa"};
	};
	class explorer_5 {
		displayName = "Серебряный";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Ingot_Silver.paa"};
	};
	class explorer_6 {
		displayName = "Коричневый";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Kodial_Brown.paa"};
	};
	class explorer_7 {
		displayName = "Белый";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Oxford_White.paa"};
	};
	class explorer_8 {
		displayName = "Красный";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Ruby_Red.paa"};
	};
	class explorer_9 {
		displayName = "Серый";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Sterling_Gray.paa"};
	};
	class explorer_10 {
		displayName = "Черный";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Tuxedo_Black.paa"};
	};
	class explorer_11 {
		displayName = "Синий";
		texture[] = {"\d3s_explorer_13\data\skins\exp_Deep_Blue.paa"};
	};
	///////d3s_uaz_3165M
	class uaz_1 {
		displayName = "Серебро";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Silver.paa"};
	};
	class uaz_2 {
		displayName = "Красный";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Red.paa"};
	};
	class uaz_3 {
		displayName = "Мираж";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Mirage.paa"};
	};
	class uaz_4 {
		displayName = "Минерал";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Mindal.paa"};
	};
	class uaz_5 {
		displayName = "Зеленый";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Green.paa"};
	};
	class uaz_6 {
		displayName = "Синий";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Blue.paa"};
	};
	class uaz_7 {
		displayName = "Черный";
		texture[] = {"\d3s_uaz_3165\data\skins\3165_Black.paa"};
	};
	////d3s_vklasse_17
	class vklasse_1 {
		displayName = "Белый";
		texture[] = {"\d3s_vklasse_17\data\skins\Arctic_White.paa"};
	};
	class vklasse_2 {
		displayName = "Серебряный";
		texture[] = {"\d3s_vklasse_17\data\skins\Brilliant_Silver.paa"};
	};
	class vklasse_3 {
		displayName = "Синий";
		texture[] = {"\d3s_vklasse_17\data\skins\Cavansit_Blue.paa"};
	};
	class vklasse_4 {
		displayName = "Коричневый";
		texture[] = {"\d3s_vklasse_17\data\skins\Dolomit_Brown.paa"};
	};
	class vklasse_5 {
		displayName = "Серый";
		texture[] = {"\d3s_vklasse_17\data\skins\Flint_Gray.paa"};
	};
	class vklasse_6 {
		displayName = "Зеленый";
		texture[] = {"\d3s_vklasse_17\data\skins\Granite_Green.paa"};
	};
	class vklasse_7 {
		displayName = "Серый";
		texture[] = {"\d3s_vklasse_17\data\skins\Indium_Gray.paa"};
	};
	//////fpace_1
	class fpace_1 {
		displayName = "Серый";
		texture[] = {"\d3s_fpace_17\data\skins\F_Ammonite_Grey.paa"};
	};
	class fpace_2 {
		displayName = "Черный";
		texture[] = {"\d3s_fpace_17\data\skins\F_Black_Cherry.paa"};
	};
	class fpace_3 {
		displayName = "Синий Огонь";
		texture[] = {"\d3s_fpace_17\data\skins\F_Bluefire.paa"};
	};
	class fpace_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_fpace_17\data\skins\F_British_Racing_Green.paa"};
	};
	class fpace_5 {
		displayName = "Черный";
		texture[] = {"\d3s_fpace_17\data\skins\F_Celestian_Black.paa"};
	};
	class fpace_6 {
		displayName = "Дракон";
		texture[] = {"\d3s_fpace_17\data\skins\F_Dark_Sapphire.paa"};
	};
	class fpace_7 {
		displayName = "Дефолт";
		texture[] = {"\d3s_fpace_17\data\skins\F_Ingot.paa"};
	};
	class fpace_8 {
		displayName = "Огонь";
		texture[] = {"\d3s_fpace_17\data\skins\F_Italian_Racing_Red.paa"};
	};
	class fpace_9 {
		displayName = "Красеый Одисей";
		texture[] = {"\d3s_fpace_17\data\skins\F_Odyssey_Red.paa"};
	};
	class fpace_10 {
		displayName = "Синий";
		texture[] = {"\d3s_fpace_17\data\skins\F_Osmium_Blue.paa"};
	};
	class fpace_11 {
		displayName = "Белый";
		texture[] = {"\d3s_fpace_17\data\skins\F_Polaris_White.paa"};
	};
	class fpace_12 {
		displayName = "Кварц";
		texture[] = {"\d3s_fpace_17\data\skins\F_Quartzite.paa"};
	};
	class fpace_13 {
		displayName = "Серебро";
		texture[] = {"\d3s_fpace_17\data\skins\F_Rhodium_Silver.paa"};
	};
	class fpace_14 {
		displayName = "Серый";
		texture[] = {"\d3s_fpace_17\data\skins\F_Storm_Grey.paa"};
	};
	class fpace_15 {
		displayName = "Черный";
		texture[] = {"\d3s_fpace_17\data\skins\F_Ultimate_Black.paa"};
	};
	////////
	class fpace_16 {
		displayName = "Заводской";
		texture[] = {"\d3s_fpace_17\data\skins\FS_AO_co.paa"};
	};
	class fpace_17 {
		displayName = "Синий";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Blue.paa"};
	};
	class fpace_18 {
		displayName = "Красный";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Dark_Red.paa"};
	};
	class fpace_19 {
		displayName = "Зеленый";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Green.paa"};
	};
	class fpace_20 {
		displayName = "Океан";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Ocean.paa"};
	};
	class fpace_21 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Orange.paa"};
	};
	class fpace_22 {
		displayName = "Перл";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Pearl.paa"};
	};
	class fpace_23 {
		displayName = "Жемчужный";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Pink.paa"};
	};
	class fpace_24 {
		displayName = "Красный";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Red.paa"};
	};
	class fpace_25 {
		displayName = "Порода";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Rocks.paa"};
	};
	class fpace_26 {
		displayName = "Фиолетовый";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Violette.paa"};
	};
	class fpace_27 {
		displayName = "Желтый";
		texture[] = {"\d3s_fpace_17\data\skins\FS_Yellow.paa"};
	};

	//gl mers
	    class gl_1 {
		displayName = "Заводской голубой";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Blue_co.paa"};
	};
		class gl_2 {
		displayName = "Заводской белый";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_BW_co.paa"};
	};
		class gl_3 {
		displayName = "Заводской мат";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_BW_mat_co.paa"};
	};
		class gl_4 {
		displayName = "Заводской синий";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Cavansit_co.paa"};
	};
		class gl_5 {
		displayName = "Заводской серый";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Obsidian_co.paa"};
	};
		class gl_6 {
		displayName = "Заводской ваниль";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Palladium_co.paa"};
	};
		class gl_7 {
		displayName = "Заводской ледяной";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Selenite_co.paa"};
	};

	//crown victoria
	    class crown98_1 {
		displayName = "Черный";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_black_co.paa"};
	};
		class crown98_2 {
		displayName = "Белый";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_co.paa"};
	};
		class crown98_3 {
		displayName = "Желтый";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_gold_co.paa"};
	};
		class crown98_4 {
		displayName = "Серый";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_gray_co.paa"};
	};
		class crown98_5 {
		displayName = "Бледный персик";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_mocha_co.paa"};
	};
		class crown98_6 {
		displayName = "Красный";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_red_co.paa"};
	};
		class crown98_7 {
		displayName = "Серебро";
		texture[] = {"\d3s_crown_98\data\skins\cvpi_ao_silver_co.paa"};
	};


	//MERS FURA
	    class Actros_1 {
		displayName = "Черный";
		texture[] = {"\d3s_actros_14\data\skins\Actros_Black.paa"};
	};
		class Actros_2 {
		displayName = "Синий";
		texture[] = {"\d3s_actros_14\data\skins\Actros_Blue.paa"};
	};
		class Actros_3 {
		displayName = "Серый";
		texture[] = {"\d3s_actros_14\data\skins\Actros_Gray.paa"};
	};
		class Actros_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_actros_14\data\skins\Actros_Green.paa"};
	};
		class Actros_5 {
		displayName = "Розовый";
		texture[] = {"\d3s_actros_14\data\skins\Actros_Pink.paa"};
	};
		class Actros_6 {
		displayName = "Красный";
		texture[] = {"\d3s_actros_14\data\skins\Actros_Red.paa"};
	};
		class Actros_7 {
		displayName = "Заводской";
		texture[] = {"\d3s_actros_14\data\skins\carpaint_co.paa"};
	};



	//zil_131
	    class Zil_131_1 {
		displayName = "Зеленый";
		texture[] = {"\d3s_zil_131\data\skins\130_body_co.paa"};
	};
		class Zil_131_2 {
		displayName = "зеленка";
		texture[] = {"\d3s_zil_131\data\skins\130_body_green_co.paa"};
	};
		class Zil_131_3 {
		displayName = "коричневый";
		texture[] = {"\d3s_zil_131\data\skins\130_body_ltx_co.paa"};
	};
	    class Zil_131_4 {
		displayName = "Оранжевый";
		texture[] = {"\d3s_zil_131\data\skins\130_body_orange_co.paa"};
	};



	//maz_7kk

	class MAZ_7kk_11 {
		displayName = "Заводской";
		texture[] = {"\d3s_maz_pack\data\skins\7429_AO_co.paa"};
	};
	class MAZ_7kk_1 {
		displayName = "Синий";
		texture[] = {"\d3s_maz_pack\data\skins\7429_1.paa"};
	};
	class MAZ_7kk_2 {
		displayName = "Желтый";
		texture[] = {"\d3s_maz_pack\data\skins\7429_2.paa"};
	};
	class MAZ_7kk_3 {
		displayName = "Зеленый";
		texture[] = {"\d3s_maz_pack\data\skins\7429_3.paa"};
	};
	class MAZ_7kk_4 {
		displayName = "Красный";
		texture[] = {"\d3s_maz_pack\data\skins\7429_4.paa"};
	};
	class MAZ_7kk_5 {
		displayName = "Коричневый";
		texture[] = {"\d3s_maz_pack\data\skins\7429_5.paa"};
	};
	class MAZ_7kk_7 {
		displayName = "Камо 1";
		texture[] = {"\d3s_maz_pack\data\skins\7429_7.paa"};
	};
	class MAZ_7kk_8 {
		displayName = "Камо 2";
		texture[] = {"\d3s_maz_pack\data\skins\7429_8.paa"};
	};
	class MAZ_7kk_10 {
		displayName = "Тянка";
		texture[] = {"\d3s_maz_pack\data\skins\7429_10.paa"};
	};
	///////
	class giulia_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_AO_co.paa"};
	};
	class giulia_2 {
		displayName = "Белый";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Ivory.paa"};
	};
	class giulia_3 {
		displayName = "Голубой";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Misano_Blue.paa"};
	};
	class giulia_4 {
		displayName = "Синий";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Montecarlo_Blue.paa"};
	};
	class giulia_5 {
		displayName = "Красный";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Rosso_Alfa.paa"};
	};
	class giulia_6 {
		displayName = "Роза";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Rosso_Competizione.paa"};
	};
	class giulia_7 {
		displayName = "Серый";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Silverstone_Gray.paa"};
	};
	class giulia_8 {
		displayName = "Темно-серый";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Vesuvio_Gray.paa"};
	};
	class giulia_9 {
		displayName = "Ночь";
		texture[] = {"\d3s_giulia_16\data\skins\GIULIA_Quad_Vulcano_Black.paa"};
	};
	////////
	class F86_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_f86_15\data\skins\F86_AO_co.paa"};
	};
	class F86_2 {
		displayName = "Желтый";
		texture[] = {"\d3s_f86_15\data\skins\F86_Austin_Yellow.paa"};
	};
	class F86_3 {
		displayName = "Синий";
		texture[] = {"\d3s_f86_15\data\skins\F86_Black_Sapphire.paa"};
	};
	class F86_4 {
		displayName = "Серо-коричневый";
		texture[] = {"\d3s_f86_15\data\skins\F86_Champagne_Quartz.paa"};
	};
	class F86_5 {
		displayName = "Алая роза";
		texture[] = {"\d3s_f86_15\data\skins\F86_Frozen_Dark_Red.paa"};
	};
	class F86_6 {
		displayName = "Салатовый";
		texture[] = {"\d3s_f86_15\data\skins\F86_Green_Pearl.paa"};
	};
	class F86_7 {
		displayName = "Синий";
		texture[] = {"\d3s_f86_15\data\skins\F86_Marina_Bay_Blue.paa"};
	};
	class F86_8 {
		displayName = "Красный";
		texture[] = {"\d3s_f86_15\data\skins\F86_Melbourne_Red.paa"};
	};
	class F86_9 {
		displayName = "Серый минерал";
		texture[] = {"\d3s_f86_15\data\skins\F86_Mineral_Grey.paa"};
	};
	class F86_10 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_f86_15\data\skins\F86_Sakhir_Orange.paa"};
	};
	class F86_11 {
		displayName = "Камень";
		texture[] = {"\d3s_f86_15\data\skins\F86_Silverstone.paa"};
	};
	class F86_12 {
		displayName = "Сапфир";
		texture[] = {"\d3s_f86_15\data\skins\F86_Snapper_Rocks_Blue.paa"};
	};
	class F86_13 {
		displayName = "Небо";
		texture[] = {"\d3s_f86_15\data\skins\F86_Yas_Marina_Blue.paa"};
	};
	////////////////////////////
	class ESV_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_AO_co.paa"};
	};
	class ESV_2 {
		displayName = "Черный";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Black_Raven.paa"};
	};
	class ESV_3 {
		displayName = "Черный гранит";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Dark_Granite.paa"};
	};
	class ESV_4 {
		displayName = "Темная магия";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Majestic_Plum.paa"};
	};
	class ESV_5 {
		displayName = "Серебро";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Radiant_Silver.paa"};
	};
	class ESV_6 {
		displayName = "Красный";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Red.paa"};
	};
	class ESV_7 {
		displayName = "Сакура";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Sakura_1.paa"};
	};
	class ESV_8 {
		displayName = "Сакура2";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Sakura_2.paa"};
	};
	class ESV_9 {
		displayName = "Сакура2";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Sakura_3.paa"};
	};
	class ESV_10 {
		displayName = "Сакура2";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Sakura_4.paa"};
	};
	class ESV_11 {
		displayName = "Сакура2";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Sakura_5.paa"};
	};
	class ESV_12 {
		displayName = "Бежевый";
		texture[] = {"\d3s_escalade_16\data\skins\ESV_Silver_Coast.paa"};
	};
	////////////////////////////////
	class URUS_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_urus_18\data\skins\Urus_AO_co.paa"};
	};
	class URUS_2 {
		displayName = "Оранжевый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Arancio_Borealis.paa"};
	};
	class URUS_3 {
		displayName = "Кокос";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Bianco_Canopus.paa"};
	};
	class URUS_4 {
		displayName = "Синий Астероид";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Blu_Astraeus.paa"};
	};
	class URUS_5 {
		displayName = "Синия Грубина";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Blu_Caelum.paa"};
	};
	class URUS_6 {
		displayName = "Синие Ядро";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Blu_Eleos.paa"};
	};
	class URUS_7 {
		displayName = "Бежевый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Giallo_Auge.paa"};
	};
	class URUS_8 {
		displayName = "Желтый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Giallo_Midas.paa"};
	};
	class URUS_9 {
		displayName = "Серый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Grigio_Admetus.paa"};
	};
	class URUS_10 {
		displayName = "Темно-серый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Grigio_Lynx.paa"};
	};
	class URUS_11 {
		displayName = "Темно-коричневый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Marrone_Alcestis.paa"};
	};
	class URUS_12 {
		displayName = "Темно серый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Nero_Helene.paa"};
	};
	class URUS_13 {
		displayName = "Красный";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Rosso_Mars.paa"};
	};
	class URUS_14 {
		displayName = "Серый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Verde_Hebe.paa"};
	};
	class URUS_15 {
		displayName = "Салатовый";
		texture[] = {"\d3s_urus_18\data\skins\Urus_Verde_Mantis.paa"};
	};
	//////////////////////////////////////
	class GLE_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_AO_co.paa"};
	};
	class GLE_2 {
		displayName = "Сапфир";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Cavnsit_Blue.paa"};
	};
	class GLE_3 {
		displayName = "Каричневый";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Citrin_Brown.paa"};
	};
	class GLE_4 {
		displayName = "Белый";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Diamond_White.paa"};
	};
	class GLE_5 {
		displayName = "Красный";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Hyazinth_Red.paa"};
	};
	class GLE_6 {
		displayName = "Серый";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Iridium_Silver.paa"};
	};
	class GLE_7 {
		displayName = "Обсидиан";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Obsidian_Black.paa"};
	};
	class GLE_8 {
		displayName = "Серый2";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Palladium_Silver.paa"};
	};
	class GLE_9 {
		displayName = "Серый3";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Polar_White.paa"};
	};
	class GLE_10 {
		displayName = "Серый4";
		texture[] = {"\d3s_gle63amg_15\data\skins\GLE_Tenorite_Grey.paa"};
	};
	//////////////////////////////////////////////////
	class GMS_1 {
		displayName = "Синий";
		texture[] = {"\d3s_savana_05\data\skins\Deep_Blue.paa"};
	};
	class GMS_2 {
		displayName = "Красный";
		texture[] = {"\d3s_savana_05\data\skins\Fire_Red.paa"};
	};
	class GMS_3 {
		displayName = "Темный";
		texture[] = {"\d3s_savana_05\data\skins\Onyx_Black.paa"};
	};
	class GMS_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_savana_05\data\skins\Polo_Green.paa"};
	};
	class GMS_5 {
		displayName = "Серый";
		texture[] = {"\d3s_savana_05\data\skins\Pure_Silver.paa"};
	};
	class GMS_6 {
		displayName = "Бежевый";
		texture[] = {"\d3s_savana_05\data\skins\Sand_Beige.paa"};
	};
	class GMS_7 {
		displayName = "Газета";
		texture[] = {"\d3s_savana_05\data\skins\SAV_AO_NEWS.paa"};
	};
	class GMS_8 {
		displayName = "Серый";
		texture[] = {"\d3s_savana_05\data\skins\Steel_Gray.paa"};
	};
	class GMS_9 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_savana_05\data\skins\Wheatland_Yellow.paa"};
	};
	////////////////
	class cher_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_AO_co.paa"};
	};
	class cher_2 {
		displayName = "Серый";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Billet_Silver.paa"};
	};
	class cher_3 {
		displayName = "Черный Брилиант";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Brilliant_Black.paa"};
	};
	class cher_4 {
		displayName = "Белый";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_co.paa"};
	};
	class cher_5 {
		displayName = "Алая Роза";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Deep_Cherry_Red.paa"};
	};
	class cher_6 {
		displayName = "Гранит";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Granite_Crystal.paa"};
	};
	class cher_7 {
		displayName = "Синий Гранит";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Maximum_Steel.paa"};
	};
	class cher_8 {
		displayName = "Красный";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Redline_Red.paa"};
	};
	class cher_9 {
		displayName = "Бежевый";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_Sandstone_Perl.paa"};
	};
	class cher_10 {
		displayName = "Синий";
		texture[] = {"\d3s_cherokee_18\data\skins\CHER_SRT_True_Blue.paa"};
	};
	////
	class IS_1 {
		displayName = "Черный";
		texture[] = {"\d3s_is_16\data\skins\IS\Black.paa"};
	};
	class IS_2 {
		displayName = "Заводской";
		texture[] = {"\d3s_is_16\data\skins\IS\IS_F350_AO_co.paa"};
	};
	class IS_3 {
		displayName = "Серый темный";
		texture[] = {"\d3s_is_16\data\skins\IS\Mercury_Grey.paa"};
	};
	class IS_4 {
		displayName = "Темный синий";
		texture[] = {"\d3s_is_16\data\skins\IS\Midnight_Blue.paa"};
	};
	class IS_5 {
		displayName = "Темный бордовый";
		texture[] = {"\d3s_is_16\data\skins\IS\Morello_Red.paa"};
	};
	class IS_6 {
		displayName = "Светлый";
		texture[] = {"\d3s_is_16\data\skins\IS\Satin_Silver.paa"};
	};
	class IS_7 {
		displayName = "Бежевый";
		texture[] = {"\d3s_is_16\data\skins\IS\Sonic_Titanium.paa"};
	};
	class IS_8 {
		displayName = "Коричневый";
		texture[] = {"\d3s_is_16\data\skins\IS\Starlight_Black.paa"};
	};
	class IS_9 {
		displayName = "Белый";
		texture[] = {"\d3s_is_16\data\skins\IS\White_Pearl.paa"};
	};
	///
	class IS_1F {
		displayName = "Синий";
		texture[] = {"\d3s_is_16\data\skins\IS_F\Flame_Blue.paa"};
	};
	class IS_2F {
		displayName = "Заводской";
		texture[] = {"\d3s_is_16\data\skins\IS_F\IS_F350_AO_co.paa"};
	};
	class IS_3F {
		displayName = "Бордовый";
		texture[] = {"\d3s_is_16\data\skins\IS_F\Matador_Red.paa"};
	};
	class IS_4F {
		displayName = "Серый";
		texture[] = {"\d3s_is_16\data\skins\IS_F\Nebula_Grey.paa"};
	};
	class IS_5F {
		displayName = "Серый темный";
		texture[] = {"\d3s_is_16\data\skins\IS_F\Obaidian.paa"};
	};
	class IS_6F {
		displayName = "Серый светлый";
		texture[] = {"\d3s_is_16\data\skins\IS_F\Silver_Lining.paa"};
	};
	/////
	class giu_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_AO_co.paa"};
	};
	class giu_2 {
		displayName = "Бежевый";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Ivory.paa"};
	};
	class giu_3 {
		displayName = "Лазурит";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Misano_Blue.paa"};
	};
	class giu_4 {
		displayName = "Синий";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Montecarlo_Blue.paa"};
	};
	class giu_5 {
		displayName = "Красный";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Rosso_Alfa.paa"};
	};
	class giu_6 {
		displayName = "Красный темный";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Rosso_Competizione.paa"};
	};
	class giu_7 {
		displayName = "Серый";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Silverstone_Gray.paa"};
	};
	class giu_8 {
		displayName = "Серый темный";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Stromboli_Gray.paa"};
	};
	class giu_9 {
		displayName = "Ночь";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Vesuvio_Gray.paa"};
	};
	class giu_10 {
		displayName = "Ночь";
		texture[] = {"\d3s_giulietta_16\data\skins\giulietta_Vulcano_Black.paa"};
	};
	//////////////
	class tau_1 {
		displayName = "Синий";
		texture[] = {"\d3s_taurus_10\data\skins\Deep_Blue.paa"};
	};
	class tau_2 {
		displayName = "Бежевый";
		texture[] = {"\d3s_taurus_10\data\skins\Ginger_Ale.paa"};
	};
	class tau_3 {
		displayName = "Зеленый";
		texture[] = {"\d3s_taurus_10\data\skins\Green_Gem.paa"};
	};
	class tau_4 {
		displayName = "Белый-темный";
		texture[] = {"\d3s_taurus_10\data\skins\Ingot_Silver.paa"};
	};
	class tau_5 {
		displayName = "Коричневый";
		texture[] = {"\d3s_taurus_10\data\skins\Kodial_Brown.paa"};
	};
	class tau_6 {
		displayName = "Белый";
		texture[] = {"\d3s_taurus_10\data\skins\Oxford_White.paa"};
	};
	class tau_7 {
		displayName = "Красный";
		texture[] = {"\d3s_taurus_10\data\skins\Ruby_Red.paa"};
	};
	class tau_8 {
		displayName = "Красный";
		texture[] = {"\d3s_taurus_10\data\skins\Ruby_Red.paa"};
	};
	class tau_9 {
		displayName = "Темный серый";
		texture[] = {"\d3s_taurus_10\data\skins\Sterling_Gray.paa"};
	};
	class tau_10 {
		displayName = "Белый";
		texture[] = {"\d3s_taurus_10\data\skins\Tuxedo_Black.paa"};
	};
	//////////////
	class DU_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_durango_18\data\skins\Durango_AO_co.paa"};
	};
	class DU_2 {
		displayName = "Серый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Billet_Silver.paa"};
	};
	class DU_3 {
		displayName = "Черный Брилиант";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Brilliant_Black.paa"};
	};
	class DU_4 {
		displayName = "Красный";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Deep_Cherry_Red.paa"};
	};
	class DU_5 {
		displayName = "Серый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Granite_Crystal.paa"};
	};
	class DU_6 {
		displayName = "Серый темный";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Maximum_Steel.paa"};
	};
	class DU_7 {
		displayName = "Красный";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Redline_Red.paa"};
	};
	class DU_8 {
		displayName = "Бежевый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_Sandstone_Perl.paa"};
	};
	class DU_9 {
		displayName = "Синева";
		texture[] = {"\d3s_durango_18\data\skins\Durango_True_Blue.paa"};
	};
	class DU_10 {
		displayName = "Белый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_UNM_co.paa"};
	};

	class DUS_1 {
		displayName = "Серый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SHIELDB_co.paa"};
	};
	class DUS_2 {
		displayName = "Черный Брилиант";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_Brilliant_Black.paa"};
	};
	class DUS_3 {
		displayName = "Заводской";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_co.paa"};
	};
	class DUS_4 {
		displayName = "Красный";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_Deep_Cherry_Red.paa"};
	};
	class DUS_5 {
		displayName = "Серый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_Granite_Crystal.paa"};
	};
	class DUS_6 {
		displayName = "Серый темный";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_Maximum_Steel.paa"};
	};
	class DUS_7 {
		displayName = "Красный";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_Redline_Red.paa"};
	};
	class DUS_8 {
		displayName = "Бежевый";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_Sandstone_Perl.paa"};
	};
	class DUS_9 {
		displayName = "Синева";
		texture[] = {"\d3s_durango_18\data\skins\Durango_SRT_True_Blue.paa"};
	};
	///////////////
	class Mans_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_g65amg_16_2\data\skins\G63_AO_co.paa"};
	};
	class Mans_2 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_AO_co.paa"};
	};
	class Mans_3 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_Colour_Red.paa"};
	};
	class Mans_4 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_Colour_White.paa"};
	};
	class Mans_5 {
		displayName = "Желтый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_colour_yellow.paa"};
	};
	class Mans_6 {
		displayName = "Бежевый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_desert_sand.paa"};
	};
	class Mans_7 {
		displayName = "Бордовый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_hyacinth_red.paa"};
	};
	class Mans_8 {
		displayName = "Абсидиан";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_obsidian_black.paa"};
	};
	class Mans_9 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_AO_co.paa"};
	};
	class Mans_10 {
		displayName = "Черный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_Black.paa"};
	};
	class Mans_11 {
		displayName = "Алая Роза";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_colour_red.paa"};
	};
	class Mans_12 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_colour_white.paa"};
	};
	class Mans_13 {
		displayName = "Желтый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_colour_yellow.paa"};
	};
	class Mans_14 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_hyacinth_red.paa"};
	};
	class Mans_15 {
		displayName = "Бежевый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_desert_sand.paa"};
	};
	class Mans_16 {
		displayName = "Абсидиан";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_obsidian_black.paa"};
	};
	///////////////////////----->>>>  <3 Бен <3   <<<<-----///////////////////////
	class Ben_CHA_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_charger_15\CHR_Ob_Green.paa"};
	};
	class Ben_CHA_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_charger_15\CHR_Ob_Green.paa"};
	};
	class Ben_CHA_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_charger_15\CHR_Ob_Green.paa"};
	};
	//
	class Ben_CHE_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_cherokee_18\CHER_Ob_Green.paa"};
	};
	class Ben_CHE_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_cherokee_18\CHER_Ob_Green2.paa"};
	};
	class Ben_CHE_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_cherokee_18\CHER_Ob_Snow.paa"};
	};
	class Ben_CHE_4 {
		displayName = "BadBoy";
		texture[] = {"\Ben_T\d3s_cherokee_18\Vip_BadBoy.paa"};
	};
	class Ben_CHE_5 {
		displayName = "Crazy";
		texture[] = {"\Ben_T\d3s_cherokee_18\Vip_Crazy.paa"};
	};
	class Ben_CHE_6 {
		displayName = "DarT";
		texture[] = {"\Ben_T\d3s_cherokee_18\Vip_DarT.paa"};
	};
	//
	class Ben_CLU_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_clubman_11\Club_Ob_Green.paa"};
	};
	class Ben_CLU_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_clubman_11\Club_Ob_Green2.paa"};
	};
	class Ben_CLU_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_clubman_11\Club_Ob_Snow.paa"};
	};
	class Ben_CLU_4 {
		displayName = "Android";
		texture[] = {"\Ben_T\d3s_clubman_11\Vip_Android.paa"};
	};
	class Ben_CLU_5 {
		displayName = "Girl";
		texture[] = {"\Ben_T\d3s_clubman_11\Vip_Girl.paa"};
	};
	class Ben_CLU_6 {
		displayName = "Tider";
		texture[] = {"\Ben_T\d3s_clubman_11\Vip_Tiger.paa"};
	};
	//
	class Ben_DUR_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_durango_18\Durango_Ob_Green.paa"};
	};
	class Ben_DUR_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_durango_18\Durango_Ob_Green2.paa"};
	};
	class Ben_DUR_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_durango_18\Durango_Ob_Snow.paa"};
	};
	class Ben_DUR_4 {
		displayName = "Animal";
		texture[] = {"\Ben_T\d3s_durango_18\Vip_Animal.paa"};
	};
	class Ben_DUR_5 {
		displayName = "Beer";
		texture[] = {"\Ben_T\d3s_durango_18\Vip_Beer.paa"};
	};
	class Ben_DUR_6 {
		displayName = "Ganjaa";
		texture[] = {"\Ben_T\d3s_durango_18\ViP_Ganjaa.paa"};
	};
	//
	class Ben_ESV_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_escalade_16\ESV_Ob_Green.paa"};
	};
	class Ben_ESV_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_escalade_16\ESV_Ob_Green2.paa"};
	};
	class Ben_ESV_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_escalade_16\ESV_Ob_Snow.paa"};
	};
	class Ben_ESV_4 {
		displayName = "BoneS";
		texture[] = {"\Ben_T\d3s_escalade_16\ViP_BoneS.paa"};
	};
	class Ben_ESV_5 {
		displayName = "BoneS2";
		texture[] = {"\Ben_T\d3s_escalade_16\ViP_Bones2.paa"};
	};
	class Ben_ESV_6 {
		displayName = "Space";
		texture[] = {"\Ben_T\d3s_escalade_16\ViP_Space.paa"};
	};
	//
	class Ben_EXP_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_explorer_13\exp_Ob_Green.paa"};
	};
	class Ben_EXP_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_explorer_13\exp_Ob_Green2.paa"};
	};
	class Ben_EXP_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_explorer_13\exp_Ob_Snow.paa"};
	};
	//
	class Ben_F86_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_f86_15\F86_Ob_Green.paa"};
	};
	class Ben_F86_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_f86_15\F86_Ob_Green2.paa"};
	};
	class Ben_F86_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_f86_15\F86_Ob_Snow.paa"};
	};
	//
	class Ben_F90_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_f90_18\F90_Ob_Green.paa"};
	};
	class Ben_F90_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_f90_18\F90_Ob_Green2.paa"};
	};
	class Ben_F90_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_f90_18\F90_Ob_Snow.paa"};
	};
	//
	class Ben_Fpa_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_fpace_17\F_Ob_Green.paa"};
	};
	class Ben_Fpa_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_fpace_17\F_Ob_Green2.paa"};
	};
	class Ben_Fpa_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_fpace_17\F_Ob_Snow.paa"};
	};
	//
	class Ben_G63_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_g65amg_16\G63_Ob_Green.paa"};
	};
	class Ben_G63_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_g65amg_16\G63_Ob_Green2.paa"};
	};
	class Ben_G63_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_g65amg_16\G63_Ob_Snow.paa"};
	};
	//
	class Ben_G35_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_g65amg_16\G35_Ob_Green.paa"};
	};
	class Ben_G35_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_g65amg_16\G35_Ob_Green2.paa"};
	};
	class Ben_G35_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_g65amg_16\G35_Ob_Snow.paa"};
	};
	//
	class Ben_Mans_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_g65amg_16_2\Mans_1_Ob_Green.paa"};
	}
	class Ben_Mans_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_g65amg_16_2\Mans_1_Ob_Green2.paa"};
	};
	class Ben_Mans_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_g65amg_16_2\Mans_1_Ob_Snow.paa"};
	};
	class Rimas_mans {
		displayName = "Rimas";
		texture[] = {"\welmen_images\Rimas_Mans.paa"};
	};
	//
	class Ben_GIU_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_giulia_16\GIULIA_Quad_Ob_Green.paa"};
	};
	class Ben_GIU_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_giulia_16\GIULIA_Quad_Ob_Green2.paa"};
	};
	class Ben_GIU_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_giulia_16\GIULIA_Quad_Ob_Snow.paa"};
	};
	//
	class Ben_GIU2_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_giulietta_16\giulietta_Ob_Green.paa"};
	};
	class Ben_GIU2_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_giulietta_16\giulietta_Ob_Green2.paa"};
	};
	class Ben_GIU2_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_giulietta_16\giulietta_Ob_Snow.paa"};
	};
	//
	class Ben_GL63_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_gl63amg_12\GL_Ob_Green.paa"};
	};
	class Ben_GL63_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_gl63amg_12\GL_Ob_Green2.paa"};
	};
	class Ben_GL63_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_gl63amg_12\GL_Ob_Snow.paa"};
	};
	//
	class Ben_GLe63_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_gle63amg_15\GLE_Ob_Green.paa"};
	};
	class Ben_GLe63_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_gle63amg_15\GLE_Ob_Green2.paa"};
	};
	class Ben_GLe63_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_gle63amg_15\GLE_Ob_Snow.paa"};
	};
	//
	class Ben_IS_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_is_16\IS_F350_Ob_Green.paa"};
	};
	class Ben_IS_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_is_16\IS_F350_Ob_Green2.paa"};
	};
	class Ben_IS_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_is_16\IS_F350_Ob_Snow.paa"};
	};
	class Ben_IS_4 {
		displayName = "DOG";
		texture[] = {"\Ben_T\d3s_is_16\ViP_DoG.paa"};
	};
	class Ben_IS_5 {
		displayName = "Joker";
		texture[] = {"\Ben_T\d3s_is_16\Vip_Joker.paa"};
	};
	class Ben_IS_6 {
		displayName = "Zebra";
		texture[] = {"\Ben_T\d3s_is_16\Vip_Zebra.paa"};
	};
	//
	class Ben_KOD_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_kodiaq_17\Kodiaq_Ob_Green.paa"};
	};
	class Ben_KOD_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_kodiaq_17\Kodiaq_Ob_Green2.paa"};
	};
	class Ben_KOD_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_kodiaq_17\Kodiaq_Ob_Snow.paa"};
	};
	//
	class Ben_F82_1 {
		displayName = "Kyodai_White";
		texture[] = {"\Ben_T\d3s_f82_14\Kyodai_White.paa"};
	};
	class Ben_F82_2 {
		displayName = "Kyodai_Black";
		texture[] = {"\Ben_T\d3s_f82_14\Kyodai_Black.paa"};
	};
	//
	class Ben_Silvia_1 {
		displayName = "Kobun_Black";
		texture[] = {"\Ben_T\d3s_silvia_s15_02\Kobun_Black.paa"};
	};
	class Ben_Silvia_2 {
		displayName = "Kobun_White";
		texture[] = {"\Ben_T\d3s_silvia_s15_02\Kobun_White.paa"};
	};
	//
	class Ben_WRX17_1 {
		displayName = "Syatey_Black";
		texture[] = {"\Ben_T\d3s_wrx_17\Syatey_Black.paa"};
	};
	class Ben_WRX17_2 {
		displayName = "Syatey_White";
		texture[] = {"\Ben_T\d3s_wrx_17\Syatey_White.paa"};
	};
	//class
	class Ben_KRAZ {
		displayName = "Камо";
		texture[] = {"\Ben_T\d3s_kraz_6316\6316_Ob_Green.paa"};
	};
	class Ben_MAZ {
		displayName = "Камо";
		texture[] = {"\Ben_T\d3s_maz_pack\6317_Ob_Green.paa"};
	};
	//
	class Ben_PAT_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_uaz_3162\3162t_Ob_Green.paa"};
	};
	class Ben_PAT_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_uaz_3162\3162t_Ob_Green2.paa"};
	};
	class Ben_PAT_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_uaz_3162\3162t_Ob_Snow.paa"};
	};
	//
	class Ben_NEX_1 {
		displayName = "Камо1";
		texture[] = {"\Ben_T\d3s_ural_next\NEXT_Ob_Green.paa"};
	};
	class Ben_NEX_2 {
		displayName = "Камо2";
		texture[] = {"\Ben_T\d3s_ural_next\NEXT_Ob_Green2.paa"};
	};
	class Ben_NEX_3 {
		displayName = "Камо3";
		texture[] = {"\Ben_T\d3s_ural_next\NEXT_Ob_Snow.paa"};
	};
	//
	class WEL_TAXI {
		displayName = "Такси";
		texture[] = {"\Ben_T\Welm\M_900_Yellow_Taxi1.paa"};
	};
	//
	class Mike_Mers_1 {
		displayName = "Мед";
		texture[] = {"\welmen_images\Mike_Mers.paa"};
	};
	class Mike_Mers {
		displayName = "Нелегал";
		texture[] = {"\d3s_actros_14\data\skins\carpaint_co.paa"};
	};
	///YG
	class YG_IS_1 {
		displayName = "Oyabun_White";
		texture[] = {"\Ben_T\YG\Yamaguchi-Gumi_Black.paa"};
	};
	class YG_IS_2 {
		displayName = "Oyabun_Black";
		texture[] = {"\Ben_T\YG\Yamaguchi-Gumi_White.paa"};
	};
	class YG_WRX_1 {
		displayName = "Oyabun_White";
		texture[] = {"\Ben_T\YG\Syatey_Black.paa"};
	};
	class YG_WRX_2 {
		displayName = "Oyabun_Black";
		texture[] = {"\Ben_T\YG\Syatey_White.paa"};
	};
	////
	class Rapid_2 {
		displayName = "Красный Аметист";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Amethyst_Red.paa"};
	};
	class Rapid_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_AO_co.paa"};
	};
	class Rapid_3 {
		displayName = "Зеленое Яблоко";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Appletree_Green.paa"};
	};
	class Rapid_4 {
		displayName = "Бронзовая Аризона";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Arixona_Bronze.paa"};
	};
	class Rapid_5 {
		displayName = "Синий Кобальт";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Cobalt_Blue.paa"};
	};
	class Rapid_6 {
		displayName = "Синий Конус";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Concours_Blue.paa"};
	};
	class Rapid_7 {
		displayName = "Белая Зима";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Frost_White.paa"};
	};
	class Rapid_8 {
		displayName = "Серый Бык";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Grey_Bull.paa"};
	};
	class Rapid_9 {
		displayName = "Серый Мотылек";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Hammerhead_Silver.paa"};
	};
	class Rapid_10 {
		displayName = "Едва зеленый";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Hardly_Green.paa"};
	};
	class Rapid_11 {
		displayName = "Кофейная бронза";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Kopi_Bronze.paa"};
	};
	class Rapid_12 {
		displayName = "Светлое серебро";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Lighting_Silver.paa"};
	};
	class Rapid_13 {
		displayName = "Мадагаскарсский оранжевый";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Madagascar_Orange.paa"};
	};
	class Rapid_14 {
		displayName = "Голубое Мако";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Mako_Blue.paa"};
	};
	class Rapid_15 {
		displayName = "Мариана";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Mariana_Blue.paa"};
	};
	class Rapid_16 {
		displayName = "Темно-коричневый";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Marron_Black.paa"};
	};
	class Rapid_17 {
		displayName = "Серебренный Метеор";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Meteorite_Silver.paa"};
	};
	class Rapid_18 {
		displayName = "Полночный Призрак";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Midnight_Blue.paa"};
	};
	class Rapid_19 {
		displayName = "Океанический Поток";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Ocellus_Teal.paa"};
	};
	class Rapid_20 {
		displayName = "Черный Онекс";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Onyx_Black.paa"};
	};
	class Rapid_21 {
		displayName = "Ночной Джет";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Jet_Black.paa"};
	};
	class Rapid_22 {
		displayName = "Квантовое Серебро";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Quantum_Silver.paa"};
	};
	class Rapid_23 {
		displayName = "Красный Лев";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Red_Lion.paa"};
	};
	class Rapid_24 {
		displayName = "Бронзовая Селена";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Selene_Bronze.paa"};
	};
	class Rapid_25 {
		displayName = "Серебрянный Бландин";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Silver_Blonde.paa"};
	};
	class Rapid_26 {
		displayName = "Желтый Санберст";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Sunburst_Yellow.paa"};
	};
	class Rapid_27 {
		displayName = "Зеленый Варидийский";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Viridian_Green.paa"};
	};
	class Rapid_28 {
		displayName = "Красный Вулкан";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Volcano_Red.paa"};
	};
	class Rapid_29 {
		displayName = "Желтый Хвостик";
		texture[] = {"\d3s_rapide_10\data\skins\Rapide_Yellow_Tang.paa"};
	};
	////////////
	class CTSV_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTSV_AO_co.paa"};
	};
	class CTSV_2 {
		displayName = "Черный";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_black_co.paa"};
	};
	class CTSV_3 {
		displayName = "Синива";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_blue_co.paa"};
	};
	class CTSV_4 {
		displayName = "Бордовый";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_BR_co.paa"};
	};
	class CTSV_6 {
		displayName = "Белый";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_BW_co.paa"};
	};
	class CTSV_7 {
		displayName = "Бежевый";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_latte_co.paa"};
	};
	class CTSV_8 {
		displayName = "Красный";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_red_co.paa"};
	};
	class CTSV_9 {
		displayName = "Серый";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_silver_co.paa"};
	};
	///////
	class Focus_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_focus_17\data\skins\Focus_AO_co.paa"};
	};
	class Focus_2 {
		displayName = "Темно Синий";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Blazer_Blue.paa"};
	};
	class Focus_3 {
		displayName = "Лазурный";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Blue_Wave.paa"};
	};
	class Focus_4 {
		displayName = "Серый";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Bohai_Bay_Mint.paa"};
	};
	class Focus_5 {
		displayName = "Синий";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Deep_Impact_Blue.paa"};
	};
	class Focus_6 {
		displayName = "Голубой";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Indic_Blue.paa"};
	};
	class Focus_7 {
		displayName = "Черный";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Iridium_Black.paa"};
	};
	class Focus_8 {
		displayName = "Магнит";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Magnetic.paa"};
	};
	class Focus_9 {
		displayName = "Серый Магнит";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Magnetic_Grey.paa"};
	};
	class Focus_10 {
		displayName = "Светло-серый";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Moondust_Silver.paa"};
	};
	class Focus_11 {
		displayName = "Красный";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Race_Red.paa"};
	};
	class Focus_12 {
		displayName = "Темно-красный";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Ruby_Red.paa"};
	};
	class Focus_13 {
		displayName = "Черный призрак";
		texture[] = {"\d3s_focus_17\data\skins\Focus_Shadow_Black.paa"};
	};
	class FocusLB_1 {
		displayName = "LB_1";
		texture[] = {"\d3s_focus_17\data\skins\LB_AO_co.paa"};
	};
	class FocusLB_2 {
		displayName = "LB_2";
		texture[] = {"\d3s_focus_17\data\skins\LB_2.paa"};
	};
	class FocusLB_3 {
		displayName = "LB_3";
		texture[] = {"\d3s_focus_17\data\skins\LB_3.paa"};
	};
	class FocusLB_4 {
		displayName = "LB_4";
		texture[] = {"\d3s_focus_17\data\skins\LB_4.paa"};
	};
	class FocusLB_5 {
		displayName = "LB_5";
		texture[] = {"\d3s_focus_17\data\skins\LB_5.paa"};
	};
	class FocusLB_6 {
		displayName = "LB_6";
		texture[] = {"\d3s_focus_17\data\skins\LB_6.paa"};
	};
	class FocusLB_7 {
		displayName = "LB_7";
		texture[] = {"\d3s_focus_17\data\skins\LB_7.paa"};
	};
	class FocusLB_8 {
		displayName = "LB_8";
		texture[] = {"\d3s_focus_17\data\skins\LB_1.paa"};
	};
	////////////
	class UAZ1_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_uaz_469\data\skins\469P_AO_co.paa"};
	};
	class UAZ1_2 {
		displayName = "Черный";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Black.paa"};
	};
	class UAZ1_3 {
		displayName = "Синий";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Blue.paa"};
	};
	class UAZ1_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Green.paa"};
	};
	class UAZ1_5 {
		displayName = "Миндаль";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Mindal.paa"};
	};
	class UAZ1_6 {
		displayName = "Мираж";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Mirage.paa"};
	};
	class UAZ1_7 {
		displayName = "Красный";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Red.paa"};
	};
	class UAZ1_8 {
		displayName = "Серый";
		texture[] = {"\d3s_uaz_469\data\skins\469P_Silver.paa"};
	};
	class UAZ1_9 {
		displayName = "Белый";
		texture[] = {"\d3s_uaz_469\data\skins\469P_TAR_co.paa"};
	};
	class UAZ1_10 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo1.paa"};
	};
	class UAZ1_11 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo8.paa"};
	};
	class UAZ1_12 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo7.paa"};
	};
	class UAZ1_13 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo6.paa"};
	};
	class UAZ1_14 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo5.paa"};
	};
	class UAZ1_15 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo4.paa"};
	};
	class UAZ1_16 {
		displayName = "Камо";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo3.paa"};
	};
	class UAZ1_17 {
		displayName = "Камо8";
		texture[] = {"\d3s_uaz_469\data\skins\469P_camo2.paa"};
	};
	///////
	class F82o_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_f82_14\data\skins\F82_AO_co.paa"};
	};
	class F82o_2 {
		displayName = "Кориченый";
		texture[] = {"\d3s_f82_14\data\skins\F82_Atlas_Cedar.paa"};
	};
	class F82o_3 {
		displayName = "Черный";
		texture[] = {"\d3s_f82_14\data\skins\F82_Black_Uni.paa"};
	};
	class F82o_4 {
		displayName = "Камень";
		texture[] = {"\d3s_f82_14\data\skins\F82_Bluestone.paa"};
	};
	class F82o_5 {
		displayName = "Серый";
		texture[] = {"\d3s_f82_14\data\skins\F82_Cashmere_Silver.paa"};
	};
	class F82o_6 {
		displayName = "Светло-серый";
		texture[] = {"\d3s_f82_14\data\skins\F82_Glacier_Silver.paa"};
	};
	class F82o_7 {
		displayName = "Синий";
		texture[] = {"\d3s_f82_14\data\skins\F82_Imperial_Blue.paa"};
	};
	class F82o_8 {
		displayName = "Кориченый2";
		texture[] = {"\d3s_f82_14\data\skins\F82_Jatoba.paa"};
	};
	class F82o_9 {
		displayName = "Лазурный";
		texture[] = {"\d3s_f82_14\data\skins\F82_Mediterranean_Blue.paa"};
	};
	class F82o_10 {
		displayName = "Темный";
		texture[] = {"\d3s_f82_14\data\skins\F82_Sophisto_Grey.paa"};
	};
	///////
	class F82v_1 {
		displayName = "VIP1";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_AOM_co.paa"};
	};
	class F82v_2 {
		displayName = "VIP2";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Almandine_Brown.paa"};
	};
	class F82v_3 {
		displayName = "VIP3";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Alpine_White.paa"};
	};
	class F82v_4 {
		displayName = "VIP4";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Austin_Yellow.paa"};
	};
	class F82v_5 {
		displayName = "VIP5";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Azurite_Black.paa"};
	};
	class F82v_6 {
		displayName = "VIP6";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Black_Sapphire.paa"};
	};
	class F82v_7 {
		displayName = "VIP7";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Champagne_Quartz.paa"};
	};
	class F82v_8 {
		displayName = "VIP8";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Donington_Gray.paa"};
	};
	class F82v_9 {
		displayName = "VIP9";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Frozen_Dark_Red.paa"};
	};
	class F82v_10 {
		displayName = "VIP10";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Green_Pearl.paa"};
	};
	class F82v_11 {
		displayName = "VIP11";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Marina_Bay_Blue.paa"};
	};
	class F82v_12 {
		displayName = "VIP12";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Mineral_Grey.paa"};
	};
	class F82v_13 {
		displayName = "VIP13";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_MPower.paa"};
	};
	class F82v_14 {
		displayName = "VIP14";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Rhodonite_Silver.paa"};
	};
	class F82v_15 {
		displayName = "Заводской";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Sakhir_Orange.paa"};
	};
	class F82v_16 {
		displayName = "VIP15";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Sapphire_Black.paa"};
	};
	class F82v_17 {
		displayName = "VIP17";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Silverstone.paa"};
	};
	class F82v_18 {
		displayName = "VIP18";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Singapore_Gray.paa"};
	};
	class F82v_19 {
		displayName = "VIP19";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Snapper_Rocks_Blue.paa"};
	};
	class F82v_20 {
		displayName = "VIP20";
		texture[] = {"\d3s_f82_14\data\skins\VIP\F82_Yas_Marina_Blue.paa"};
	};
	/////////
	class F82LB_1 {
		displayName = "VIP";
		texture[] = {"\d3s_f82_14\data\LB\Itasha_Hatsune_Miku.paa"};
	};
	class F82LB_2 {
		displayName = "LB1";
		texture[] = {"\d3s_f82_14\data\LB\LB_1.paa"};
	};
	class F82LB_3 {
		displayName = "LB2";
		texture[] = {"\d3s_f82_14\data\LB\LB_2.paa"};
	};
	class F82LB_4 {
		displayName = "LB3";
		texture[] = {"\d3s_f82_14\data\LB\LB_3.paa"};
	};
	class F82LB_5 {
		displayName = "LB4";
		texture[] = {"\d3s_f82_14\data\LB\LB_4.paa"};
	};
	class F82LB_6 {
		displayName = "LB5";
		texture[] = {"\d3s_f82_14\data\LB\LB_5.paa"};
	};
	///
	class CN_1 {
		displayName = "1";
		texture[] = {"\Ben_T\CN\Crown_Black.paa"};
	};
	class CN_2 {
		displayName = "1";
		texture[] = {"\Ben_T\CN\Lamba_Black.paa"};
	};
	class CN_3 {
		displayName = "2";
		texture[] = {"\Ben_T\CN\Urus_cherny.paa"};
	};
	///////////////
	class X5_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_f85_15\data\skins\F85_AO_co.paa"};
	};
	class X5_2 {
		displayName = "Желтый";
		texture[] = {"\d3s_f85_15\data\skins\F85_Austin_Yellow.paa"};
	};
	class X5_3 {
		displayName = "Черный";
		texture[] = {"\d3s_f85_15\data\skins\F85_Black_Sapphire.paa"};
	};
	class X5_4 {
		displayName = "Серый";
		texture[] = {"\d3s_f85_15\data\skins\F85_Champagne_Quartz.paa"};
	};
	class X5_5 {
		displayName = "Дракон";
		texture[] = {"\d3s_f85_15\data\skins\F85_Frozen_Dark_Red.paa"};
	};
	class X5_6 {
		displayName = "Зеленый";
		texture[] = {"\d3s_f85_15\data\skins\F85_Green_Pearl.paa"};
	};
	class X5_7 {
		displayName = "Синий";
		texture[] = {"\d3s_f85_15\data\skins\F85_Marina_Bay_Blue.paa"};
	};
	class X5_8 {
		displayName = "Красный";
		texture[] = {"\d3s_f85_15\data\skins\F85_Melbourne_Red.paa"};
	};
	class X5_9 {
		displayName = "Серый";
		texture[] = {"\d3s_f85_15\data\skins\F85_Mineral_Grey.paa"};
	};
	class X5_10 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_f85_15\data\skins\F85_Sakhir_Orange.paa"};
	};
	class X5_11 {
		displayName = "Серебро";
		texture[] = {"\d3s_f85_15\data\skins\F85_Silverstone.paa"};
	};
	class X5_12 {
		displayName = "Океан";
		texture[] = {"\d3s_f85_15\data\skins\F85_Snapper_Rocks_Blue.paa"};
	};
	class X5_13 {
		displayName = "Голубой";
		texture[] = {"\d3s_f85_15\data\skins\F85_Yas_Marina_Blue.paa"};
	};
	////////////////
	class X6_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_f13_13\data\skins\F13_AO_co.paa"};
	};
	class X6_2 {
		displayName = "Белый";
		texture[] = {"\d3s_f13_13\data\skins\F13_Alpine_White.paa"};
	};
	class X6_3 {
		displayName = "Желтый";
		texture[] = {"\d3s_f13_13\data\skins\F13_Austin_Yellow.paa"};
	};
	class X6_4 {
		displayName = "Ночь";
		texture[] = {"\d3s_f13_13\data\skins\F13_Black_Sapphire.paa"};
	};
	class X6_5 {
		displayName = "Черный";
		texture[] = {"\d3s_f13_13\data\skins\F13_Black_Uni.paa"};
	};
	class X6_6 {
		displayName = "Серый 1";
		texture[] = {"\d3s_f13_13\data\skins\F13_Bluestone.paa"};
	};
	class X6_7 {
		displayName = "Серый 2";
		texture[] = {"\d3s_f13_13\data\skins\F13_Glacier_Silver.paa"};
	};
	class X6_8 {
		displayName = "Зеленый";
		texture[] = {"\d3s_f13_13\data\skins\F13_Green_Pearl.paa"};
	};
	class X6_9 {
		displayName = "Синий";
		texture[] = {"\d3s_f13_13\data\skins\F13_Imperial_Blue.paa"};
	};
	class X6_10 {
		displayName = "Бежевый";
		texture[] = {"\d3s_f13_13\data\skins\F13_Jatoba.paa"};
	};
	class X6_11 {
		displayName = "Синий";
		texture[] = {"\d3s_f13_13\data\skins\F13_Marina_Bay_Blue.paa"};
	};
	class X6_12 {
		displayName = "Красный";
		texture[] = {"\d3s_f13_13\data\skins\F13_Melbourne_Red.paa"};
	};
	class X6_13 {
		displayName = "Минерал";
		texture[] = {"\d3s_f13_13\data\skins\F13_Mineral_Grey.paa"};
	};
	class X6_14 {
		displayName = "Белый";
		texture[] = {"\d3s_f13_13\data\skins\F13_Rhodonite_Silver.paa"};
	};
	class X6_15 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_f13_13\data\skins\F13_Sakhir_Orange.paa"};
	};
	class X6_16 {
		displayName = "Серебро";
		texture[] = {"\d3s_f13_13\data\skins\F13_Silverstone.paa"};
	};
	class X6_17 {
		displayName = "Гавань";
		texture[] = {"\d3s_f13_13\data\skins\F13_Snapper_Rocks_Blue.paa"};
	};
	class X6_18 {
		displayName = "Черный";
		texture[] = {"\d3s_f13_13\data\skins\F13_Sophisto_Grey.paa"};
	};
	class X6_19 {
		displayName = "Голубой";
		texture[] = {"\d3s_f13_13\data\skins\F13_Yas_Marina_Blue.paa"};
	};
	class X6_20 {
		displayName = "Темный";
		texture[] = {"\d3s_f13_13\data\skins\F13_Mediterranean_Blue.paa"};
	};
	////////////
	class YGS_1 {
		displayName = "Белый";
		texture[] = {"\Ben_T\YG\Kobun_White.paa"};
	};
	class YGS_2 {
		displayName = "Темный";
		texture[] = {"\Ben_T\YG\Kobun_Black.paa"};
	};
	class YGF_1 {
		displayName = "Белый";
		texture[] = {"\Ben_T\YG\Kyodai_Black.paa"};
	};
	class YGF_2 {
		displayName = "Темный";
		texture[] = {"\Ben_T\YG\Kyodai_White.paa"};
	};
	/////
	class Kas_1 {
		displayName = "Альфа";
		texture[] = {"\Ben_T\Kas\giulietta_Vulcano_Black.paa"};
	};
	class KasMans_1 {
		displayName = "Альфа";
		texture[] = {"\Ben_T\Kas\Mans_SAM.paa"};
	};
	///////
	class ENC_1 {
		displayName = "Альфа";
		texture[] = {"\Ben_T\ENC\Enc2.paa"};
	};
	class ENC_2 {
		displayName = "Альфа";
		texture[] = {"\Ben_T\ENC\Enc1.paa"};
	};
	////
	class duc_monst1 {
		displayName = "OUT";
		texture[] = {"\Ben_T\Welm\ducati_monster_black1.paa"};
	};
	//////////
	////////////
	class d3s_civik_1 {
		displayName = "1";
		texture[] = {"\d3s_civic_17\data\skins\Civic_AO_co.paa"};
	};
	class d3s_civik_2 {
		displayName = "2";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Brilliant_Sporty_Blue.paa"};
	};
	class d3s_civik_3 {
		displayName = "3";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Crystal_Black.paa"};
	};
	class d3s_civik_4 {
		displayName = "4";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Green.paa"};
	};
	class d3s_civik_5 {
		displayName = "5";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Lunar_Silver.paa"};
	};
	class d3s_civik_6 {
		displayName = "6";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Pink.paa"};
	};
	class d3s_civik_7 {
		displayName = "7";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Polished_Metal.paa"};
	};
	class d3s_civik_8 {
		displayName = "8";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Rallye_Red.paa"};
	};
	class d3s_civik_9 {
		displayName = "9";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Red.paa"};
	};
	class d3s_civik_10 {
		displayName = "10";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Sonic_Grey.paa"};
	};
	class d3s_civik_11 {
		displayName = "11";
		texture[] = {"\d3s_civic_17\data\skins\Civic_Yellow.paa"};
	};
	/////////
	class PREM_canst_1 {
		displayName = "Лексус Сonstant";
		texture[] = {"\Ben_T\Welm\LEX16_PREM1.paa"};
	};
	class PREM_canst_2 {
		displayName = "Гелик Сonstant";
		texture[] = {"\Ben_T\Welm\G63_PREM1.paa"};
	};
	/////

	class PREM_kas_1 {
		displayName = "Яга";
		texture[] = {"\Ben_T\Welm\F_AO_KASATKI1.paa"};
	};
	class PREM_kas_2 {
		displayName = "Яга";
		texture[] = {"\Ben_T\Welm\F_AO_KASATKI2.paa"};
	};
	/////
	class 300_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_300_12\data\skins\300_AO_co.paa"};
	};
	class 300_2 {
		displayName = "Темно-синий";
		texture[] = {"\d3s_300_12\data\skins\300_Deep_Blue.paa"};
	};
	class 300_3 {
		displayName = "Коричневый";
		texture[] = {"\d3s_300_12\data\skins\300_Ginger_Ale.paa"};
	};
	class 300_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_300_12\data\skins\300_Green_Gem.paa"};
	};
	class 300_5 {
		displayName = "Серый";
		texture[] = {"\d3s_300_12\data\skins\300_Ingot_Silver.paa"};
	};
	class 300_6 {
		displayName = "Коричневый";
		texture[] = {"\d3s_300_12\data\skins\300_Kodial_Brown.paa"};
	};
	class 300_7 {
		displayName = "Белый";
		texture[] = {"\d3s_300_12\data\skins\300_Oxford_White.paa"};
	};
	class 300_8 {
		displayName = "Красный";
		texture[] = {"\d3s_300_12\data\skins\300_Ruby_Red.paa"};
	};
	class 300_9 {
		displayName = "Серый";
		texture[] = {"\d3s_300_12\data\skins\300_Sterling_Gray.paa"};
	};
	class 300_10 {
		displayName = "Черный";
		texture[] = {"\d3s_300_12\data\skins\300_Tuxedo_Black.paa"};
	};
	/////
	class e38_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_e38_98\data\skins\730_AO_co.paa"};
	};
	class e38_2 {
		displayName = "Синий";
		texture[] = {"\d3s_e38_98\data\skins\730_Blue.paa"};
	};
	class e38_3 {
		displayName = "Серый";
		texture[] = {"\d3s_e38_98\data\skins\730_Gray.paa"};
	};
	class e38_4 {
		displayName = "Зеленый";
		texture[] = {"\d3s_e38_98\data\skins\730_Green.paa"};
	};
	class e38_5 {
		displayName = "Красный";
		texture[] = {"\d3s_e38_98\data\skins\730_Red.paa"};
	};
	class e38_6 {
		displayName = "Серебро";
		texture[] = {"\d3s_e38_98\data\skins\730_Silver.paa"};
	};
	/////
	class paj_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_AO_co.paa"};
	};
	class paj_2 {
		displayName = "Черный";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Black_Obsidian.paa"};
	};
	class paj_3 {
		displayName = "Серый";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Champagne_Quartz.paa"};
	};
	class paj_4 {
		displayName = "Серый";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Graphite_Shadow.paa"};
	};
	class paj_5 {
		displayName = "Синий";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Hermosa_Blue.paa"};
	};
	class paj_6 {
		displayName = "Белый";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Liquid_Platinum.paa"};
	};
	class paj_7 {
		displayName = "Черный";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Mineral_Black.paa"};
	};
	class paj_8 {
		displayName = "Красный";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Mocha_Almond.paa"};
	};
	class paj_9 {
		displayName = "Серый";
		texture[] = {"\d3s_pajero_07\data\skins\PAJ_Smokey_Quartz.paa"};
	};
	/////
	class ghibli_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Bianco_Alpi.paa"};
	};
	class ghibli_2 {
		displayName = "Синий";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Blu_Emozione.paa"};
	};
	class ghibli_3 {
		displayName = "Синий";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Blu_Passione.paa"};
	};
	class ghibli_4 {
		displayName = "Белый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Champagne.paa"};
	};
	class ghibli_5 {
		displayName = "Белый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_co.paa"};
	};
	class ghibli_6 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Esteso.paa"};
	};
	class ghibli_7 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Esteso_Orange.paa"};
	};
	class ghibli_8 {
		displayName = "Белый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Grigio.paa"};
	};
	class ghibli_9 {
		displayName = "Серый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Grigio_Maratea.paa"};
	};
	class ghibli_10 {
		displayName = "Белый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Grigio_Metallo.paa"};
	};
	class ghibli_11 {
		displayName = "Черный";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Nero.paa"};
	};
	class ghibli_12 {
		displayName = "Темный";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Nero_Ribelle.paa"};
	};
	class ghibli_13 {
		displayName = "Коричневый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Rame.paa"};
	};
	class ghibli_14 {
		displayName = "Красный";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Rosso_Rubino.paa"};
	};
	class ghibli_15 {
		displayName = "Коричневый";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Rame.paa"};
	};
	class ghibli_16 {
		displayName = "Рубин";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Rosso_Rubino.paa"};
	};
	class ghibli_17 {
		displayName = "Одисей";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_AO_Verde_Ossido.paa"};
	};
	class ghibli_18 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Black.paa"};
	};
	class ghibli_19 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Blue.paa"};
	};
	class ghibli_20 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Breeze.paa"};
	};
	class ghibli_21 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Green.paa"};
	};
	class ghibli_22 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Orange.paa"};
	};
	class ghibli_23 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Red.paa"};
	};
	class ghibli_24 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Silver.paa"};
	};
	class ghibli_25 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_White.paa"};
	};
	class ghibli_26 {
		displayName = "VIP";
		texture[] = {"\d3s_ghibli_14\data\skins\Ghibli_Yellow.paa"};
	};
	/////////////
	class PREM_esc_1 {
		displayName = "Яга";
		texture[] = {"\Ben_T\Welm\G63_AO_ESC1.paa"};
	};
	class PREM_esc_2 {
		displayName = "Яга";
		texture[] = {"\Ben_T\Welm\XESV_AO_ESC1.paa"};
	};
	class PREM_esc_3 {
		displayName = "Курума";
		texture[] = {"\Ben_T\Welm\Kuruma_ESC.paa"};
	};
	////
	class bamblbi_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_AO_co.paa"};
	};
	class bamblbi_2 {
		displayName = "Черный";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Black.paa"};
	};
	class bamblbi_3 {
		displayName = "Желтый";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Bright_Yellow.paa"};
	};
	class bamblbi_4 {
		displayName = "Красный";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Garnet_Red.paa"};
	};
	class bamblbi_5 {
		displayName = "Синий";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Hyper_Blue.paa"};
	};
	class bamblbi_6 {
		displayName = "Темный";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Mosaic_Black.paa"};
	};
	class bamblbi_7 {
		displayName = "Серый";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Nightfall_Gray.paa"};
	};
	class bamblbi_8 {
		displayName = "Морожено";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Silver_Ice.paa"};
	};
	class bamblbi_9 {
		displayName = "Красный";
		texture[] = {"\d3s_camaro_16\data\SS\skins\SS_Red_Hot.paa"};
	};
	///
	class OUT_savana_1 {
		displayName = "Красный";
		texture[] = {"\Ben_T\Welm\OUT_savana.paa"};
	};
	////Бентайга
	class BEN_AO_co_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_bentayga_18\data\skins\OUT_savana.paa"};
	};
	class BEN_AO_co_2 {
		displayName = "Бежевый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Camel.paa"};
	};
	class BEN_AO_co_3 {
		displayName = "Дракон";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Dark_Cashmere.paa"};
	};
	class BEN_AO_co_4 {
		displayName = "Серый Дракон";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Dark_Sapphire.paa"};
	};
	class BEN_AO_co_5 {
		displayName = "Серый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Granite.paa"};
	};
	class BEN_AO_co_6 {
		displayName = "Хавана";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Havana.paa"};
	};
	class BEN_AO_co_7 {
		displayName = "Марлин";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Marlin.paa"};
	};
	class BEN_AO_co_8 {
		displayName = "Метеор";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Meteor.paa"};
	};
	class BEN_AO_co_9 {
		displayName = "Белый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Moonbeam.paa"};
	};
	class BEN_AO_co_10 {
		displayName = "Синий";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Moroccan_Blue.paa"};
	};
	class BEN_AO_co_11 {
		displayName = "Черный";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Onyx.paa"};
	};
	class BEN_AO_co_12 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Orange_Flame.paa"};
	};
	class BEN_AO_co_13 {
		displayName = "Портфейн";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Portofino.paa"};
	};
	class BEN_AO_co_14 {
		displayName = "Бордовый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Rubino_Red.paa"};
	};
	class BEN_AO_co_15 {
		displayName = "Красный";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_St_James_Red.paa"};
	};
	class BEN_AO_co_16 {
		displayName = "Молния";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Thunder.paa"};
	};
	class BEN_AO_co_17 {
		displayName = "Зеленый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_Verdant.paa"};
	};
	class BEN_AO_co_18 {
		displayName = "Бежевый";
		texture[] = {"\d3s_bentayga_18\data\skins\BEN_White_Sand.paa"};
	};
	///
	class VV222_1 {
		displayName = "Серый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Allanit_Gray.paa"};
	};
	class VV222_2 {
		displayName = "Заводской";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_AO_co.paa"};
	};
	class VV222_3 {
		displayName = "Темный";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Anthracite_Blue.paa"};
	};
	class VV222_4 {
		displayName = "Темный(полосы)";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Anthracite_Blue_1.paa"};
	};
	class VV222_5 {
		displayName = "Серый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Cashmere_White.paa"};
	};
	class VV222_6 {
		displayName = "Серый(полосы)";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Cashmere_White_3.paa"};
	};
	class VV222_7 {
		displayName = "Синий";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Cavansit_Blue.paa"};
	};
	class VV222_8 {
		displayName = "Каричневый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Citrin_Brown.paa"};
	};
	class VV222_9 {
		displayName = "Каричневый(полосы)";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Citrin_Brown_2.paa"};
	};
	class VV222_10 {
		displayName = "Серый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Diamond_Silver.paa"};
	};
	class VV222_11 {
		displayName = "Серый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Diamond_White.paa"};
	};
	class VV222_12 {
		displayName = "Серый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Emerald_Green.paa"};
	};
	class VV222_13 {
		displayName = "Серый";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Mokka_Schwarz.paa"};
	};
	class VV222_14 {
		displayName = "Красный";
		texture[] = {"\d3s_vv222_18\data\skins\VV222_Ruby_Black.paa"};
	};
	///////
	class MAC_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_macan_16\data\skins\MAC_AO_co.paa"};
	};
	class MAC_2 {
		displayName = "Черный";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Agate_Grey.paa"};
	};
	class MAC_3 {
		displayName = "Черный";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Black.paa"};
	};
	class MAC_4 {
		displayName = "Красный";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Carmine_Red.paa"};
	};
	class MAC_5 {
		displayName = "Белый";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Carrara_White.paa"};
	};
	class MAC_6 {
		displayName = "Красный";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Guards_Red.paa"};
	};
	class MAC_7 {
		displayName = "Синий";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Crystal_Blue.paa"};
	};
	class MAC_8 {
		displayName = "Лава";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Lava_Orange.paa"};
	};
	class MAC_9 {
		displayName = "Кориченый";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Mahogany.paa"};
	};
	class MAC_10 {
		displayName = "Серый";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Meteor_Grey.paa"};
	};
	class MAC_11 {
		displayName = "Голубой";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Miami_Blue.paa"};
	};
	class MAC_12 {
		displayName = "Луна";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Moonlight_Blue.paa"};
	};
	class MAC_13 {
		displayName = "Паладин";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Palladium.paa"};
	};
	class MAC_14 {
		displayName = "Пурпурный";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Purpurite.paa"};
	};
	class MAC_15 {
		displayName = "Желтый";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Racing_Yellow.paa"};
	};
	class MAC_16 {
		displayName = "Серый";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Rhodium_Silver.paa"};
	};
	class MAC_17 {
		displayName = "Синий";
		texture[] = {"\d3s_macan_16\data\skins\MAC_Sapphire_Blue.paa"};
	};
	////
	class 200TC_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_200_16\data\skins\200_AO_co.paa"};
	};
	class 200TC_2 {
		displayName = "Селена";
		texture[] = {"\d3s_200_16\data\skins\200_Ash_Grey.paa"};
	};
	class 200TC_3 {
		displayName = "Черный";
		texture[] = {"\d3s_200_16\data\skins\200_Astral_Black.paa"};
	};
	class 200TC_4 {
		displayName = "Кориченый";
		texture[] = {"\d3s_200_16\data\skins\200_Copper_Brown.paa"};
	};
	class 200TC_5 {
		displayName = "Белое Золото";
		texture[] = {"\d3s_200_16\data\skins\200_Gold_Dust.paa"};
	};
	class 200TC_6 {
		displayName = "Красный";
		texture[] = {"\d3s_200_16\data\skins\200_Regency_Red.paa"};
	};
	class 200TC_7 {
		displayName = "Белый";
		texture[] = {"\d3s_200_16\data\skins\200_Pearl_White.paa"};
	};
	class 200TC_8 {
		displayName = "Темно-синий";
		texture[] = {"\d3s_200_16\data\skins\MAC_Sapphire_Blue.paa"};
	};
	class 200TC_9 {
		displayName = "Ультра";
		texture[] = {"\d3s_200_16\data\skins\200_Ultra_Silver.paa"};
	};
	/////
	class GT_1 {
		displayName = "Заводской";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_AO_co.paa"};
	};
	class GT_2 {
		displayName = "Карамель";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Camel.paa"};
	};
	class GT_3 {
		displayName = "Серый";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Dark_Cashmere.paa"};
	};
	class GT_4 {
		displayName = "Серый";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Dark_Sapphire.paa"};
	};
	class GT_5 {
		displayName = "Серый";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Granite.paa"};
	};
	class GT_6 {
		displayName = "Хавана";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Havana.paa"};
	};
	class GT_7 {
		displayName = "Малин";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Marlin.paa"};
	};
	class GT_8 {
		displayName = "Метеор";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Meteor.paa"};
	};
	class GT_9 {
		displayName = "Лунный";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Moonbeam.paa"};
	};
	class GT_10 {
		displayName = "Синий";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Moroccan_Blue.paa"};
	};
	class GT_11 {
		displayName = "Черный";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Onyx.paa"};
	};
	class GT_12 {
		displayName = "Ореньжевый";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Orange_Flame.paa"};
	};
	class GT_13 {
		displayName = "Синий";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Portofino.paa"};
	};
	class GT_14 {
		displayName = "Красный";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Rubino_Red.paa"};
	};
	class GT_15 {
		displayName = "Красный";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_St_James_Red.paa"};
	};
	class GT_16 {
		displayName = "Гром";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Thunder.paa"};
	};
	class GT_17 {
		displayName = "Зеленый";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_Verdant.paa"};
	};
	class GT_18 {
		displayName = "Белый";
		texture[] = {"\d3s_continentalGT_18\data\skins\GT_White_Sand.paa"};
	};
	/////
	class AD_1 {
		displayName = "PRO";
		texture[] = {"\Ben_T\Welm\skins\Q50_AO_co5.paa"};
	};
	class AD_2 {
		displayName = "PRO";
		texture[] = {"\Ben_T\Welm\skins\Q50_AO_co7.paa"};
	};
	/////
	class 7news_Rapt1 {
		displayName = "7News";
		texture[] = {"\Ben_T\Welm\RAPTOR_7news.paa"};
	};
	////
	class BW400_1 {
		displayName = "1";
		texture[] = {"\Ben_T\BlackWater\400_BW1.paa"};
	};
	class BW400_2 {
		displayName = "2";
		texture[] = {"\Ben_T\BlackWater\400_BW2.paa"};
	};
	////
	class vesta_1 {
		displayName = "Красный";
		texture[] = {"\d3s_vesta_15\data\skins\195.paa"};
	};
	class vesta_2 {
		displayName = "Белый";
		texture[] = {"\d3s_vesta_15\data\skins\221.paa"};
	};
	class vesta_3 {
		displayName = "Зеленый";
		texture[] = {"\d3s_vesta_15\data\skins\246.paa"};
	};
	class vesta_4 {
		displayName = "Салатовый";
		texture[] = {"\d3s_vesta_15\data\skins\366.paa"};
	};
	class vesta_5 {
		displayName = "Зеленый";
		texture[] = {"\d3s_vesta_15\data\skins\372.paa"};
	};
	class vesta_6 {
		displayName = "Синий";
		texture[] = {"\d3s_vesta_15\data\skins\492.paa"};
	};
	class vesta_7 {
		displayName = "Серый";
		texture[] = {"\d3s_vesta_15\data\skins\496.paa"};
	};
	class vesta_8 {
		displayName = "Серый";
		texture[] = {"\d3s_vesta_15\data\skins\608.paa"};
	};
	class vesta_9 {
		displayName = "Черный";
		texture[] = {"\d3s_vesta_15\data\skins\676.paa"};
	};
	class vesta_10 {
		displayName = "Белый";
		texture[] = {"\d3s_vesta_15\data\skins\691.paa"};
	};
	class vesta_11 {
		displayName = "Синий";
		texture[] = {"\d3s_vesta_15\data\skins\Blue.paa"};
	};
	class vesta_12 {
		displayName = "Голубой";
		texture[] = {"\d3s_vesta_15\data\skins\Bright_Blue.paa"};
	};
	class vesta_13 {
		displayName = "Желный";
		texture[] = {"\d3s_vesta_15\data\skins\Bright_Yellow.paa"};
	};
	class vesta_14 {
		displayName = "Кориченый";
		texture[] = {"\d3s_vesta_15\data\skins\Brown.paa"};
	};
	class vesta_15 {
		displayName = "Черный";
		texture[] = {"\d3s_vesta_15\data\skins\Dark_Blue.paa"};
	};
	class vesta_16 {
		displayName = "Болотный";
		texture[] = {"\d3s_vesta_15\data\skins\Dark_Green.paa"};
	};
	class vesta_17 {
		displayName = "Серый";
		texture[] = {"\d3s_vesta_15\data\skins\Gray.paa"};
	};
	class vesta_18 {
		displayName = "Голубоватый";
		texture[] = {"\d3s_vesta_15\data\skins\Gray_Blue.paa"};
	};
	class vesta_19 {
		displayName = "Бордовый";
		texture[] = {"\d3s_vesta_15\data\skins\Maroon.paa"};
	};
	class vesta_20 {
		displayName = "Красный";
		texture[] = {"\d3s_vesta_15\data\skins\Red.paa"};
	};
	class vesta_21 {
		displayName = "Серый";
		texture[] = {"\d3s_vesta_15\data\skins\Silver_Beige.paa"};
	};
	class vesta_22 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_AO_co.paa"};
	};
	class vesta_23 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_AO_turbo_co.paa"};
	};
	class vesta_24 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_black_turbo.paa"};
	};
	class vesta_25 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_blue_turbo.paa"};
	};
	class vesta_26 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_gray_turbo.paa"};
	};
	class vesta_27 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_lime_turbo.paa"};
	};
	class vesta_28 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_neon_turbo.paa"};
	};
	class vesta_29 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_orange_turbo.paa"};
	};
	class vesta_30 {
		displayName = "VIP";
		texture[] = {"\d3s_vesta_15\data\skins\vesta_red_turbo.paa"};
	};
	////
	class zil130_1 {
		displayName = "Синий";
		texture[] = {"\d3s_zil_130\data\130_body_blue_co.paa"};
	};
	class zil130_2 {
		displayName = "Зеленый";
		texture[] = {"\d3s_zil_130\data\130_body_co.paa"};
	};
	class zil130_3 {
		displayName = "Зеленый";
		texture[] = {"\d3s_zil_130\data\130_body_green_co.paa"};
	};
	class zil130_4 {
		displayName = "Двойной";
		texture[] = {"\d3s_zil_130\data\130_body_ltx_co.paa"};
	};
	class zil130_5 {
		displayName = "Ораньжевый";
		texture[] = {"\d3s_zil_130\data\130_body_orange_co.paa"};
	};

	// bmw i8
	class bmwi8_1 {
		displayName = "Желтый";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Austin_Yellow.paa"};
	};
	class bmwi8_2 {
		displayName = "Сапфир";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Black_Sapphire.paa"};
	};
	class bmwi8_4 {
		displayName = "Темно-красный";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Frozen_Dark_Red.paa"};
	};
	class bmwi8_5 {
		displayName = "Зеленая жемчужина";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Green_Pearl.paa"};
	};
	class bmwi8_6 {
		displayName = "Минирально-серый";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Mineral_Grey.paa"};
	};
	class bmwi8_7 {
		displayName = "Ярко-огненный";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Sakhir_Orange.paa"};
	};
	class bmwi8_8 {
		displayName = "Серый гранит";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Silverstone.paa"};
	};
	class bmwi8_9 {
		displayName = "Берюзовый";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Snapper_Rocks_Blue.paa"};
	};
	class bmwi8_10 {
		displayName = "Голубой камень";
		texture[] = {"\d3s_ACS8_17\data\skins\I8_Yas_Marina_Blue.paa"};
	};
	///
	class E400_BW_1 {
		displayName = "1";
		texture[] = {"\Ben_T\BlackWater\400_BW1.paa"};
	};
	class E400_BW_2 {
		displayName = "2";
		texture[] = {"\Ben_T\BlackWater\400_BW2.paa"};
	};
	class GL63AMG_BW_1 {
		displayName = "1";
		texture[] = {"\Ben_T\BlackWater\GL63AMG_BW1.paa"};
	};
	class GL63AMG_BW_2 {
		displayName = "2";
		texture[] = {"\Ben_T\BlackWater\GL63AMG_BW2.paa"};
	};
	class Helli_BW1 {
		displayName = "1";
		texture[] = {"\Ben_T\BlackWater\BlackWater_helli.paa"};
	};
	class Helli_BW2 {
		displayName = "2";
		texture[] = {"\Ben_T\BlackWater\BlackWater_helli2.paa"};
	};

	//ML
	class ML_1 {
		displayName = "Bright";
		texture[] = {"\d3s_w164_09\data\skins\W164_Bright.paa"};
	};
	class ML_2 {
		displayName = "Cavnsit Blue";
		texture[] = {"\d3s_w164_09\data\skins\W164_Cavnsit_Blue.paa"};
	};
	class ML_3 {
		displayName = "Citrin Brown";
		texture[] = {"\d3s_w164_09\data\skins\W164_Citrin_Brown.paa"};
	};
	class ML_4 {
		displayName = "Diamond White";
		texture[] = {"\d3s_w164_09\data\skins\W164_Diamond_White.paa"};
	};
	class ML_5 {
		displayName = "Hyazinth Red";
		texture[] = {"\d3s_w164_09\data\skins\W164_Hyazinth_Red.paa"};
	};
	class ML_6 {
		displayName = "Obsidian Black";
		texture[] = {"\d3s_w164_09\data\skins\W164_Obsidian_Black.paa"};
	};
	class ML_7 {
		displayName = "Palladium Silver";
		texture[] = {"\d3s_w164_09\data\skins\W164_Palladium_Silver.paa"};
	};
	class ML_8 {
		displayName = "Tenorite Grey";
		texture[] = {"\d3s_w164_09\data\skins\W164_Tenorite_Grey.paa"};
	};
	///
	class Sub_ul_1 {
		displayName = "1";
		texture[] = {"\sab_ultralight\data\body_nohq.paa"};
	};
	class Sub_ul_2 {
		displayName = "2";
		texture[] = {"\sab_ultralight\data\body_smdi.paa"};
	};
	class Sub_ul_3 {
		displayName = "3";
		texture[] = {"\sab_ultralight\data\body2.paa"};
	};
	class Sub_ul_4 {
		displayName = "4";
		texture[] = {"\sab_ultralight\data\body3.paa"};
	};
	class Sub_ul_5 {
		displayName = "5";
		texture[] = {"\sab_ultralight\data\body4.paa"};
	};
	class Sub_ul_6 {
		displayName = "6";
		texture[] = {"\sab_ultralight\data\body5.paa"};
	};
	///
	class Nemore_1 {
		displayName = "1";
		texture[] = {"\Ben_T\Welm\Q50_AO_co4.paa"};
	};
	class Nemore_2 {
		displayName = "2";
		texture[] = {"\Ben_T\Welm\Q50_AO_co5.paa"};
	};
	class Nemore_3 {
		displayName = "3";
		texture[] = {"\Ben_T\Welm\Q50_AO_co7.paa"};
	};

	//la ferrari
	class LaFerrari_1 {
		displayName = "Avorio";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Avorio.paa"};
	};
	class LaFerrari_2 {
		displayName = "Bianco Avus";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Bianco_Avus.paa"};
	};
	class LaFerrari_3 {
		displayName = "Blu Abu Dhabi";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Blu_Abu_Dhabi.paa"};
	};
	class LaFerrari_4 {
		displayName = "Blu Mirabeau";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Blu_Mirabeau.paa"};
	};
	class LaFerrari_5 {
		displayName = "Blu Pozzi";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Blu_Pozzi.paa"};
	};
	class LaFerrari_6 {
		displayName = "Giallo Modena";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Giallo_Modena.paa"};
	};
	class LaFerrari_7 {
		displayName = "Grigio Ferro";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Grigio_Ferro.paa"};
	};
	class LaFerrari_8 {
		displayName = "Nero Daytona";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Nero_Daytona.paa"};
	};
	class LaFerrari_10 {
		displayName = "Rosso Corsa";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Rosso_Corsa.paa"};
	};
	class LaFerrari_11 {
		displayName = "Rosso Dino";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Rosso_Dino.paa"};
	};
	class LaFerrari_12 {
		displayName = "Rosso Fiorano";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Rosso_Fiorano.paa"};
	};
	class LaFerrari_13 {
		displayName = "Rosso Scuderia";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Rosso_Scuderia.paa"};
	};
	class LaFerrari_14 {
		displayName = "Verde British";
		texture[] = {"\d3s_LaFerrari_14\data\skins\LaFerrari_Verde_British.paa"};
	};
	class SamP_1 {
		displayName = "Kasatky/Sam one love";
		texture[] = {"\welmen_battle_veh\data\INS_AO_co2.paa"};
	};
	class SamP_2 {
		displayName = "1";
		texture[] = {"\welmen_battle_veh\data\LM002_AO_co21.paa"};
	};
	class SamP_3 {
		displayName = "2";
		texture[] = {"\welmen_battle_veh\data\LM002_AO_coGost.paa"};
	};
	class SamP_4 {
		displayName = "3";
		texture[] = {"\welmen_battle_veh\data\KSS2v2.paa"};
	};
	class SamP_5 {
		displayName = "4";
		texture[] = {"\welmen_battle_veh\data\KSS2v1.paa"};
	};
	////
	class cul_1 {
		displayName = "Antracite";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Antracite.paa"};
	};
	class cul_2 {
		displayName = "Заводской";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_AO_co.paa"};
	};
	class cul_3 {
		displayName = "Arizona Sun";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Arizona_Sun.paa"};
	};
	class cul_4 {
		displayName = "Black Kirsch";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Black_Kirsch.paa"};
	};
	class cul_5 {
		displayName = "Bohemia Red";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Bohemia_Red.paa"};
	};
	class cul_6 {
		displayName = "Bronze";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Bronze.paa"};
	};
	class cul_7 {
		displayName = "Cherry Red";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Cherry_Red.paa"};
	};
	class cul_8 {
		displayName = "Dark Emerald";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Dark_Emerald.paa"};
	};
	class cul_9 {
		displayName = "Darkest Tungsten";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Darkest_Tungsten.paa"};
	};
	class cul_10 {
		displayName = "Diamond Black";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Diamond_Black.paa"};
	};
	class cul_11 {
		displayName = "English White";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_English_White.paa"};
	};
	class cul_12 {
		displayName = "Ensign Red";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Ensign_Red.paa"};
	};
	class cul_13 {
		displayName = "Fame Green";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Fame_Green.paa"};
	};
	class cul_14 {
		displayName = "Graphite";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Graphite.paa"};
	};
	class cul_15 {
		displayName = "Madeira Red";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Madeira_Red.paa"};
	};
	class cul_16 {
		displayName = "Metropolian Blue";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Metropolian_Blue.paa"};
	};
	class cul_17 {
		displayName = "Midnight Saphire";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Midnight_Saphire.paa"};
	};
	class cul_18 {
		displayName = "Platinum";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Platinum.paa"};
	};
	class cul_19 {
		displayName = "Velvet Sparkle";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Red_Velvet_Sparkle.paa"};
	};
	class cul_20 {
		displayName = "Royal Blue";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Royal_Blue.paa"};
	};
	class cul_21 {
		displayName = "Salamanca Blue";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Salamanca_Blue.paa"};
	};
	class cul_22 {
		displayName = "Sea Green";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Sea_Green.paa"};
	};
	class cul_23 {
		displayName = "Silver Sand";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Silver_Sand.paa"};
	};
	class cul_24 {
		displayName = "Smoky Quartz";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Smoky_Quartz.paa"};
	};
	class cul_25 {
		displayName = "Tuskan Sun";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Tuskan_Sun.paa"};
	};
	class cul_26 {
		displayName = "Twilight Purple";
		texture[] = {"\d3s_cullinan_19\data\skins\CUL_Twilight_Purple.paa"};
	};
	//новые типо я хз их нет
	class f87_1 {
		displayName = "Almandine Brown";
		texture[] = {"\d3s_f87_17\data\skins\F87_Almandine_Brown.paa"};
	};
	class f87_2 {
		displayName = "Alpine White";
		texture[] = {"\d3s_f87_17\data\skins\F87_Alpine_White.paa"};
	};
	class f87_3 {
		displayName = "Azurite Black";
		texture[] = {"\d3s_f87_17\data\skins\F87_Azurite_Black.paa"};
	};
	class f87_4 {
		displayName = "Champagne Quartz";
		texture[] = {"\d3s_f87_17\data\skins\F87_Champagne_Quartz.paa"};
	};
	class f87_5 {
		displayName = "Donington Gray";
		texture[] = {"\d3s_f87_17\data\skins\F87_Donington_Gray.paa"};
	};
	class f87_6 {
		displayName = "Marina Bay Blue";
		texture[] = {"\d3s_f87_17\data\skins\F87_Marina_Bay_Blue.paa"};
	};
	class f87_7 {
		displayName = "Rhodonite Silver";
		texture[] = {"\d3s_f87_17\data\skins\F87_Rhodonite_Silver.paa"};
	};
	class f87_8 {
		displayName = "Sapphire Black";
		texture[] = {"\d3s_f87_17\data\skins\F87_Sapphire_Black.paa"};
	};
	class f87_9 {
		displayName = "Singapore Gray";
		texture[] = {"\d3s_f87_17\data\skins\F87_Singapore_Gray.paa"};
	};
	//
	class f87v_1 {
		displayName = "Alpine White";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Alpine_White.paa"};
	};
	class f87v_2 {
		displayName = "Austin Yellow";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Austin_Yellow.paa"};
	};
	class f87v_3 {
		displayName = "Black Sapphire";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Black_Sapphire.paa"};
	};
	class f87v_4 {
		displayName = "Frozen Dark Red";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Frozen_Dark_Red.paa"};
	};
	class f87v_5 {
		displayName = "Green Pearl";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Green_Pearl.paa"};
	};
	class f87v_6 {
		displayName = "Mineral_Grey";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Mineral_Grey.paa"};
	};
	class f87v_7 {
		displayName = "MPower";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_MPower.paa"};
	};
	class f87v_8 {
		displayName = "Sakhir Orange";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Sakhir_Orange.paa"};
	};
	class f87v_9 {
		displayName = "Silverstone";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Silverstone.paa"};
	};
	class f87v_10 {
		displayName = "Snapper Rocks Blue";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Snapper_Rocks_Blue.paa"};
	};
	class f87v_11 {
		displayName = "Yas Marina Blue";
		texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Yas_Marina_Blue.paa"};
	};
	//
	class focus1_CN {
		displayName = "1";
		texture[] = {"\CosaN\data\Focus_Soprano1.paa"};
	};
	class focus2_CN {
		displayName = "2";
		texture[] = {"\CosaN\data\Focus_Soprano.paa"};
	};

/*New cars*/

 //буханка
	class uaz_buhanka_1 {
		displayName = "DarkGreen";
		texture[] = {"\d3s_452\data\452_AO_DarkGreen_co.paa"};
	};
	class uaz_buhanka_2 {
		displayName = "Green";
		texture[] = {"\d3s_452\data\452_AO_Green_co.paa"};
	};
	class uaz_buhanka_3 {
		displayName = "Green2";
		texture[] = {"\d3s_452\data\452_AO_Green2_co.paa"};
	};
	class uaz_buhanka_4 {
		displayName = "Red";
		texture[] = {"\d3s_452\data\452_AO_Red_co.paa"};
	};
	class uaz_buhanka_5 {
		displayName = "Red2";
		texture[] = {"\d3s_452\data\452_AO_Red2_co.paa"};
	};
	class uaz_buhanka_6 {
		displayName = "White";
		texture[] = {"\d3s_452\data\452_AO_White_co.paa"};
	};

	//MB GT 15
	class amgGT_15_1 {
		displayName = "blue";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_blue.paa"};
	};
	class amgGT_15_2 {
		displayName = "breeze";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_breeze.paa"};
	};
	class amgGT_15_3 {
		displayName = "brilliant blue";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_brilliant_blue.paa"};
	};
	class amgGT_15_4 {
		displayName = "green";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_green.paa"};
	};
	class amgGT_15_5 {
		displayName = "ivory";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_ivory.paa"};
	};
	class amgGT_15_6 {
		displayName = "jupiter";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_jupiter_red.paa"};
	};
	class amgGT_15_7 {
		displayName = "orange";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_orange.paa"};
	};
	class amgGT_15_8 {
		displayName = "orient brown";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_orient_brown.paa"};
	};
	class amgGT_15_9 {
		displayName = "red";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_red.paa"};
	};
	class amgGT_15_10 {
		displayName = "silver";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_silver.paa"};
	};
	class amgGT_15_11 {
		displayName = "yellow";
		texture[] = {"\d3s_amgGT_15\data\skins\gt_yellow.paa"};
	};

	//MB GT 19 sedan
	class amgGT_19_1 {
		displayName = "blue";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_blue.paa"};
	};
	class amgGT_19_2 {
		displayName = "breeze";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_breeze.paa"};
	};
	class amgGT_19_3 {
		displayName = "brilliant blue";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_brilliant_blue.paa"};
	};
	class amgGT_19_4 {
		displayName = "gauge";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_gauge.paa"};
	};
	class amgGT_19_5 {
		displayName = "green";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_green.paa"};
	};
	class amgGT_19_6 {
		displayName = "ivory";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_ivory.paa"};
	};
	class amgGT_19_7 {
		displayName = "jupiter red";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_jupiter_red.paa"};
	};
	class amgGT_19_8 {
		displayName = "orange";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_orange.paa"};
	};
	class amgGT_19_9 {
		displayName = "orient brown";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_orient_brown.paa"};
	};
	class amgGT_19_10 {
		displayName = "red";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_red.paa"};
	};
	class amgGT_19_11 {
		displayName = "yellow";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_yellow.paa"};
	};
	class amgGT_19_12 {
		displayName = "silver";
		texture[] = {"\d3s_amgGT_19\data\skins\gt_silver.paa"};
	};

	//vw beetle
	class beetle_girl_1 {
		displayName = "01";
		texture[] = {"\d3s_beetle_04\data\skins\01.paa"};
	};
	class beetle_girl_2 {
		displayName = "02";
		texture[] = {"\d3s_beetle_04\data\skins\02.paa"};
	};
	class beetle_girl_3 {
		displayName = "03";
		texture[] = {"\d3s_beetle_04\data\skins\03.paa"};
	};
	class beetle_girl_4 {
		displayName = "04";
		texture[] = {"\d3s_beetle_04\data\skins\04.paa"};
	};
	class beetle_girl_5 {
		displayName = "05";
		texture[] = {"\d3s_beetle_04\data\skins\05.paa"};
	};
	class beetle_girl_6 {
		displayName = "06";
		texture[] = {"\d3s_beetle_04\data\skins\06.paa"};
	};
	class beetle_girl_7 {
		displayName = "07";
		texture[] = {"\d3s_beetle_04\data\skins\07.paa"};
	};

	class beetle_1 {
		displayName = "british racing green";
		texture[] = {"\d3s_beetle_04\data\skins\bet_british_racing_green.paa"};
	};
	class beetle_2 {
		displayName = "british racing green 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_british_racing_green_2"};
	};
	class  beetle_3 {
		displayName = "chili red";
		texture[] = {"\d3s_beetle_04\data\skins\bet_chili_red.paa"};
	};
	class  beetle_4 {
		displayName = "chili red 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_chili_red_2.paa"};
	};
	class  beetle_5 {
		displayName = "chili red 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_chili_red_3.paa"};
	};
	class  beetle_6 {
		displayName = "electric blue";
		texture[] = {"\d3s_beetle_04\data\skins\bet_electric_blue.paa"};
	};
	class  beetle_7 {
		displayName = "electric blue 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_electric_blue_2.paa"};
	};
	class  beetle_8 {
		displayName = "electric blue 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_electric_blue_3.paa"};
	};
	class  beetle_9 {
		displayName = "melting silver";
		texture[] = {"\d3s_beetle_04\data\skins\bet_melting_silver.paa"};
	};
	class beetle_10 {
		displayName = "melting silver 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_melting_silver_2.paa"};
	};
	class  beetle_11 {
		displayName = "moonwalk grey";
		texture[] = {"\d3s_beetle_04\data\skins\bet_moonwalk_grey.paa"};
	};
	class beetle_12 {
		displayName = "moonwalk grey 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_moonwalk_grey_2.paa"};
	};
	class  beetle_13 {
		displayName = "moonwalk grey 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_moonwalk_grey_3.paa"};
	};
	class  beetle_14 {
		displayName = "pepper white";
		texture[] = {"\d3s_beetle_04\data\skins\bet_pepper_white.paa"};
	};
	class  beetle_15 {
		displayName = "pepper white 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_pepper_white_2.paa"};
	};
	class  beetle_16 {
		displayName = "pepper white 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_pepper_white_3.paa"};
	};
	class  beetle_17 {
		displayName = "rebel green";
		texture[] = {"\d3s_beetle_04\data\skins\bet_rebel_green.paa"};
	};
	class  beetle_18 {
		displayName = "rebel green 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_rebel_green_2.paa"};
	};
	class  beetle_19 {
		displayName = "rebel green 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_rebel_green_3.paa"};
	};
	class  beetle_20 {
		displayName = "thunder grey";
		texture[] = {"\d3s_beetle_04\data\skins\bet_thunder_grey.paa"};
	};
	class  beetle_21 {
		displayName = "thunder grey 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_thunder_grey_2.paa"};
	};
	class  beetle_22 {
		displayName = "thunder grey 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_thunder_grey_3.paa"};
	};
	class  beetle_23 {
		displayName = "volcanic orange";
		texture[] = {"\d3s_beetle_04\data\skins\bet_volcanic_orange.paa"};
	};
	class  beetle_24 {
		displayName = "volcanic orange 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_volcanic_orange_2.paa"};
	};
	class  beetle_25 {
		displayName = "volcanic orange 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_volcanic_orange_3.paa"};
	};
	class  beetle_26 {
		displayName = "yours lapisluxury blue";
		texture[] = {"\d3s_beetle_04\data\skins\bet_yours_lapisluxury_blue.paa"};
	};
	class  beetle_27 {
		displayName = "yours lapisluxury blue 2";
		texture[] = {"\d3s_beetle_04\data\skins\bet_yours_lapisluxury_blue_2.paa"};
	};
	class  beetle_28 {
		displayName = "yours lapisluxury blue 3";
		texture[] = {"\d3s_beetle_04\data\skins\bet_yours_lapisluxury_blue_3.paa"};
	};

	//camry
	class camry_1 {
		displayName = "blue crush";
		texture[] = {"\d3s_camry_18\data\skins\cam_blue_crush.paa"};
	};
	class camry_2 {
		displayName = "blue streak";
		texture[] = {"\d3s_camry_18\data\skins\cam_blue_streak.paa"};
	};
	class camry_3 {
		displayName = "brownstone";
		texture[] = {"\d3s_camry_18\data\skins\cam_brownstone.paa"};
	};
	class camry_4 {
		displayName = "celestial silver";
		texture[] = {"\d3s_camry_18\data\skins\cam_celestial_silver.paa"};
	};
	class camry_5 {
		displayName = "galactic aqua";
		texture[] = {"\d3s_camry_18\data\skins\cam_galactic_aqua.paa"};
	};
	class camry_6 {
		displayName = "midnight black";
		texture[] = {"\d3s_camry_18\data\skins\cam_midnight_black.paa"};
	};
	class camry_7 {
		displayName = "predawn gray";
		texture[] = {"\d3s_camry_18\data\skins\cam_predawn_gray.paa"};
	};
	class camry_8 {
		displayName = "ruby flare";
		texture[] = {"\d3s_camry_18\data\skins\cam_ruby_flare.paa"};
	};

	//porhse cayenne
	class cayenne_1 {
			displayName = "agate grey";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_agate_grey.paa"};
		};
	class cayenne_2 {
			displayName = "black";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_black.paa"};
		};
	class cayenne_3 {
			displayName = "carmine red";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_carmine_red.paa"};
		};
	class cayenne_4 {
			displayName = "carrara white";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_carrara_white.paa"};
		};
	class cayenne_5 {
			displayName = "crystal blue";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_crystal_blue.paa"};
		};
	class cayenne_6 {
			displayName = "guards red";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_guards_red.paa"};
		};
	class cayenne_7 {
			displayName = "lava orange";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_lava_orange.paa"};
		};
	class cayenne_8 {
			displayName = "";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_mahogany.paa"};
		};
	class cayenne_9 {
			displayName = "meteor grey";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_meteor_grey.paa"};
		};
	class cayenne_10 {
			displayName = "miami blue";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_miami_blue.paa"};
		};
	class cayenne_11 {
			displayName = "moonlight blue";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_moonlight_blue.paa"};
		};
	class cayenne_12 {
			displayName = "palladium";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_palladium.paa"};
		};
	class cayenne_13 {
			displayName = "purpurite";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_purpurite.paa"};
		};
	class cayenne_14 {
			displayName = "racing yellow";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_racing_yellow.paa"};
		};
	class cayenne_15 {
			displayName = "rhodium silver";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_rhodium_silver.paa"};
		};
	class cayenne_16 {
			displayName = "sapphire blue";
			texture[] = {"\d3s_cayenne_16\data\skins\cay_sapphire_blue.paa"};
		};

	//CLA-sedan
	class cla_sedan_1 {
			displayName = "Brilliant Blue";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Brilliant_Blue.paa"};
		};
	class cla_sedan_2 {
			displayName = "Cavansite Blue";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Cavansite_Blue.paa"};
		};
	class cla_sedan_3 {
			displayName = "Citrin Brown";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Citrin_Brown.paa"};
		};
	class cla_sedan_4 {
			displayName = "Diamond Silver";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Diamond_Silver.paa"};
		};
	class cla_sedan_5 {
			displayName = "Diamond White";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Diamond_White.paa"};
		};
	class cla_sedan_6 {
			displayName = "Hyazinth Red";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Hyazinth_Red.paa"};
		};
	class cla_sedan_7 {
			displayName = "Iridium Silver";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Iridium_Silver.paa"};
		};
	class cla_sedan_8 {
			displayName = "Jupiter Red";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Jupiter_Red.paa"};
		};
	class cla_sedan_9 {
			displayName = "Obsidian Black";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Obsidian_Black.paa"};
		};
	class cla_sedan_10 {
			displayName = "Orient Brown";
			texture[] = {"\d3s_cla_14\data\skins\CLA_Orient_Brown.paa"};
		};
	class cla_sedan_11 {
			displayName = "Polar White";
			texture[] = {"d3s_cla_14\data\skins\CLA_Polar_White.paa"};
		};
	class cla_sedan_12  {
			displayName = "Selenit Grey";
			texture[] = {"d3s_cla_14\data\skins\CLA_Selenit_Grey.paa"};
		};
	class cla_sedan_13  {
			displayName = "LUMI";
			texture[] = {"d3s_cla_14\data\skins\LUMI.paa"};
		};

	//CLA-Shooting Brake AMG ver
	class cla_shooting_amg_1 {
			displayName = "AMG Blue";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Blue.paa"};
		};
	class cla_shooting_amg_2 {
			displayName = "AMG Breeze";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Breeze.paa"};
		};
	class cla_shooting_amg_3 {
			displayName = "AMG Lime";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Lime.paa"};
		};
	class cla_shooting_amg_4 {
			displayName = "AMG Neon";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Neon.paa"};
		};
	class cla_shooting_amg_5 {
			displayName = "AMG Orange";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Orange.paa"};
		};
	class cla_shooting_amg_6 {
			displayName = "AMG Pink";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Pink.paa"};
		};
	class cla_shooting_amg_7 {
			displayName = "AMG Red";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Red.paa"};
		};
	class cla_shooting_amg_8 {
			displayName = "AMG Violette";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Violette.paa"};
		};
	class cla_shooting_amg_9 {
			displayName = "AMG White";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_White.paa"};
		};
	class cla_shooting_amg_10 {
			displayName = "AMG Yellow";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\AMG_Yellow.paa"};
		};

	//CLA-Shooting Brake
	class cla_shooting_1 {
			displayName = "Brilliant Blue";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Brilliant_Blue.paa"};
		};
	class cla_shooting_2 {
			displayName = "Cavansite Blue";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Cavansite_Blue.paa"};
		};
	class cla_shooting_3 {
			displayName = "Citrin Brown";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Citrin_Brown.paa"};
		};
	class cla_shooting_4 {
			displayName = "Diamond Silver";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Diamond_Silver.paa"};
		};
	class cla_shooting_5 {
			displayName = "Diamond White";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Diamond_White.paa"};
		};
	class cla_shooting_6 {
			displayName = "Hyazinth Red";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Hyazinth_Red.paa"};
		};
	class cla_shooting_7 {
			displayName = "Iridium Silver";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Iridium_Silver.paa"};
		};
	class cla_shooting_8 {
			displayName = "Ivory";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Ivory.paa"};
		};
	class cla_shooting_9 {
			displayName = "Jupiter Red";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Jupiter_Red.paa"};
		};
	class cla_shooting_10 {
			displayName = "Obsidian Black";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Obsidian_Black.paa"};
		};
	class cla_shooting_11 {
			displayName = "Orient Brown";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Orient_Brown.paa"};
	};
	class cla_shooting_12 {
			displayName = "Polar White";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Polar_White.paa"};
	};
	class cla_shooting_13 {
			displayName = "Selenit Grey";
			texture[] = {"\d3s_cla_14\data\Shooting Brake\Shooting_Selenit_Grey.paa"};
	};


	class bmwE60_1 {
			displayName = "alpine white";
			texture[] = {"\d3s_e60_09\data\skins\acs_alpine_white.paa"};
	};
	class bmwE60_2 {
			displayName = "austin yellow";
			texture[] = {"\d3s_e60_09\data\skins\acs_austin_yellow.paa"};
	};
	class bmwE60_3 {
			displayName = "black sapphire";
			texture[] = {"\d3s_e60_09\data\skins\acs_black_sapphire.paa"};
	};
	class bmwE60_4 {
			displayName = "frozen dark red";
			texture[] = {"\d3s_e60_09\data\skins\acs_frozen_dark_red.paa"};
	};
	class bmwE60_5 {
			displayName = "green pearl";
			texture[] = {"\d3s_e60_09\data\skins\acs_green_pearl.paa"};
	};
	class bmwE60_6 {
			displayName = "mineral grey";
			texture[] = {"\d3s_e60_09\data\skins\acs_mineral_grey.paa"};
	};
	class bmwE60_7 {
			displayName = "saints";
			texture[] = {"\d3s_e60_09\data\skins\acs_saints.paa"};
	};
	class bmwE60_8 {
			displayName = "sakhir orange";
			texture[] = {"\d3s_e60_09\data\skins\acs_sakhir_orange.paa"};
	};
	class bmwE60_9 {
			displayName = "silverstone";
			texture[] = {"\d3s_e60_09\data\skins\acs_silverstone.paa"};
	};
	class bmwE60_10 {
			displayName = "snapper rocks blue";
			texture[] = {"\d3s_e60_09\data\skins\acs_snapper_rocks_blue.paa"};
	};
	class bmwE60_11 {
			displayName = "marina blue";
			texture[] = {"\d3s_e60_09\data\skins\acs_yas_marina_blue.paa"};
	};
	class bmwE60_12 {
			displayName = "black";
			texture[] = {"\d3s_e60_09\data\skins\e60_black_uni.paa"};
	};
	class bmwE60_13 {
			displayName = "bluestone";
			texture[] = {"\d3s_e60_09\data\skins\e60_bluestone.paa"};
	};
	class bmwE60_14 {
			displayName = "glacier silver";
			texture[] = {"\d3s_e60_09\data\skins\e60_glacier_silver.paa"};
	};
	class bmwE60_15 {
			displayName = "imperial blue";
			texture[] = {"\d3s_e60_09\data\skins\e60_imperial_blue.paa"};
	};
	class bmwE60_16 {
			displayName = "jatoba";
			texture[] = {"\d3s_e60_09\data\skins\ee60_jatoba.paa"};
	};
	class bmwE60_17 {
			displayName = "bay blue";
			texture[] = {"\d3s_e60_09\data\skins\e60_marina_bay_blue.paa"};
	};
	class bmwE60_18 {
			displayName = "mediterranean blue";
			texture[] = {"\d3s_e60_09\data\skins\e60_mediterranean_blue.paa"};
	};
	class bmwE60_19 {
		displayName = "rhodonite silver";
		texture[] = {"\d3s_e60_09\data\skins\e60_rhodonite_silver.paa"};
	};
	class bmwE60_20 {
		displayName = "sophisto grey";
		texture[] = {"\d3s_e60_09\data\skins\e60_sophisto_grey.paa"};
	};
	class bmwE60_21 {
		displayName = "matte";
		texture[] = {"\d3s_e60_09\data\skins\matte.paa"};
	};



	class evoque_1 {
		displayName = "_Aintree Green";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Aintree_Green.paa"};
	};
	class evoque_2 {
		displayName = "Baltoro Ice";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Baltoro_Ice.paa"};
	};
	class evoque_3 {
		displayName = "Corris Grey";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Corris_Grey.paa"};
	};
	class evoque_4 {
		displayName = "Fienze Red";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Fienze_Red.paa"};
	};
	class evoque_5 {
		displayName = "Indus Silver";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Indus_Silver.paa"};
	};
	class evoque_6 {
		displayName = "Kaikoura Stone";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Kaikoura_Stone.paa"};
	};
	class evoque_7 {
		displayName = "Loire Blue";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Loire_Blue.paa"};
	};
	class evoque_8 {
		displayName = "Santorini Black";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Santorini_Black.paa"};
	};
	class evoque_9 {
		displayName = "Scotia Grey";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Scotia_Grey.paa"};
	};
	class evoque_10 {
		displayName = "Waitomo Grey";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Waitomo_Grey.paa"};
	};
	class evoque_11 {
		displayName = "Waitomo Grey";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Waitomo_Grey.paa"};
	};
	class evoque_12 {
		displayName = "Yulong White";
		texture[] = {"\d3s_evoque_16\data\skins\Evoque_Yulong_White.paa"};
	};

	//M3 F80 обычная
	class F80_1  {
		displayName = "Atlas Cedar";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Atlas_Cedar.paa"};
	};
	class F80_2 {
		displayName = "Black Uni";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Black_Uni.paa"};
	};
	class F80_3 {
		displayName = "Bluestone";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Bluestone.paa"};
	};
	class F80_4 {
		displayName = "Cashmere Silver";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Cashmere_Silver.paa"};
	};
	class F80_5 {
		displayName = "Imperial Blue";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Imperial_Blue.paa"};
	};
	class F80_6 {
		displayName = "Jatoba";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Jatoba.paa"};
	};
	class F80_7 {
		displayName = "Mediterranean Blue";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Mediterranean_Blue.paa"};
	};
	class F80_8 {
		displayName = "Sophisto Grey";
		texture[] = {"\d3s_f80_14\data\skins\F80\F80_Sophisto_Grey.paa"};
	};

	//M3 F80 GT VIP
	class M3F80_1 {
		displayName = "Almandine Brown";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Almandine_Brown.paa"};
	};
	class  M3F80_2 {
		displayName = "Alpine White";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Alpine_White.paa"};
	};
	class  M3F80_3 {
		displayName = "Austin Yellow";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Austin_Yellow.paa"};
	};
	class  M3F80_4 {
		displayName = "Azurite Black";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Azurite_Black.paa"};
	};
	class  M3F80_5 {
		displayName = "Black Sapphire";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Black_Sapphire.paa"};
	};
	class  M3F80_6 {
		displayName = "Champagne Quartz";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Champagne_Quartz.paa"};
	};
	class  M3F80_7 {
		displayName = "Donington Gray";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Donington_Gray.paa"};
	};
	class  M3F80_8 {
		displayName = "Frozen Dark Red";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Frozen_Dark_Red.paa"};
	};
	class  M3F80_9 {
		displayName = "Green Pearl";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Green_Pearl.paa"};
	};
	class  M3F80_10 {
		displayName = "Marina Bay Blue";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Marina_Bay_Blue.paa"};
	};
	class  M3F80_11 {
		displayName = "Melbourne Red";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Melbourne_Red.paa"};
	};
	class  M3F80_12 {
		displayName = "Mineral Grey";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Mineral_Grey.paa"};
	};
	class  M3F80_13 {
		displayName = "MPower";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_MPower.paa"};
	};
	class  M3F80_14 {
		displayName = "Rhodonite Silver";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Rhodonite_Silver.paa"};
	};
	class  M3F80_15 {
		displayName = "Sakhir Orange";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Sakhir_Orange.paa"};
	};
	class  M3F80_16 {
		displayName = "Sapphire Black";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Sapphire_Black.paa"};
	};
	class  M3F80_17 {
		displayName = "Silverstone";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Silverstone.paa"};
	};
	class  M3F80_18 {
		displayName = "Singapore Gray";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Singapore_Gray.paa"};
	};
	class  M3F80_19 {
		displayName = "Snapper Rocks Blue";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Snapper_Rocks_Blue.paa"};
	};
	class  M3F80_20 {
		displayName = "Yas Marina Blue";
		texture[] = {"\d3s_f80_14\data\skins\F80_GTS\F80_Yas_Marina_Blue.paa"};
	};

	//BMW M2
	class BMW_M2_1  {
			displayName = "Atlas Cedar";
			texture[] = {"\d3s_f87_17\data\skins\F22_Atlas_Cedar.paa"};
	};
	class BMW_M2_2 {
			displayName = "Black Uni";
			texture[] = {"\d3s_f87_17\data\skins\F22_Black_Uni.paa"};
	};
	class BMW_M2_3  {
			displayName = "Bluestone";
			texture[] = {"\d3s_f87_17\data\skins\F22_Bluestone.paa"};
	};
	class BMW_M2_4 {
			displayName = "Cashmere Silver";
			texture[] = {"\d3s_f87_17\data\skins\F22_Cashmere_Silver.paa"};
	};
	class BMW_M2_5 {
			displayName = "Glacier Silver";
			texture[] = {"\d3s_f87_17\data\skins\F22_Glacier_Silver.paa"};
	};
	class BMW_M2_6 {
			displayName = "Imperial Blue";
			texture[] = {"\d3s_f87_17\data\skins\F22_Imperial_Blue.paa"};
	};
	class BMW_M2_7 {
			displayName = "Jatoba";
			texture[] = {"\d3s_f87_17\data\skins\F22_Jatoba.paa"};
	};
	class BMW_M2_8 {
			displayName = "Mediterranean Blue";
			texture[] = {"\d3s_f87_17\data\skins\F22_Mediterranean_Blue.paa"};
	};
	class BMW_M2_9 {
			displayName = "Sophisto Grey";
			texture[] = {"\d3s_f87_17\data\skins\F22_Sophisto_Grey.paa"};
	};
	class BMW_M2_10 {
			displayName = "Almandine Brown";
			texture[] = {"\d3s_f87_17\data\skins\F87_Almandine_Brown.paa"};
	};
	class BMW_M2_11 {
			displayName = "Alpine White";
			texture[] = {"\d3s_f87_17\data\skins\F87_Alpine_White.paa"};
	};
	class BMW_M2_12 {
			displayName = "Azurite Black";
			texture[] = {"\d3s_f87_17\data\skins\F87_Azurite_Black.paa"};
	};
	class BMW_M2_13 {
			displayName = "Champagne Quartz";
			texture[] = {"\d3s_f87_17\data\skins\F87_Champagne_Quartz.paa"};
	};
	class BMW_M2_14 {
			displayName = "Donington Gray";
			texture[] = {"\d3s_f87_17\data\skins\F87_Donington_Gray.paa"};
	};
	class BMW_M2_15 {
			displayName = "Marina Bay Blue";
			texture[] = {"\d3s_f87_17\data\skins\F87_Marina_Bay_Blue.paa"};
	};
	class BMW_M2_16 {
			displayName = "Rhodonite Silver";
			texture[] = {"\d3s_f87_17\data\skins\F87_Rhodonite_Silver.paa"};
	};
	class BMW_M2_17 {
			displayName = "Sapphire Black";
			texture[] = {"\d3s_f87_17\data\skins\F87_Sapphire_Black.paa"};
	};
	class BMW_M2_18 {
			displayName = "Singapor Gray";
			texture[] = {"\d3s_f87_17\data\skins\F87_Singapore_Gray.paa"};
	};
	//vip BMW M2
	class BMW_M2_VIP_1 {
			displayName = "Alpine White";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Alpine_White.paa"};
	};
	class BMW_M2_VIP_2 {
			displayName = "Austin Yellow";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Austin_Yellow.paa"};
	};
	class BMW_M2_VIP_3 {
			displayName = "Black Sapphire";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Black_Sapphire.paa"};
	};
	class BMW_M2_VIP_4 {
			displayName = "Frozen Dark Red";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Frozen_Dark_Red.paa"};
	};
	class BMW_M2_VIP_5 {
			displayName = "Green Pearl";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Green_Pearl.paa"};
	};
	class BMW_M2_VIP_6 {
			displayName = "Mineral Grey";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Mineral_Grey.paa"};
	};
	class BMW_M2_VIP_7 {
			displayName = "MPower";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_MPower.paa"};
	};
	class BMW_M2_VIP_8 {
			displayName = "Sakhir Orange";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Sakhir_Orange.paa"};
	};
	class BMW_M2_VIP_9 {
			displayName = "Silverstone";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Silverstone.paa"};
	};
	class BMW_M2_VIP_10 {
			displayName = "Snapper Rocks Blue";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Snapper_Rocks_Blue.paa"};
	};
	class BMW_M2_VIP_11 {
			displayName = "Yas Marina Blue";
			texture[] = {"\d3s_f87_17\data\skins\VIP\F87_Yas_Marina_Blue.paa"};
	};

	//G63 18 Vip skins
	class G63_new_1 {
			displayName = "black";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_black.paa"};
	};
	class G63_new_2 {
			displayName = "citrin brown";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_citrin_brown.paa"};
	};
	class G63_new_3 {
			displayName = "hyacinth red";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_hyacinth_red.paa"};
	};
	class G63_new_4 {
			displayName = "mystic blue";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_mystic_blue.paa"};
	};
	class G63_new_5 {
			displayName = "obsidian black";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_obsidian_black.paa"};
	};
	class G63_new_6 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_polar_white.paa"};
	};
	class G63_new_7 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_tansanite_blue.paa"};
	};
	class G63_new_8 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_tenorite_grey.paa"};
	};
	class G63_new_9 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\amg_thulit_red.paa"};
	};

	// g500 18
	class G500_new_1 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_citrin_brown.paa"};
	};
	class G500_new_2 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_green.paa"};
	};
	class G500_new_3 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_green2.paa"};
	};
	class G500_new_4 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_orange.paa"};
	};
	class G500_new_5 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_orange2.paa"};
	};
	class G500_new_6 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_purple.paa"};
	};
	class G500_new_7 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_purple2.paa"};
	};
	class G500_new_8 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_red.paa"};
	};
	class G500_new_9 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_red2.paa"};
	};
	class G500_new_10 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_white.paa"};
	};
	class G500_new_11 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_white2.paa"};
	};
	class G500_new_12 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_yellow.paa"};
	};
	class G500_new_13 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_colour_yellow2.paa"};
	};
	class G500_new_14 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_desert_sand.paa"};
	};
	class G500_new_15 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_diamant_silver.paa"};
	};
	class G500_new_16 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_emerald_green.paa"};
	};
	class G500_new_17 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_hyacinth_red.paa"};
	};
	class G500_new_18 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_mystic_blue.paa"};
	};
	class G500_new_19 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_obsidian_black.paa"};
	};
	class G500_new_20 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_periklas_green.paa"};
	};
	class G500_new_21 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_tansanite_blue.paa"};
	};
	class G500_new_23 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_tenorite_grey.paa"};
	};
	class G500_new_24 {
			displayName = "";
			texture[] = {"\d3s_g63amg_18\data\skins\w464_thulit_red.paa"};
	};

	//RR Ghost
	class RR_ghost_1  {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_anthracite.paa"};
	};
	class RR_ghost_2 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_anthracite_1.paa"};
	};
	class RR_ghost_3 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_anthracite_2.paa"};
	};
	class RR_ghost_4 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_arctic_white_1.paa"};
	};
	class RR_ghost_5 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_arctic_white_2.paa"};
	};
	class RR_ghost_6 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_black.paa"};
	};
	class RR_ghost_7 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_black_1.paa"};
	};
	class RR_ghost_8 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_black_2.paa"};
	};
	class RR_ghost_9 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_blue_velvet.paa"};
	};
	class RR_ghost_10 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_blue_velvet_1.paa"};
	};
	class RR_ghost_11 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_blue_velvet_2.paa"};
	};
	class RR_ghost_12 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_citrin_brown.paa"};
	};
	class RR_ghost_13 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_citrin_brown_1.paa"};
	};
	class RR_ghost_14 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_citrin_brown_2.paa"};
	};
	class RR_ghost_15 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_diamond_black.paa"};
	};
	class RR_ghost_16 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_diamond_black_1.paa"};
	};
	class RR_ghost_17 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_diamond_black_2.paa"};
	};
	class RR_ghost_18 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_english_red.paa"};
	};
	class RR_ghost_19 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_english_red_1.paa"};
	};
	class RR_ghost_20 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_english_red_2.paa"};
	};
	class RR_ghost_21 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_jubilee_silver.paa"};
	};
	class RR_ghost_22 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_jubilee_silver_1.paa"};
	};
	class RR_ghost_23 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_jubilee_silver_2.paa"};
	};
	class RR_ghost_24 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_madeira_red.paa"};
	};
	class RR_ghost_25 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_madeira_red_1.paa"};
	};
	class RR_ghost_26 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_madeira_red_2.paa"};
	};
	class RR_ghost_27 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_metropolian_blue.paa"};
	};
	class RR_ghost_28 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_metropolian_blue_1.paa"};
	};
	class RR_ghost_29 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_metropolian_blue_2.paa"};
	};
	class RR_ghost_30 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_midnight_blue.paa"};
	};
	class RR_ghost_31 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_midnight_blue_1.paa"};
	};
	class RR_ghost_32 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_midnight_blue_2.paa"};
	};
	class RR_ghost_33 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_new_sable.paa"};
	};
	class RR_ghost_34 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_new_sable_1.paa"};
	};
	class RR_ghost_35 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_new_sable_2.paa"};
	};
	class RR_ghost_36 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_woodland_green.paa"};
	};
	class RR_ghost_37 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_woodland_green_1.paa"};
	};
	class RR_ghost_38 {
			displayName = "";
			texture[] = {"\d3s_ghost_18\data\skins\gh_woodland_green_2.paa"};
	};


	//GLE 20
	class GLE_20_1 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_brilliant_blue.paa"};
	};
	class GLE_20_2 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_cavnsit_blue.paa"};
	};
	class GLE_20_3 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_citrin_brown.paa"};
	};
	class GLE_20_4 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_diamond_white.paa"};
	};
	class GLE_20_5 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_hyazinth_red.paa"};
	};
	class GLE_20_6 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_iridium_silver.paa"};
	};
	class GLE_20_7 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_ivory.paa"};
	};
	class GLE_20_8 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_obsidian_black.paa"};
	};
	class GLE_20_9 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_orient_brown.paa"};
	};
	class  {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_palladium_silver.paa"};
	};
	class GLE_20_10 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_red.paa"};
	};
	class GLE_20_11 {
			displayName = "";
			texture[] = {"\d3s_gle_20\data\skins\gle_tenorite_grey.paa"};
	};


	//GLS
	class GLS_1 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\black.paa"};
	};
	class GLS_2 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\cavnsit_blue.paa"};
	};
	class GLS_3 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\citrin_brown.paa"};
	};
	class  GLS_4 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\diamond_white.paa"};
	};
	class  GLS_5 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\hyazinth_red.paa"};
	};
	class  GLS_6 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\iridium_silver.paa"};
	};
	class  GLS_7 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\obsidian_black.paa"};
	};
	class  GLS_8 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\palladium_silver.paa"};
	};
	class  GLS_9 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\polar_white.paa"};
	};
	class  GLS_10 {
			displayName = "";
			texture[] = {"\d3s_gls63amg_17\data\skins\tenorite_grey.paa"};
	};


	//KAMAZ
	class KAMAZ_1 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_black.paa"};
	};
	class KAMAZ_2 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_blue.paa"};
	};
	class KAMAZ_3 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_green.paa"};
	};
	class KAMAZ_4 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_green2.paa"};
	};
	class KAMAZ_5 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_military.paa"};
	};
	class KAMAZ_6 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_orange.paa"};
	};
	class KAMAZ_7 {
			displayName = "";
			texture[] = {"\d3s_kamaz\data\skins\4310_AO_white.paa"};
	};


	//malibu
	class malibu_1 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_black.paa"};
	};
	class malibu_2 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_bright_yellow.paa"};
	};
	class malibu_3 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_garnet_red.paa"};
	};
	class malibu_4 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_hyper_blue.paa"};
	};
	class malibu_5 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_mosaic_black.paa"};
	};
	class malibu_6 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_nightfall_gray.paa"};
	};
	class malibu_7 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_red_hot.paa"};
	};
	class malibu_8 {
			displayName = "";
			texture[] = {"\d3s_malibu_18\data\skins\mal_silver_ice.paa"};
	};


	//RR SVR
	class SVR_1 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_aintree_green.paa"};
	};
	class SVR_2{
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_baltoro_ice.paa"};
	};
	class SVR_3 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_corris_grey.paa"};
	};
	class SVR_4 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_fienze_red.paa"};
	};
	class SVR_5 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_indus_silver.paa"};
	};
	class SVR_6 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_kaikoura_stone.paa"};
	};
	class SVR_7 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_loire_blue.paa"};
	};
	class SVR_8 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_santorini_black.paa"};
	};
	class SVR_9 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_scotia_grey.paa"};
	};
	class SVR_10 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_waitomo_grey.paa"};
	};
	class SVR_11 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\sdv_yulong_white.paa"};
	};
	class SVR_12 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_british_racing_green.paa"};
	};
	class SVR_13 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_byron_blue.paa"};
	};
	class SVR_14 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_byron_blue_two_tone.paa"};
	};
	class SVR_15 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_corris_grey.paa"};
	};
	class SVR_16 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_fienze_red.paa"};
	};
	class SVR_17 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_fienze_red_two_tone.paa"};
	};
	class SVR_18 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_kaikoura_stone.paa"};
	};
	class SVR_19 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_kaikoura_stone_two_tone.paa"};
	};
	class SVR_20 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_madagascar_orange.paa"};
	};
	class SVR_21 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_madagascar_orange_two_tone.paa"};
	};
	class SVR_22 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_mescalito_black.paa"};
	};
	class SVR_23 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_santorini_black.paa"};
	};
	class SVR_24 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_velocity.paa"};
	};
	class SVR_25 {
			displayName = "";
			texture[] = {"\d3s_svr_17\data\skins\svr_velocity_two_tone.paa"};
	};

	//S-class w222
	class w222_1 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_allanit_gray.paa"};
	};
	class w222_2 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_anthracite_blue.paa"};
	};
	class w222_3 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\222_black.paa"};
	};
	class w222_4 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_cashmere_white.paa"};
	};
	class w222_5 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_cavansit_blue.paa"};
	};
	class w222_6 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_citrin_brown.paa"};
	};
	class w222_7 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_diamond_silver.paa"};
	};
	class w222_8 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_diamond_white.paa"};
	};
	class w222_9 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_emerald_green.paa"};
	};
	class w222_10 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_mokka_schwarz.paa"};
	};
	class w222_11 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\v222_ruby_black.paa"};
	};
	//vip
	class w222_12 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_allanit_gray.paa"};
	};
	class w222_13 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_anthracite_blue.paa"};
	};
	class w222_14 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_cashmere_white.paa"};
	};
	class w222_15 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_cavansit_blue.paa"};
	};
	class w222_16 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_citrin_brown.paa"};
	};
	class w222_17 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_diamond_silver.paa"};
	};
	class w222_18 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_diamond_white.paa"};
	};
	class w222_19 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_emerald_green.paa"};
	};
	class w222_20 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_mokka_schwarz.paa"};
	};
	class w222_21 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_ruby_black.paa"};
	};
	class w222_22 {
			displayName = "";
			texture[] = {"\d3s_v222_13\data\skins\vip\w222_white.paa"};
	};


	//c-class
	class C_classW205_1 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_black.paa"};
	};
	class C_classW205_2 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_blue.paa"};
	};
	class C_classW205_3 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_breeze.paa"};
	};
	class C_classW205_4 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_green.paa"};
	};
	class C_classW205_5 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_orange.paa"};
	};
	class C_classW205_6 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_red.paa"};
	};
	class C_classW205_7 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_silver.paa"};
	};
	class C_classW205_8 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\c63_yellow.paa"};
	};
	class C_classW205_9 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_brilliant_blue.paa"};
	};
	class C_classW205_10 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_cavansite_blue.paa"};
	};
	class C_classW205_11 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_citrin_brown.paa"};
	};
	class C_classW205_12 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_diamond_silver.paa"};
	};
	class C_classW205_13 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_diamond_white.paa"};
	};
	class C_classW205_14 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_hyazinth_red.paa"};
	};
	class C_classW205_15{
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_iridium_silver.paa"};
	};
	class C_classW205_16 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_ivory.paa"};
	};
	class C_classW205_17 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_jupiter_red.paa"};
	};
	class C_classW205_18 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_obsidian_black.paa"};
	};
	class C_classW205_19 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_orient_brown.paa"};
	};
	class C_classW205_20 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_polar_white.paa"};
	};
	class C_classW205_21 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w205_selenit_grey.paa"};
	};

	//E-class
	class Eclass_w212_1 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_brilliant_blue.paa"};
	};
	class Eclass_w212_2 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_cavansite_blue.paa"};
	};
	class Eclass_w212_3 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_citrin_brown.paa"};
	};
	class Eclass_w212_4 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_diamond_silver.paa"};
	};
	class Eclass_w212_5 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_diamond_white.paa"};
	};
	class Eclass_w212_6 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_hyazinth_red.paa"};
	};
	class Eclass_w212_7 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_iridium_silver.paa"};
	};
	class Eclass_w212_8 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_ivory.paa"};
	};
	class Eclass_w212_9 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_jupiter_red.paa"};
	};
	class Eclass_w212_10 {
			displayName = "";
			texture[] = {"\d3s_w205_14\data\skins\w212_obsidian_black.paa"};
	};
	class Eclass_w212_11 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_orient_brown.paa"};
	};
	class Eclass_w212_12 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_orient_brown.paa"};
	};
	class Eclass_w212_13 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_polar_white.paa"};
	};
	class Eclass_w212_14 {
			displayName = "";
			texture[] = {"\d3s_w212_13\data\skins\w212_selenit_grey.paa"};
	};

	//leveante
	class leveant_1 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Bianco_Alpi.paa"};
	};
	class leveant_2 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Blu_Emozione.paa"};
	};
	class leveant_3 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Blu_Passione.paa"};
	};
	class leveant_4 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Champagne.paa"};
	};
	class leveant_5 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Esteso.paa"};
	};
	class leveant_6 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Esteso_Orange.paa"};
	};
	class leveant_7 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Grigio.paa"};
	};
	class leveant_8 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Grigio_Maratea.paa"};
	};
	class leveant_9 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Grigio_Metallo.paa"};
	};
	class leveant_10 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Nero.paa"};
	};
	class leveant_11 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Nero_Ribelle.paa"};
	};
	class leveant_12 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Rame.paa"};
	};
	class leveant_13 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Rosso_Rubino.paa"};
	};
	class leveant_14 {
			displayName = "";
			texture[] = {"\d3s_levante_17\data\skins\LEV_AO_Verde_Ossido.paa"};
	};


	class bmw_cabrio_1 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Alpine_White.paa"};
	};
	class bmw_cabrio_2 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Austin_Yellow.paa"};
	};
	class bmw_cabrio_3 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Black_Sapphire.paa"};
	};
	class bmw_cabrio_4 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Black_Uni.paa"};
	};
	class bmw_cabrio_5 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Bluestone.paa"};
	};
	class bmw_cabrio_6 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Glacier_Silver.paa"};
	};
	class bmw_cabrio_7 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Green_Pearl.paa"};
	};
	class bmw_cabrio_8 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Imperial_Blue.paa"};
	};
	class bmw_cabrio_9 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Marina_Bay_Blue.paa"};
	};
	class bmw_cabrio_10 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Mediterranean_Blue.paa"};
	};
	class bmw_cabrio_11 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Melbourne_Red.paa"};
	};
	class bmw_cabrio_12 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Mineral_Grey.paa"};
	};
	class bmw_cabrio_13 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Rhodonite_Silver.paa"};
	};
	class bmw_cabrio_14 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Sakhir_Orange.paa"};
	};
	class bmw_cabrio_15 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Silverstone.paa"};
	};
	class bmw_cabrio_16 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Snapper_Rocks_Blue.paa"};
	};
	class bmw_cabrio_17 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Sophisto_Grey.paa"};
	};
	class bmw_cabrio_18 {
			displayName = "";
			texture[] = {"\d3s_e89_12\data\skins\E89_Yas_Marina_Blue.paa"};
	};


	//qx56_
	class qx56_1 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Black_Obsidian.paa"};
	};
	class qx56_2 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Champagne_Quartz.paa"};
	};
	class qx56_3 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Graphite_Shadow.paa"};
	};
	class qx56_4 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Hermosa_Blue.paa"};
	};
	class qx56_5 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Liquid_Platinum.paa"};
	};
	class qx56_6 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Mineral_Black.paa"};
	};
	class qx56_7 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Mocha_Almond.paa"};
	};
	class qx56_8 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Moonstone_White.paa"};
	};
	class qx56_9 {
			displayName = "";
			texture[] = {"\d3s_qx56_13\data\skins\Smokey_Quartz.paa"};
	};


	//q50_
	class q50_1 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Black_Obsidian.paa"};
	};
	class q50_2 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Chestnut_Bronze.paa"};
	};
	class q50_3 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Dynamic_Sunstone_Red.paa"};
	};
	class q50_4 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Graphite_Shadow.paa"};
	};
	class q50_5 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Hagane_Blue.paa"};
	};
	class q50_6 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Iridium_Blue.paa"};
	};
	class q50_7 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Liguid_Platinum.paa"};
	};
	class q50_8 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Midnight_Black.paa"};
	};
	class q50_9 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Moonlight_White.paa"};
	};
	class q50_10 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Solar_Mica.paa"};
	};
	class q50_11 {
			displayName = "";
			texture[] = {"\d3s_q50_14\data\skins\Venitian_Ruby.paa"};
	};

	//qx60_
	class qx60_1 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\Black_Obsidian.paa"};
	};
	class qx60_2 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\Chestnut_Bronze.paa"};
	};
	class qx60_3 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\Dynamic_Sunstone_Red.paa"};
	};
	class qx60_4 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\Graphite_Shadow.paa"};
	};
	class qx60_5 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\Hagane_Blue.paa"};
	};
	class qx60_6 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\Liguid_Platinum.paa"};
	};
	class qx60_7 {
			displayName = "";
			texture[] = {"\d3s_qx60_16\data\skins\LUMI.paa"};
	};

	class 7news_vert {
			displayName = "";
			texture[] = {"\Ben_T\Welm\7NEWS1_25.paa"};
	};

	//clubman_
	class clubman_1 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_AO_Two_Tone.paa"};
	};
	class clubman_2 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_British_Racing_Green.paa"};
	};
	class clubman_3 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_British_Racing_Green_Two_Tone.paa"};
	};
	class clubman_4 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Chili_Red.paa"};
	};
	class clubman_5 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Chili_Red_Two_Tone.paa"};
	};
	class clubman_6 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Electric_Blue.paa"};
	};
	class clubman_7 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Electric_Blue_Two_Tone.paa"};
	};
	class clubman_8 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Melting_Silver.paa"};
	};
	class clubman_9 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Melting_Silver_Two_Tone.paa"};
	};
	class clubman_10 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Moonwalk_Grey.paa"};
	};
	class clubman_11 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Moonwalk_Grey_Two_Tone.paa"};
	};
	class clubman_12 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Pepper_White.paa"};
	};
	class clubman_13 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Pepper_White_Two_Tone.paa"};
	};
	class clubman_14 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Rebel_Green.paa"};
	};
	class clubman_15 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Rebel_Green_Two_Tone.paa"};
	};
	class clubman_16 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Thunder_Grey.paa"};
	};
	class clubman_17 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Thunder_Grey_Two_Tone.paa"};
	};
	class clubman_18 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Volcanic_Orange.paa"};
	};
	class clubman_19 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Volcanic_Orange_Two_Tone.paa"};
	};
	class clubman_20 {
			displayName = "";
			texture[] = {"\d3s_clubman_11\data\skins\Club_Yours_Lapisluxury_Blue_Two_Tone.paa"};
	};


	/////

	/* EMS */

	class EMS_f86_15 {
			displayName = "МЧС";
			texture[] = {"\RRP_structures\Data\textures\EMS\d3s_f86_15_COP.paa"};
	};
	class EMS_g500_18 {
			displayName = "МЧС";
			texture[] = {"\RRP_structures\Data\textures\EMS\d3s_g500_18_EMS.paa"};
	};
	class EMS_Paragon {
			displayName = "МЧС";
			texture[] = {"\RRP_structures\Data\textures\EMS\osk_Paragon_ems_base.paa"};
	};
	class EMS_Buran {
			displayName = "МЧС";
			texture[] = {"\RRP_structures\Data\textures\EMS\MM_Buran_Medical.paa"};
	};
	class EMS_Zil_131 {
			displayName = "МЧС";
			texture[] = {
				"\RRP_structures\Data\textures\EMS\d3s_zil_131_5.paa",
				"\RRP_structures\Data\textures\EMS\d3s_zil_131_5_tent.paa"
			};
	};


	/* SWAT */

	class SWAT_Eurocopter {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\helics\SWATeuroc.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_MH9 {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\helics\SWATmh9.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_Tiger {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\armoredcars\SWATtigr.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_Kuruma {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\armoredcars\SWATkuruma.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_LM002 {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\lm002.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_SVR {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\SWATsvr.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_W212 {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\e63s.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_Camry {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\camry.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_F86 {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\x6mofr.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};
	class SWAT_f90 {
			displayName = "OPR";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\f90.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";
	};

	/* FBI */

	class FBI_Eurocopter {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\helics\FBIeuro.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_MH9 {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\helics\FBImh9.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_Tiger {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\armoredcars\FBItigr.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_Kuruma {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\armoredcars\FBIkuruma.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_GTR15 {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\gtr.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_SVR {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\FBIsvr.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_f90 {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\fbi_f90.paa"};
			conditions = "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]";
	};
	class FBI_6x6 {
			displayName = "FBI";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\6x6_76561199028844328.paa"};
	}; 

	/* Police */

	class PD_Tiger {
			displayName = "Полиция";
			texture[] = {"\spec_uniform\DATA\vehicles\armoredcars\PDtigr.paa"};
	};
	class PD_Kuruma {
			displayName = "Полиция";
			texture[] = {"\welmen_battle_veh\data\Kuruma_PD.paa"};
	};
	class PD_Veneno {
			displayName = "Полиция";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\veneno.paa"};
	};
	class COP_760LE {
			displayName = "Полиция";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\g12.paa"};
	};
	class COP_Durango {
			displayName = "Полиция";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\durango.paa"};
	};
	class COP_f90 {
			displayName = "Полиция";
			texture[] = {"\spec_uniform\DATA\vehicles\cars\police_f90.paa"};
	};
	class COP_Camry {
			displayName = "Полиция";
			texture[] = {"\RRP_structures\Data\textures\PD\Camry\Camry.paa"};
	};
	class COP_Malibu {
			displayName = "Полиция";
			texture[] = {"\RRP_structures\Data\textures\PD\Malibu\Malibu.paa"};
	};
	class COP_Taurus {
			displayName = "Полиция";
			texture[] = {"\RRP_structures\Data\textures\PD\Taurus\Taurus.paa"};
	};
	class COP_SVR {
			displayName = "Полиция";
			texture[] = {"\RRP_structures\Data\textures\PD\SVR\SVR.paa"};
	};
	class COP_LaFerrari {
			displayName = "Полиция";
			texture[] = {"\RRP_structures\Data\textures\PD\LaFerrari\LaFerrari.paa"};
	};

	/// EMS
	class EMS_durango {
			displayName = "";
			texture[] = {"\RRP_structures\Data\textures\EMS\Durango\Durango.paa"};
	};
	class EMS_tahoe {
			displayName = "";
			texture[] = {"\RRP_structures\Data\textures\EMS\Tahoe\Tahoe.paa"};
	};
	class EMS_BMW_M5 {
			displayName = "";
			texture[] = {"\RRP_structures\Data\textures\EMS\BMW_M5\BMW_M5.paa"};
	};
	class EMS_Malibu {
			displayName = "";
			texture[] = {"\RRP_structures\Data\textures\EMS\Malibu\Malibu.paa"};
	};
	class EMS_SVR {
			displayName = "";
			texture[] = {"\RRP_structures\Data\textures\EMS\SVR\SVR.paa"};
	};
	class CN_BMW_1 {
			displayName = "";
			texture[] = {"\CosaN\data\CN_BMW_X6_M_1.paa"};
	};
	class CN_BMW_2 {
			displayName = "";
			texture[] = {"\CosaN\data\CN_BMW_X6_M_2.paa"};
	};
	class CN_BMW_3 {
			displayName = "";
			texture[] = {"\CosaN\data\CN_BMW_X6_M_3.paa"};
	};
	class imper_ins_1 {
			displayName = "1";
			texture[] = {"\ImperiumPack\Textures\Veh\Insurgent1.paa"};
	};
	class imper_ins_2 {
			displayName = "2";
			texture[] = {"\ImperiumPack\Textures\Veh\Insurgent2.paa"};
	};
	class imper_ins_3 {
			displayName = "3";
			texture[] = {"\ImperiumPack\Textures\Veh\Insurgent3.paa"};
	};
	class f82_Pirates_1 {
			displayName = "1";
			texture[] = {"\welmen_battle_veh\data\RRPVehicle_f82_Pirates.paa"};
	};
	class f82_Pirates_2 {
			displayName = "2";
			texture[] = {"\welmen_battle_veh\data\RRPVehicle_f82_Pirates2.paa"};
	};
	class XESV_Pirates_1 {
			displayName = "1";
			texture[] = {"\PiratesPack\Textures\RRPVehicle_xesv_Pirates.paa"};
	};
	class XESV_Pirates_2 {
			displayName = "2";
			texture[] = {"\PiratesPack\Textures\RRPVehicle_yaguar_Pirates.paa"};
	};
	class e400_Pirates_2 {
			displayName = "2";
			texture[] = {"\PiratesPack\Textures\RRPVehicle_e400_Pirates.paa"};
	};
	class RRPVehicle_e400{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_e400_Pirates.paa"};
	};
	class RRPVehicle_g65amg{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_g65amg_Pirates.paa"};
	};
	class RRPVehicle_lm002{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_lm002_Pirates.paa"};
	};
	class RRPVehicle_vv222{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_vv222_Pirates.paa"};
	};
	class RRPVehicle_xesv{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_xesv_Pirates.paa"};
	};
	class escobaro_heli{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\escobaro_heli.paa"};
	};
	class escobaro_heli_1{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\escobaro_heli.paa"};
	};
	class RRPVehicle_insurgent{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_insurgent_Pirates.paa"};
	};
	class RRPVehicle_50call{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_50call_Pirates.paa"};
	};
	class RRPVehicle_f82{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_f82_Pirates.paa"};
	};
	class RRPVehicle_savana{
			displayName = "Escobaro";
			texture[] = {"\PiratesPack\Textures\Escobaro\RRPVehicle_savana_Pirates.paa"};
	};
	//
	class d3s_e400_BW{
			displayName = "MS-13";
			texture[] = {"\BW_pack\data\Veh\d3s_e400_BW.paa"};
	};
	class d3s_gl63amg_BW{
			displayName = "MS-13";
			texture[] = {"\BW_pack\data\Veh\d3s_gl63amg_BW.paa"};
	};
	class d3s_wrx_17_BW{
			displayName = "MS-13";
			texture[] = {"\BW_pack\data\Veh\d3s_wrx_17_BW.paa"};
	};
	class insurgent_valkirey{
			displayName = "MS-13";
			texture[] = {"\BW_pack\data\Veh\insurgent_valkirey.paa"};
	};
	class BW_humming{
			displayName = "MS-13";
			texture[] = {"\BW_pack\data\Veh\BW_humming.paa"};
	};
	class RRPVehicle_santafe_MS13{
			displayName = "MS-13";
			texture[] = {"\BW_pack\data\RRPVehicle_santafe_MS13.paa"};
	};
	class Black{
			displayName = "Черный";
			texture[] = {"d3s_cars_core\data\black.paa"};
	};
	/*
	class  {
			displayName = "";
			texture[] = {""};
	};
	*/
	class RRPVehicle_f87_Sopranos_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\RRPVehicle_f87_Sopranos_1.paa"};
	};
	class RRPVehicle_santafe_Sopranos_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\RRPVehicle_santafe_Sopranos_1.paa"};
	};
	class RRPVehicle_insurgent_Sopranos_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\RRPVehicle_insurgent_Sopranos_1.paa"};
	};
	class Sopranos_200_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\Sopranos_200_1.paa"};
	};
	class Sopranos_f82_14_LB_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\Sopranos_f82_14_LB_1.paa"};
	};
	class d3s_escalade_CHROME_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\d3s_escalade_CHROME_1.paa"};
	};
	class Sopranos_Camaro_ZL1_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\Sopranos_Camaro_ZL1_1.paa"};
	};
	class d3s_kuruma_sopranos2_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\d3s_kuruma_sopranos2_1.paa"};
	};
	class d3s_kuruma_sopranos2_2{
			displayName = "2";
			texture[] = {"sopranos\data\car_alpha\d3s_kuruma_sopranos2_2.paa"};
	};
	class d3s_focus_17_Sopranos_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\d3s_focus_17_Sopranos_1.paa"};
	};
	class Sopranos_humming_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\Sopranos_humming_1.paa"};
	};
	class RRPVehicle_LM002_Sopranos_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\RRPVehicle_LM002_Sopranos_1.paa"};
	};
	class RRPVehicle_tiger_76561197989379888_1{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\RRPVehicle_tiger_76561197989379888_1.paa"};
	};
	class Sopranos_pullman{
			displayName = "Черный";
			texture[] = {"sopranos\data\car_alpha\Sopranos_pullman.paa"};
	};
	////

	class RRPVehicle_TM2UCG_76561198366046837_01 {
		displayName = "Цвет 1";
		texture[] = {"#(argb,8,8,3)color(0,0,0,1.0,CO)"};
	};
	class RRPVehicle_TM2UCG_76561198366046837_02 {
		displayName = "Цвет 2";
		texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_TM2UCG_76561198366046837.paa"};
	};
	class RRPVehicle_LP700_76561198965376624_01 {
		displayName = "Camo";
		texture[] = {"RRP_vehicles\Data\prem\76561198965376624\RRPVehicle_LP700_76561198965376624_1.paa"};
	};
	class RRPVehicle_LP700_76561198965376624_02 {
		displayName = "Police";
		texture[] = {"RRP_vehicles\Data\prem\76561198965376624\RRPVehicle_LP700_76561198965376624_2.paa"};
	};
	class RRPVehicle_LP700_76561198965376624_03 {
		displayName = "OPR";
		texture[] = {"RRP_vehicles\Data\prem\76561198965376624\RRPVehicle_LP700_76561198965376624_3.paa"};
	};

	class RRPVehicle_Mansory_umbrella_1 {
			displayName = "Bears 1";
			texture[] = {"Umbrella\Data\Vehicle\Beers\RRPVehicle_Mansory_umbrella_1.paa"};
	};
	class RRPVehicle_Mansory_umbrella_2 {
			displayName = "Bears 2";
			texture[] = {"Umbrella\Data\Vehicle\Mansory_2.paa"};
	};
	class RRPVehicle_e220_umbrella_1 {
			displayName = "Bears 1";
			texture[] = {"Umbrella\Data\Vehicle\Beers\RRPVehicle_e220_umbrella_1.paa"};
	};
	class RRPVehicle_e220_umbrella_2 {
			displayName = "Bears 2";
			texture[] = {"Umbrella\Data\Vehicle\e220_2.paa"};
	};
	class RRPVehicle_Insurgent_Umbrella_1{
			displayName = "Bears";
			texture[] = {"Umbrella\Data\Vehicle\Beers\RRPVehicle_Insurgent_Umbrella_1.paa"};
	};
	class RRPVehicle_hummingbird_umbrella_1{
			displayName = "Bears";
			texture[] = {"Umbrella\Data\Vehicle\Beers\RRPVehicle_hummingbird_umbrella_1.paa"};
	};
	class RRPVehicle_cullinan_76561198437378792_1{
			displayName = "1";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_cullinan_76561198437378792.paa"};
	};
	class RRPVehicle_cullinan_76561198437378792_2{
			displayName = "2";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_cullinan_76561198437378792_2.paa"};
	};
	class RRPVehicle_javelin_76561198802169420_1{
			displayName = "1";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_javelin_76561198802169420_1.paa"};
	};
	class RRPVehicle_javelin_76561198802169420_2{
			displayName = "2";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_javelin_76561198802169420_2.paa"};
	};
	class RRPVehicle_javelin_76561198802169420_3
	{
			displayName = "3";
			texture[] = {"RRP_vehicles\Data\prem\76561198802169420\RRPVehicle_javelin_76561198802169420_3.paa"};
	};
	class RRPVehicle_bentayga_76561198802169420_1{
			displayName = "1";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_bentayga_76561198802169420_1.paa"};
	};
	class RRPVehicle_bentayga_76561198802169420_2{
			displayName = "2";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_bentayga_76561198802169420_2.paa"};
	};
	class RRPVehicle_bentayga_76561198802169420_3{
			displayName = "3";
			texture[] = {"RRP_vehicles\Data\prem\76561198802169420\RRPVehicle_bentayga_76561198802169420_3.paa"};
	};
	class RRPVehicle_f1gt_76561198860385638_1{
			displayName = "1";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_f1gt_76561198860385638.paa"};
	};
	class RRPVehicle_f1gt_76561198860385638_2{
			displayName = "2";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_f1gt_76561198860385638_2.paa"};
	};
	class RRPVehicle_f1gt_76561198860385638_3{
			displayName = "3";
			texture[] = {
			"RRP_vehicles\Data\prem\RRPVehicle_f1gt_76561198860385638_3.paa",
			"#(argb,8,8,3)color(0.87451,0.619608,0.192157,1.0,CO)",
			"d3s_cars_core\data\black_co.paa",
			"RRP_vehicles\Data\prem\RRPVehicle_f1gt_76561198860385638_3_1.paa",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""
		};
	};
	class RRPVehicle_f1gt_76561198860385638_4{
			displayName = "4 7News";
			texture[] = {"RRP_vehicles\Data\prem\RRPVehicle_f1gt_76561198860385638_4.paa"};
	};
	class RRPVehicle_f1gt_76561198860385638_5{
			displayName = "5 7News";
			texture[] = {"\RRPVehicle_7news_pack\data\720s.paa"};
	};

	class buhanka_box_red {
		displayName = "Красный";
		texture[] = {"\d3s_uaz_3741\data\skins\452_AO_Red_co.paa"};
	};
	class buhanka_box_green {
		displayName = "Серый";
		texture[] = {"\d3s_uaz_3741\data\skins\452_AO_Green2_co.paa"};
	};

	//буханка обычная
	class 3741_Black {
		displayName = "Черный";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Black.paa.paa"};
	};
	class 3741_Black_2 {
		displayName = "Черный «Молния»";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Black_2.paa"};
	};
	class 3741_Blue {
		displayName = "Морская волна";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Blue.paa"};
	};
	class 3741_camo2 {
		displayName = "Американский ХАКИ";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo2.paa"};
	};
	class 3741_camo3 {
		displayName = "Пиксельный камуфляж";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo3.paa"};
	};
	class 3741_camo4 {
		displayName = "Сафари";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo4.paa"};
	};
	class 3741_camo5 {
		displayName = "Цифра";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo5.paa"};
	};
	class 3741_camo6 {
		displayName = "Пантрий";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo6.paa"};
	};
	class 3741_camo7 {
		displayName = "Меркурий";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo7.paa"};
	};
	class 3741_camo8 {
		displayName = "Зеленка";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_camo8.paa"};
	};
	class 3741_Khaki {
		displayName = "Зима";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Khaki.paa"};
	};
	class 3741_Khaki_2 {
		displayName = "Песчаный хаки";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Khaki_2.paa"};
	};
	class 3741_Red {
		displayName = "Красная";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Red.paa"};
	};
	class 3741_Silver_2 {
		displayName = "Серая";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Silver_2.paa"};
	};
	class 3741_Khaki_3 {
		displayName = "Песчаный хаки";
		texture[] = {"\d3s_uaz_3741\data\skins\3741_Khaki_2.paa"};
	};



	class d3s_megane_06_1 {
		displayName = "Черный";
		texture[] = {"\d3s_megane_06\data\skins\MEG_Black_Etoile.paa"};
	};
	class d3s_megane_06_2 {
		displayName = "Космос";
		texture[] = {"\d3s_megane_06\data\skins\MEG_Blue_Cosmos.paa"};
	};
	class d3s_megane_06_3 {
		displayName = "Коричневый";
		texture[] = {"\d3s_megane_06\data\skins\MEG_Brown_Vison.paa"};
	};
	class d3s_megane_06_4 {
		displayName = "Серый титан";
		texture[] = {"\d3s_megane_06\data\skins\MEG_Gray_Titanium.paa"};
	};
	class d3s_megane_06_5 {
		displayName = "Красный";
		texture[] = {"\d3s_megane_06\data\skins\MEG_Red_Intens.paa"};
	};
	class d3s_megane_06_6 {
		displayName = "Бежевый";
		texture[] = {"\d3s_megane_06\data\skins\MEG_Without_Dune.paa"};
	};

	class d3s_911carrera_20_1 {
		displayName = "Серый";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Agate_Grey.paa"};		
	};
	class d3s_911carrera_20_2 {
		displayName = "Красный";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Carmine_Red.paa"};		
	};
	class d3s_911carrera_20_3 {
		displayName = "Зеленый";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Green.paa"};		
	};
	class d3s_911carrera_20_4 {
		displayName = "Оранжевый";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Lava_Orange.paa"};		
	};
	class d3s_911carrera_20_5 {
		displayName = "Баклажан";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Mahogany.paa"};		
	};
	class d3s_911carrera_20_6 {
		displayName = "Морской бриз";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Miami_Blue.paa"};		
	};
	class d3s_911carrera_20_7 {
		displayName = "Желтый";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Racing_Yellow.paa"};		
	};
	class d3s_911carrera_20_8 {
		displayName = "Синий";
		texture[] = {"\d3s_911carrera_20\data\skins\9114S_Sapphire_Blue.paa"};		
	};


	class d3s_titan_17_1 {
		displayName = "Черный";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Black.paa"};		
	};
	class d3s_titan_17_2 {
		displayName = "Черный гранит";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Black_Granite.paa"};		
	};
	class d3s_titan_17_3 {
		displayName = "Синий";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Blue.paa"};		
	};
	class d3s_titan_17_4 {
		displayName = "Морской бриз";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Breeze.paa"};		
	};
	class d3s_titan_17_5 {
		displayName = "Кристально-красный";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Crystal_Red.paa"};		
	};
	class d3s_titan_17_6 {
		displayName = "Золотой";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Gold_Mist.paa"};		
	};
	class d3s_titan_17_7 {
		displayName = "Серый";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Gray.paa"};		
	};
	class d3s_titan_17_8 {
		displayName = "Лайм";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Lime.paa"};		
	};
	class d3s_titan_17_9 {
		displayName = "Моча-стил";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Mocha_Steel.paa"};		
	};
	class d3s_titan_17_10 {
		displayName = "Неон";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Neon.paa"};		
	};
	class d3s_titan_17_11 {
		displayName = "Оранжевый";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Orange.paa"};		
	};
	class d3s_titan_17_12 {
		displayName = "Красный";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Red.paa"};		
	};
	class d3s_titan_17_13 {
		displayName = "Серый";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Silver_Ice.paa"};		
	};
	class d3s_titan_17_14 {
		displayName = "Фиолетовый";
		texture[] = {"\d3s_titan_17\data\skins\Titan_Violette.paa"};		
	};


	class d3s_juke_15_1 {
		displayName = "Синий";
		texture[] = {"\d3s_juke_15\data\skins\JUKE_Blue.paa"};		
	};
	class d3s_juke_15_2 {
		displayName = "Зеленый";
		texture[] = {"\d3s_juke_15\data\skins\JUKE_Green.paa"};		
	};
	class d3s_juke_15_3 {
		displayName = "Серый";
		texture[] = {"\d3s_juke_15\data\skins\JUKE_Grey.paa"};		
	};
	class d3s_juke_15_4 {
		displayName = "Розовый";
		texture[] = {"\d3s_juke_15\data\skins\JUKE_Pink.paa"};		
	};
	class d3s_juke_15_5 {
		displayName = "Красный";
		texture[] = {"\d3s_juke_15\data\skins\JUKE_Red.paa"};		
	};
	class d3s_juke_15_6 {
		displayName = "Желтый";
		texture[] = {"\d3s_juke_15\data\skins\JUKE_Yellow.paa"};		
	};


	class d3s_SRmh_9500_cov_1 {
		displayName = "Синий";
		texture[] = {"\d3s_SRmh_9500\data\skins\base_blue_co.paa"};		
	};
	class d3s_SRmh_9500_cov_2 {
		displayName = "Потертый";
		texture[] = {"\d3s_SRmh_9500\data\skins\base_env_co.paa"};		
	};
	class d3s_SRmh_9500_cov_3 {
		displayName = "Зеленый";
		texture[] = {"\d3s_SRmh_9500\data\skins\base_green_co.paa"};		
	};
	class d3s_SRmh_9500_cov_4 {
		displayName = "Оранжевый";
		texture[] = {"\d3s_SRmh_9500\data\skins\base_orange_co.paa"};		
	};
	class d3s_SRmh_9500_cov_5 {
		displayName = "Ярко - оранжевый";
		texture[] = {"\d3s_SRmh_9500\data\skins\base_orange2_co.paa"};		
	}
	class d3s_SRmh_9500_cov_6 {
		displayName = "Белый";
		texture[] = {"\d3s_SRmh_9500\data\skins\base_white_co.paa"};		
	};

	class d3s_SRlonghorn_4520_cov_1 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_blue_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_2 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_green_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_3 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_lime_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_4 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_orange_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_5 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_orange2_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_6 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_red_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_7 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_sand_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_8 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_white_co.paa"};		
	};
	class d3s_SRlonghorn_4520_cov_9 {
		displayName = "Белый";
		texture[] = {"\d3s_SRlonghorn_4520\data\skins\base_white_co.paa"};		
	};


	class d3s_r8v10_19_1 {
		displayName = "Черный обсидиан";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Black_Obsidian.paa"};		
	};
	class d3s_r8v10_19_2 {
		displayName = "Кварцевое шампанское";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Champagne_Quartz.paa"};		
	};
	class d3s_r8v10_19_3 {
		displayName = "Голубой";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Hermosa_Blue.paa"};		
	};
	class d3s_r8v10_19_4 {
		displayName = "Черный минерал";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Mineral_Black.paa"};		
	};
	class d3s_r8v10_19_5 {
		displayName = "Миндальный мокко";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Mocha_Almond.paa"};		
	};
	class d3s_r8v10_19_6 {
		displayName = "Corsa RED";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Red_Corsa.paa"};		
	};
	class d3s_r8v10_19_7 {
		displayName = "Желтый";
		texture[] = {"\d3s_r8v10_19\data\skins\R8V10_Vegas_Yellow.paa"};		
	};


	class d3s_Q7_15_1 {
		displayName = "Черный обсидиан";
		texture[] = {"\d3s_Q7_15\data\skins\Q7_Black_Obsidian.paa"};		
	};
	class d3s_Q7_15_2 {
		displayName = "Кварцевое шампанское";
		texture[] = {"\d3s_Q7_15\data\skins\Q7_Champagne_Quartz.paa"};		
	};
	class d3s_Q7_15_3 {
		displayName = "Голубой";
		texture[] = {"\d3s_Q7_15\data\skins\Q7_Hermosa_Blue.paa"};		
	};
	class d3s_Q7_15_4 {
		displayName = "Черный минерал";
		texture[] = {"\d3s_Q7_15\data\skins\Q7_Mineral_Black.paa"};		
	};
	class d3s_Q7_15_5 {
		displayName = "Миндальный мокко";
		texture[] = {"\d3s_Q7_15\data\skins\Q7_Mocha_Almond.paa"};		
	};
	class d3s_Q7_15_6 {
		displayName = "red corsa";
		texture[] = {"\d3s_Q7_15\data\skins\Q7_Red_Corsa.paa"};		
	};


	class d3s_RS6_20_1 {
		displayName = "Черный обсидиан";
		texture[] = {"\d3s_RS6_20\data\skins\RS6_Black_Obsidian.paa"};		
	};
	class d3s_RS6_20_2 {
		displayName = "Кварцевое шампанское";
		texture[] = {"\d3s_RS6_20\data\skins\RS6_Champagne_Quartz.paa"};		
	};
	class d3s_RS6_20_3 {
		displayName = "Голубой";
		texture[] = {"\d3s_RS6_20\data\skins\RS6_Hermosa_Blue.paa"};		
	};
	class d3s_RS6_20_4 {
		displayName = "Миндальный мокко";
		texture[] = {"\d3s_RS6_20\data\skins\RS6_Mocha_Almond.paa"};		
	};
	class d3s_RS6_20_5 {
		displayName = "red corsa";
		texture[] = {"\d3s_RS6_20\data\skins\RS6_Red_Corsa.paa"};		
	};
	class d3s_RS6_20_6 {
		displayName = "Желтый";
		texture[] = {"\d3s_RS6_20\data\skins\RS6_Vegas_Yellow.paa"};		
	};


	class RS7_Black_Obsidian {
		displayName = "Черный обсидиан";
		texture[] = {"\d3s_RS7_13\data\skins\RS7_Black_Obsidian.paa"};		
	};
	class RS7_Champagne_Quartz {
		displayName = "Кварцевое шампанское";
		texture[] = {"\d3s_RS7_13\data\skins\RS7_Champagne_Quartz.paa"};		
	};
	class RS7_Hermosa_Blue {
		displayName = "Голубой";
		texture[] = {"\d3s_RS7_13\data\skins\RS7_Hermosa_Blue.paa"};		
	};
	class RS7_Mocha_Almond {
		displayName = "Миндальный мокко";
		texture[] = {"\d3s_RS7_13\data\skins\RS7_Mocha_Almond.paa"};		
	};
	class RS7_Red_Corsa {
		displayName = "red corsa";
		texture[] = {"\d3s_RS7_13\data\skins\RS7_Red_Corsa.paa"};		
	};
	
	
	class lievery_01_red {
		displayName = "red";
		texture[]=
		{
			"#(argb,8,8,3)color(0.592157,0.0156863,0.0156863,1.0,CO)",
			"#(argb,8,8,3)color(0.788235,0.45098,0.0784314,1.0,CO)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.243137,0.243137,0.243137,1.0,co)",
			"#(argb,8,8,3)color(0.592157,0.0156863,0.0156863,1.0,CO)",
			"#(argb,8,8,3)color(0.407843,0.0745098,0.0666667,1.0,CO)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};		
	};
	class lievery_02_white {
		displayName = "white";
		texture[]=
		{
			"#(argb,8,8,3)color(0.74902,0.74903,0.741177,1.0,CO)",
			"#(argb,8,8,3)color(0.105882,0.105882,0.105882,1.0,CO)",
			"#(argb,8,8,3)color(0.921569,0.580392,0.203922,1.0,CO)",
			"#(argb,8,8,3)color(0.752941,0.752941,0.752941,1.0,CO)",
			"#(argb,8,8,3)color(0.788236,0.45099,0.0784314,1.0,CO)",
			"#(argb,8,8,3)color(0.74902,0.74903,0.741177,1.0,CO)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};		
	};
	class paint_brown {
		displayName = "white";
		texture[]=
		{
			"#(argb,8,8,3)color(0.211765,0.172549,0.121569,1.0,CO)",
			"#(argb,8,8,3)color(0.14902,0.12549,0.101961,1.0,CO)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.211765,0.172549,0.121569,1.0,CO)",
			"#(argb,8,8,3)color(0.34902,0.235294,0.0745098,1.0,CO)",
			"#(argb,8,8,3)color(0.211765,0.172549,0.121569,1.0,CO)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};	
	};
	class paint_black {
		displayName = "black";
		texture[]=
		{
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.0862745,0.0862745,0.0862745,1.0,co)",
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};
	};
	class paint_white {
		displayName = "white";
		texture[]=
		{
			"#(argb,8,8,3)color(0.74902,0.74902,0.741176,1.0,CO)",
			"#(argb,8,8,3)color(0.0313726,0.0313726,0.0313726,1.0,CO)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.823529,0.819608,0.815686,1.0,CO)",
			"#(argb,8,8,3)color(0.823529,0.819608,0.815686,1.0,CO)",
			"#(argb,8,8,3)color(0.74902,0.74902,0.741176,1.0,CO)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};
	};
	class paint_beige
	{
		displayName="Paint Beige";
		texture[]=
		{
			"#(argb,8,8,3)color(0.501961,0.482353,0.423529,1.0,CO)",
			"#(argb,8,8,3)color(0.207843,0,0,1.0,co)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.109804,0.105882,0.0901961,1.0,CO)",
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"#(argb,8,8,3)color(0.529412,0.0862745,0.0862745,1.0,co)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};
	};
	class paint_gray
	{
		displayName="Paint Gray";
		texture[]=
		{
			"#(argb,8,8,3)color(0.12549,0.12549,0.12549,1.0,CO)",
			"#(argb,8,8,3)color(0.0941176,0.0901961,0.101961,1.0,CO)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.12549,0.12549,0.12549,1.0,CO)",
			"#(argb,8,8,3)color(0.184314,0.2,0.207843,1.0,CO)",
			"#(argb,8,8,3)color(0.12549,0.12549,0.12549,1.0,CO)",
			"#(argb,8,8,3)color(0,0,0,0.9,Co)"
		};
	};
	class paint_dark
	{
		displayName="Paint Dark";
		factions[]={};
		texture[]=
		{
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0,0,0,1.0,Co)"
		};
	};
	class paint_orange
	{
		displayName="Paint Orange";
		texture[]=
		{
			"#(argb,8,8,3)color(0.745098,0.419608,0.0627451,1.0,CO)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.745098,0.419608,0.0627451,1.0,CO)",
			"#(argb,8,8,3)color(0.745098,0.419608,0.0627451,1.0,CO)",
			"#(argb,8,8,3)color(0.745098,0.419608,0.0627451,1.0,CO)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};
	};
	class paint_green
	{
		displayName="Paint Green";
		texture[]=
		{
			"#(argb,8,8,3)color(0.027451,0.176471,0,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.176471,0,1.0,co)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.0705882,0.254902,0.054902,1.0,co)",
			"#(argb,8,8,3)color(0.0705882,0.254902,0.054902,1.0,co)",
			"#(argb,8,8,3)color(0.027451,0.176471,0,1.0,co)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};
	};
	class paint_red
	{
		displayName="Paint Red";
		texture[]=
		{
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"#(argb,8,8,3)color(0.027451,0.027451,0.027451,1.0,co)",
			"#(argb,8,8,3)color(0.152941,0.152941,0.152941,1.0,co)",
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"#(argb,8,8,3)color(0.258824,0,0.00784314,1.0,CO)",
			"\RimasRP\osk_MER_C63AMG_12\data\glasswindows.paa"
		};
	};
	class RRPVehicle_durango_Deadlock {
		displayName = "Damned Knights";
		texture[] = {"\Deadlock_pack\Data\DamnedKnights\RRPVehicle_durango_Deadlock.paa"};		
	};
	class RRPVehicle_Insurgent_Deadlock {
		displayName = "Damned Knights";
		texture[] = {"\Deadlock_pack\Data\DamnedKnights\RRPVehicle_Insurgent_Deadlock.paa"};		
	};
	class RRPVehicle_fpace_Deadlock {
		displayName = "Damned Knights";
		texture[] = {"\Deadlock_pack\Data\DamnedKnights\RRPVehicle_fpace_Deadlock.paa"};		
	};
	class RRPHelicopter_Deadlock_1 {
		displayName = "Damned Knights";
		texture[] = 
		{
			"\Deadlock_pack\Data\DamnedKnights\RRPHelicopter_Deadlock_1.paa",
			"\Deadlock_pack\Data\DamnedKnights\RRPHelicopter_Deadlock_1.paa"
		};		
	};
	class RRPVehicle_ifrit_Deadlock {
		displayName = "Damned Knights";
		texture[] = 
		{
			"\Deadlock_pack\Data\DamnedKnights\ifrit_DK_1.paa",
			"\Deadlock_pack\Data\DamnedKnights\ifrit_DK_2.paa"
		};		
	};
	class Deadlock_MAN {
		displayName = "Damned Knights";
		texture[] = 
		{
			"\Deadlock_pack\Data\DamnedKnights\DK_1.paa",
			"\Deadlock_pack\Data\DamnedKnights\DK_2.paa",
			"\Deadlock_pack\Data\DamnedKnights\DK_3.paa",
			"\Deadlock_pack\Data\DamnedKnights\DK_4.paa"
		};		
	};
	class RRPVehicle_tiger_76561199072206957 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\d3s_tiger_2975\data\skins\camo2.paa",
		};		
	};
	class RRPVehicle_tiger_76561198859526459 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\d3s_tiger_2975\data\skins\camo4.paa",
		};		
	};
	class RRPVehicle_tiger_76561198859526459_1 {
		displayName = "Камо 2";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561198859526459\tiger.paa",
		};		
	};
	class RRPVehicle_tiger_76561199003868334 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\d3s_tiger_2975\data\skins\camo3.paa",
		};		
	};
	class RRPVehicle_tiger_76561199003868334_1 {
		displayName = "Камо 2";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561199003868334\RRPVehicle_tiger_76561199003868334.paa",
		};		
	};
	class RRPVehicle_tiger_76561199113587031 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\d3s_tiger_2975\data\skins\camo4.paa",
		};		
	};
	class RRPVehicle_HURON_76561198109707602 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561198109707602\RRPVehicle_HURON_2.paa",
			"\RRP_vehicles\Data\prem\76561198109707602\RRPVehicle_HURON_1.paa"
		};		
	};
	class RRPVehicle_C63AMG_76561198802169420 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561198802169420\RRPVehicle_C63AMG_76561198802169420.paa"
		};		
	};
	class RRPVehicle_LM002_76561197989379888_cop {
		displayName = "COP";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561197989379888\RRPVehicle_LM002_76561197989379888_cop.paa"
		};		
	};
	class RRPVehicle_tiger_76561199189042038_1 {
		displayName = "1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561199189042038\RRPVehicle_tiger_76561199189042038_1.paa"
		};		
	};
	class RRPVehicle_tiger_76561199189042038_2 {
		displayName = "2";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561199189042038\RRPVehicle_tiger_76561199189042038_2.paa"
		};		
	};
	class RRPVehicle_370ZNismo_76561198157300994_1 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\RRPVehicle_370ZNismo_76561198157300994.paa"
		};		
	};
	class RRPVehicle_370ZNismo_76561198157300994_2 {
		displayName = "Камо 2";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\RRPVehicle_370ZNismo_76561198157300994_2.paa"
		};		
	};
	class RRPVehicle_LM002_Sopranos {
		displayName = "Камо коп";
		texture[] = 
		{
			"\welmen_battle_veh\data\RRPVehicle_LM002_Sopranos.paa"
		};		
	};
	class RRPVehicle_HURON_76561198984360169 {
		displayName = "Камо";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\RRPVehicle_HURON_76561198984360169_1.paa",
			"\RRP_vehicles\Data\prem\RRPVehicle_HURON_76561198984360169_2.paa"
		};		
	};
	class RRPVehicle_HURON_76561198948262502_2 {
		displayName = "Камо";
		texture[] = 
		{
			"\RRPVehicle_miners_pack\Data\Serjik_Makeev_Huron_Front1.paa",
			"\RRPVehicle_miners_pack\Data\Serjik_Makeev_Huron_Rear2.paa"
		};		
	};
	class RRPVehicle_HURON_76561198351236835 {
		displayName = "Камо";
		texture[] = 
		{
			"\RRP_vehicles_01\Data\76561198040706481\RRPVehicle_HURON_76561198351236835_1.paa",
			"\RRP_vehicles_01\Data\76561198040706481\RRPVehicle_HURON_76561198351236835_2.paa"
		};		
	};
	class RRPVehicle_HURON_76561198948262502 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles_01\Data\76561198948262502\RRPVehicle_HURON_76561198948262502_1.paa",
			"\RRP_vehicles_01\Data\76561198948262502\RRPVehicle_HURON_76561198948262502_2.paa"
		};		
	};
	class RRPVehicle_med_F93HAMMAN {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles_01\Data\76561198802169420\RRPVehicle_med_F93HAMMAN.paa",
			"d3s_cars_core\data\black",
			"d3s_cars_core\data\black",
			"\RRP_vehicles_01\Data\76561198802169420\RRPVehicle_med_F93HAMMAN.paa"
		};		
	};
	class d3s_zil_131_5 {
		displayName = "Ремонтник";
		texture[] = 
		{
			"\RRP_structures\Data\textures\131_REM_1.paa",
			"\RRP_structures\Data\textures\131_REM_2.paa"
		};		
	};
	class Bell_H13_heli_med {
		displayName = "Мед";
		texture[] = 
		{
			"RRP_structures\Data\textures\EMS\Bell_H13_heli_med_1.paa",
			"RRP_structures\Data\textures\EMS\Bell_H13_heli_med_2.paa"
		};		
	};
	class RRPVehicle_bat_76561198802169420 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561198802169420\RRPVehicle_bat_76561198802169420.paa"
		};		
	};
	class RRPVehicle_dubsta2_76561198802169420_1 {
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561198802169420\RRPVehicle_dubsta2_76561198802169420_1.paa"
		};		
	};
	class RRPVehicle_dubsta2_76561198802169420_2 {
		displayName = "Камо 2";
		texture[] = 
		{
			"\RRPVehicle_ems_pack\data\RRPVehicle_med_dubsta4x4.paa"
		};		
	};
	class RRPVehicle_911gt3rs_76561198130879772_1 
	{
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRP_vehicles\Data\prem\76561198802169420\RRPVehicle_911gt3rs_76561198130879772_1.paa"
		};		
	};
	class EMS_Paragon_1 
	{
		displayName = "Камо 2";
		texture[] = 
		{
			"RRP_structures\Data\textures\EMS\EMS_Paragon_1.paa"
		};		
	};
	class kuruma_phoenix_1 
	{
		displayName = "Камо 1";
		texture[] = 
		{
			"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)",
			"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)",
			"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)",
			"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"
		};		
	};
	class Anvil_buran_1 
	{
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRPVehicle_anvil_pack\data\RRP_RZ_Buran_1.paa"
		};		
	};
	class Anvil_buran_2 
	{
		displayName = "Камо 2";
		texture[] = 
		{
			"\RRPVehicle_anvil_pack\data\RRP_RZ_Buran_2.paa"
		};		
	};
	class Anvil_buran_3 
	{
		displayName = "Камо 3";
		texture[] = 
		{
			"\RRPVehicle_anvil_pack\data\RRP_RZ_Buran_3.paa"
		};		
	};
	class Anvil_BTR_1 
	{
		displayName = "Камо 1";
		texture[] = 
		{
			"\RRPVehicle_anvil_pack\data\BTR.paa"
		};		
	};
	class auction8_RRPVehicle_f90offroad_A8 
	{
		displayName = "A8";
		texture[] = 
		{
			"\RRP_vehicles_01\Data\76561198389812812\RRPVehicle_f90lyk_76561198389812812.paa"
		};		
	};
	class RRPVehicle_ems_vanz 
	{
		displayName = "Med";
		texture[] = 
		{
			"\RRPVehicle_ems_pack\data\RRPVehicle_ems_vanz.paa",
			"\a3\soft_f_orange\van_02\data\van_wheel_co.paa",
			"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa",
			"\RRPVehicle_ems_pack\data\RRPVehicle_ems_vanz.paa"
		};		
	};
	class RRPVehicle_DamnedKnights_cruiser200_1 
	{
		displayName = "1";
		texture[] = 
		{
			"\ver_cru_200\data\colors\black.paa",
			"\ver_data\data\glass_toner.paa",
			"d3s_cars_core\data\glass_black.paa"
		};		
	};
	class RRPVehicle_DamnedKnights_cruiser200_2 
	{
		displayName = "2";
		texture[] = 
		{
			"\RRPVehicle_DamnedKnights_pack\Data\RRPVehicle_DamnedKnights_cruiser200_1.paa",
			"\ver_data\data\glass_toner.paa",
			"d3s_cars_core\data\glass_black.paa"
		};		
	};
	class RRPVehicle_DamnedKnights_cruiser200_3 
	{
		displayName = "3";
		texture[] = 
		{
			"\RRPVehicle_DamnedKnights_pack\Data\RRPVehicle_DamnedKnights_cruiser200_2.paa",
			"\ver_data\data\glass_toner.paa",
			"d3s_cars_core\data\glass_black.paa"
		};		
	};
	class RRPVehicle_DamnedKnights_kuruma_1 
	{
		displayName = "1";
		texture[] = 
		{
			"\Deadlock_pack\data\DamnedKnights\RRPVehicle_Deadlock_kuruma.paa",
			"d3s_kuruma_gtaV\data\vehicle_generic_tyrewallblack.paa",
			"d3s_cars_core\data\glass_black.paa",
			"\Deadlock_pack\data\DamnedKnights\RRPVehicle_Deadlock_kuruma.paa",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""
		};		
	};
	class RRPVehicle_DamnedKnights_kuruma_2
	{
		displayName = "2";
		texture[] = 
		{
			"\RRPVehicle_DamnedKnights_pack\data\RRPVehicle_DamnedKnights_kuruma.paa",
			"d3s_kuruma_gtaV\data\vehicle_generic_tyrewallblack.paa",
			"d3s_cars_core\data\glass_black.paa",
			"\RRPVehicle_DamnedKnights_pack\data\RRPVehicle_DamnedKnights_kuruma.paa",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""
		};		
	};
	class RRPVehicle_JAMES_1
	{
		displayName = "1";
		texture[] = 
		{
			"\RRP_vehicles_01\Data\mustang_76561198150220371.paa",
			"\ver_mustang18\data\disk.paa",
			"\ver_data\data\glass_toner.paa"
		};		
	};
	class sab_an2_air
	{
		displayName = "Air Tak";
		texture[] = 
		{
			"sab_An2\data\an2_1_b_co.paa",
			"sab_An2\data\an2_2_b_co.paa",
			"sab_An2\data\an2_wings_b_co.paa"
		};		
	};
	class sab_an2_aero
	{
		displayName = "Aeroflot";
		texture[] = 
		{
			"sab_An2\data\an2_1_a_co.paa",
			"sab_An2\data\an2_2_a_co.paa",
			"sab_An2\data\an2_wings_a_co.paa"
		};		
	};
	class sab_an2_isl
	{
		displayName = "Island Hoppers";
		texture[] = 
		{
			"sab_An2\paint\seaan2_1.paa",
			"sab_An2\paint\seaan2_2.paa",
			"sab_An2\paint\seaan2_wings.paa"
		};		
	};
	class sab_an2_anast
	{
		displayName = "Anastasija";
		texture[] = 
		{
			"sab_An2\paint\sab_aj_an2_1.paa",
			"sab_An2\paint\sab_aj_an2_2.paa",
			"sab_An2\paint\sab_aj_an2_3.paa"
		};		
	};
	class sab_an2_fire
	{
		displayName = "Fire Department";
		texture[] = 
		{
			"sab_An2\paint\fdan2_1.paa",
			"sab_An2\paint\fdan2_2.paa",
			"sab_An2\paint\fdan2_wings.paa"
		};		
	};
	class sab_an2_cz
	{
		displayName = "CZ Aero";
		texture[] = 
		{
			"sab_An2\paint\czan2_1.paa",
			"sab_An2\paint\czan2_2.paa",
			"sab_An2\paint\czan2_wings.paa"
		};		
	};
	class sab_an2_Vintage
	{
		displayName = "Vintage";
		texture[] = 
		{
			"sab_An2\paint\arma3_an2_1.paa",
					"sab_An2\paint\arma3_an2_2.paa",
					"sab_An2\paint\arma3_an2_wings.paa"
		};		
	};
};