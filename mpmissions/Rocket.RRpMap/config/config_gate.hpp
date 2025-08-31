class cfg_gates {

    class R_Sector_Gate_01 {
        conditionForOpen = "license_sector";
        objectSound[] = {"R_Say3D_Sector_01","R_Say3D_Sector_02"};
    };

	class R_Escobaro_Gate_01 {
        conditionForOpen = "license_escobaro";
        objectSound[] = {"R_Say3D_Escobaro_01","R_Say3D_Escobaro_02"};
    };

	class RRP_Sumiyoshi_Gate_01 {
        conditionForOpen = "license_sumiyoshi";
        objectSound[] = {"RRP_Say3D_Sumiyoshi_01","RRP_Say3D_Sumiyoshi_02"};
    };

	class rimas_gate_front{
		conditionForOpen = "license_rimas";
		objectSound[] = {"say3d_rimas_1","say3d_rimas"};
	};
	class rimas_gate_front_1 {
		conditionForOpen = "license_rimas";
		objectSound[] = {"say3d_rimas_1","say3d_rimas"};
	};
	class rimas_gate_back {
		conditionForOpen = "license_rimas";
		objectSound[] = {"say3d_rimas_1","say3d_rimas"};
	};
	class Gov_Gate_1 {
		conditionForOpen = "life_gov || license_admittance_goverment || (call life_adminlevel) > 3";
		objectSound[] = {"say3d_gov"};
	};
	class Gov_Gate_2 {
		conditionForOpen = "life_gov || license_admittance_goverment || (call life_adminlevel) > 3";
		objectSound[] = {"say3d_gov"};
	};
	class Gov_Gate_3 {
		conditionForOpen = "life_gov || license_admittance_goverment || (call life_adminlevel) > 3";
		objectSound[] = {"say3d_gov"};
	};
	class deadlockGates{
		conditionForOpen = "license_dl";
		objectSound[] = {"say3d_deadlock","say3d_deadlock_1","say3d_deadlock_2"};
	};
	class cwrkaGates{
		conditionForOpen = "license_cwrka";
		objectSound[] = {"say3d_cwrka","say3d_cwrka_1"};
	};
	class piratesGates_1 {
		conditionForOpen = "license_escobaro";
		objectSound[] = {"say3d_pirates","say3d_pirates_1"};
	};
	class piratesGates_2 {
		conditionForOpen = "license_escobaro";
		objectSound[] = {"say3d_pirates","say3d_pirates_1"};
	};
	class piratesGates_3 {
		conditionForOpen = "license_escobaro";
		objectSound[] = {"say3d_pirates","say3d_pirates_1"};
	};
	class sopranosGates{
		conditionForOpen = "license_alpha";
		objectSound[] = {"say3d_sopranos","say3d_sopranos_1"};
	};
	class sopranosGates_1{
		conditionForOpen = "license_alpha";
		objectSound[] = {"say3d_sopranos","say3d_sopranos_1"};
	};
	class sopranosGates_2{
		conditionForOpen = "license_alpha";
		objectSound[] = {"say3d_sopranos","say3d_sopranos_1"};
	};
	class sopranosGates_3{
		conditionForOpen = "license_alpha";
		objectSound[] = {"say3d_sopranos","say3d_sopranos_1"};
	};
	class phoenixGates_1{
		conditionForOpen = "license_phoenix";
		objectSound[] = {"say3d_phoenix_1","say3d_phoenix_2","say3d_phoenix_3"};
	};
	class phoenixGates_2 {
		conditionForOpen = "license_phoenix";
		objectSound[] = {"say3d_phoenix_1","say3d_phoenix_2","say3d_phoenix_3"};
	};
	class phoenixGates_3 {
		conditionForOpen = "license_phoenix";
		objectSound[] = {"say3d_phoenix_1","say3d_phoenix_2","say3d_phoenix_3"};
	};
	class phoenixGates_3_1 {
		conditionForOpen = "license_phoenix";
		objectSound[] = {"say3d_phoenix_1","say3d_phoenix_2","say3d_phoenix_3"};
	};
	class phoenixGates_3_2 {
		conditionForOpen = "license_phoenix";
		objectSound[] = {"say3d_phoenix_1","say3d_phoenix_2","say3d_phoenix_3"};
	};
	class outcast_gate_1 {
		conditionForOpen = "license_outcast";
		objectSound[] = {"say3d_outcast"};
	};
	class outcast_gate_2: outcast_gate_1 {};
	class outcast_gate_3: outcast_gate_1 {};
	class outcast_gate_4: outcast_gate_1 {};
	class outcast_gate_5: outcast_gate_1 {};
	class outcast_gate_6: outcast_gate_1 {};
	class bloodsGates{
		conditionForOpen = "license_bears";
		objectSound[] = {"say3d_bloods","say3d_bloods_1"};
	};
	class kasatkyGates{
		conditionForOpen = "license_kasatky";
		objectSound[] = {"say3d_kasatky","say3d_kasatky_1","say3d_kasatky_2"};
	};
	class sectorsGates{
		conditionForOpen = "license_sector";
		objectSound[] = {"say3d_sectors","say3d_sectors_1"};
	};
	class copGate {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0) OR (('med' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3d_police","say3d_police_1"};
	}
	class copGate_KPP_11 : copGate{};
	class copGate_KPP_12 : copGate{};
	class copGate_KPP_21 : copGate{};
	class copGate_KPP_22 : copGate{};
	class copGate_KPP_31 : copGate{};
	class copGate_KPP_32 : copGate{};
	class copGate_PD : copGate{};
	class copGate_Pyrgos : copGate{};

	class copGate_FBI {
		conditionForOpen = "('cop' call RRPClient_groups_getSideLevel) > 15";
		objectSound[] = {"say3d_police_FBI"};
	};
	class mi_6_gate {
		conditionForOpen = "('cop' call RRPClient_groups_getSideLevel) > 7";
		objectSound[] = {"say3d_police_FBI"};
	};
	class medGate {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0) OR (('med' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3d_medics"};
	};
	class medGate_1 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0) OR (('med' call RRPClient_groups_getSideLevel) > 0) OR license_taxi";
		objectSound[] = {"say3d_medics"};
	};
	class SharkGate_1 {
		conditionForOpen = "license_shark";
		objectSound[] = {"say3d_Shark_1","say3d_Shark_2"};
	};
	class SharkGate_2: SharkGate_1 {};
	class SharkGate_3: SharkGate_1 {};
	class SharkGate_4: SharkGate_1 {};
	class ciganeGate {
		conditionForOpen = "license_cigane";
		objectSound[] = {"say3d_cigane_1","say3d_cigane_2"};
	};
	class WolvesGate_1 {
		conditionForOpen = "license_Wolves";
		objectSound[] = {"say3d_wolves_1","say3d_wolves_2"};
	};
	class NarcosGate_1 {
		conditionForOpen = "license_narcos";
		objectSound[] = {"say3d_narcos"};
	};
	class NarcosGate_2 {
		conditionForOpen = "license_narcos";
		objectSound[] = {"say3d_narcos"};
	};
	class NarcosGate_3 {
		conditionForOpen = "license_narcos";
		objectSound[] = {"say3d_narcos"};
	};
	class copGate_PD_2 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0) OR (('med' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3d_COP"};
	};
	class copGate_PD_3 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0) OR (('med' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3d_COP"};
	};
	class copGate_PD_1: copGate_PD_2 {};
	class PsychokidsGate_1 {
		conditionForOpen = "license_psychokids";
		objectSound[] = {"say3d_Psychokids_1"};
	};
	class PsychokidsGate_2: PsychokidsGate_1 {};
	class PsychokidsGate_3: PsychokidsGate_1 {};
	class PsychokidsGate_4: PsychokidsGate_1 {};
	class PsychokidsGate_5: PsychokidsGate_1 {};
	class PDGate_1 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 10) OR (('med' call RRPClient_groups_getSideLevel) > 10)";
		objectSound[] = {"say3d_SWAT"};
	}
	class PDGate_2 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 10) OR (('med' call RRPClient_groups_getSideLevel) > 10)";
		objectSound[] = {"say3d_SWAT"};
	}
	class PDGate_3 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 10) OR (('med' call RRPClient_groups_getSideLevel) > 10)";
		objectSound[] = {"say3d_SWAT"};
	}
	class PDGate_4 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 10) OR (('med' call RRPClient_groups_getSideLevel) > 10)";
		objectSound[] = {"say3d_SWAT"};
	}
	class PDGate_5 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 10) OR (('med' call RRPClient_groups_getSideLevel) > 10)";
		objectSound[] = {"say3d_SWAT"};
	}
	class PDGate_6 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 10) OR (('med' call RRPClient_groups_getSideLevel) > 10)";
		objectSound[] = {"say3d_SWAT"};
	}
	class kifoGate_1 {
		conditionForOpen = "license_kifo";
		objectSound[] = {"say3d_kifo"};
	}
	class JailGate_1 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_2 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_3 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_4 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_5 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_6 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_7 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_8 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	class JailGate_9 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {"say3_guber","say3d_prison_2"};
	};
	
	class SevenNews_Gate_1 {
		conditionForOpen = "license_press";
	};
	
	class pilotGates_1 {
		conditionForOpen = "license_flightschool_grp_1 || license_flightschool_grp_3 || (getPlayerUID player) in ['76561198322725899']";
		objectSound[] = {"say3d_pilot"};
	};
	class pilotGates_2: pilotGates_1 {};
	class pilotGates_3: pilotGates_1 {};
	class pilotGates_4: pilotGates_1 {};
	class pilotGates_5: pilotGates_1 {};
	class pilotGates_6: pilotGates_1 {};
	class pilotGates_7: pilotGates_1 {};
	class pilotGates_8: pilotGates_1 {};
	class pilotGates_9: pilotGates_1 {};
	class pilotGates_10: pilotGates_1 {};
	
	class medGate_blacksnow_1{
		conditionForOpen = "license_blacksnow";
		objectSound[] = {"say3d_bs","say3d_bs_1"};
	};
	class medGate_blacksnow_2{
		conditionForOpen = "license_blacksnow";
		objectSound[] = {"say3d_bs","say3d_bs_1"};
	};
	class medGate_cigane_1{
		conditionForOpen = "license_cigane";
		objectSound[] = {"say3d_cigane","say3d_cigane_1"};
	};
	class medGate_inagawakai_1{
		conditionForOpen = "license_inagawakai";
		objectSound[] = {"say3d_inagawakai","say3d_inagawakai_1"};
	};
	class medGate_blackwolves_1{
		conditionForOpen = "license_blackwolves";
		objectSound[] = {"say3d_blackwolves_1","say3d_blackwolves_2"};
	};
	class medGate_lacosanostra_1{
		conditionForOpen = "license_lacosanostra";
		objectSound[] = {"say3d_lacosanostra_1","say3d_lacosanostra_2"};
	};
	class fedGate_1 {
		conditionForOpen = "(('cop' call RRPClient_groups_getSideLevel) > 0)";
		objectSound[] = {""};
	};
	class fedGate_2: fedGate_1 {};
};

class cfg_genaratos {

	class R_Sector_Gen_01 {
        conditionForBreak = "true";
        conditionForBreakMSG = "";
        objectSound[] = {"R_Say3D_Sector_01","R_Say3D_Sector_02"};
        breakingObject[] = {"R_Sector_Gate_01"};
    };

	class R_Escobaro_Gen_01 {
        conditionForBreak = "true";
        conditionForBreakMSG = "";
        objectSound[] = {"R_Say3D_Escobaro_01","R_Say3D_Escobaro_02"};
        breakingObject[] = {"R_Escobaro_Gate_01"};
    };

	class RRP_Sumiyoshi_Gen_01 {
        conditionForBreak = "true";
        conditionForBreakMSG = "";
        objectSound[] = {"RRP_Say3D_Sumiyoshi_01","RRP_Say3D_Sumiyoshi_02"};
        breakingObject[] = {"RRP_Sumiyoshi_Gate_01"};
    };

	class gen_lacosanostra_1 {
		conditionForBreak = "true";
		conditionForBreakMSG = "";
		objectSound[] = {"say3d_lacosanostra_1","say3d_lacosanostra_2"};
		breakingObject[] = {"medGate_lacosanostra_1"};

	};
	class gen_blackwolves_1 {
		conditionForBreak = "true";
		conditionForBreakMSG = "";
		objectSound[] = {"say3d_blackwolves_1","say3d_blackwolves_2"};
		breakingObject[] = {"medGate_blackwolves_1"};

	};
	class gen_inagawakai {
		conditionForBreak = "true";
		conditionForBreakMSG = "";
		objectSound[] = {"say3d_inagawakai","say3d_inagawakai_1"};
		breakingObject[] = {"medGate_inagawakai_1"};

	};
	class gen_cigane {
		conditionForBreak = "true";
		conditionForBreakMSG = "";
		objectSound[] = {"say3d_cigane","say3d_cigane_1"};
		breakingObject[] = {"medGate_cigane_1"};

	};
	class gen_jail_1 {
		objectSound[] = {"say3_guber","say3d_prison_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {"JailGate_7"};
	};
	class gen_jail_2 {
		objectSound[] = {"say3_guber","say3d_prison_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {"JailGate_5"};
	};
	class gen_jail_3 {
		objectSound[] = {"say3_guber","say3d_prison_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {"JailGate_6"};
	};
	class gen_jail_4 {
		objectSound[] = {"say3_guber","say3d_prison_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {"JailGate_3"};
	};
	class gen_jail_5 {
		objectSound[] = {"say3_guber","say3d_prison_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {"JailGate_8","JailGate_9"};
	};
	class gen_jail_6 {
		objectSound[] = {"say3_guber","say3d_prison_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {"JailGate_8","JailGate_9"};
	};
	class gen_guber {
		objectSound[] = {"say3_guber","say3_guber_1","say3_guber_2"};
		conditionForBreak = "";
		conditionForBreakMSG = "";
		breakingObject[] = {};
	};
	class gen_blacksnow {
		conditionForBreak = "true";
		conditionForBreakMSG = "";
		objectSound[] = {"say3d_bs","say3d_bs_1","say3d_bs_2"};
		breakingObject[] = {"medGate_blacksnow_1"};

	};
	class gen_kasatky {
		conditionForBreak = "true";
		conditionForBreakMSG = "";
		objectSound[] = {"say3d_kasatky","say3d_kasatky_1","say3d_kasatky_2"};
		breakingObject[] = {"kasatkyGates"};
	};
	class gen_fed {
		conditionForBreak = "(missionNamespace getVariable ['RRPPublicRaidStatus', 'null']) isEqualTo 'waiting'";
		conditionForBreakMSG = "";
		objectSound[] = {""};
		breakingObject[] = {"fedGate_1", "fedGate_2"};
	};
};
