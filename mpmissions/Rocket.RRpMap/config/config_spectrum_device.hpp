class spectrumDeviceCfg {
   viewingangle = 45;
   class antenna {
      class muzzle_antenna_01_f {
        maxRange = 1500;
        xMin = 10;
        xMax = 99;

        yMin = 0;
        yMax = 100;
      };
      class muzzle_antenna_02_f {
        maxRange = 1500;
        xMin = 100;
        xMax = 499;

        yMin = 0;
        yMax = 100;
      };
      class muzzle_antenna_03_f {
        maxRange = 1500;
        xMin = 500;
        xMax = 999;

        yMin = 0;
        yMax = 100;
      };
   };

	class frequencyEmitterObjects {
	//med
	class d3s_fpace_17_EMS {
		frequency = 288;
	}; 
	class d3s_fseries_17_EMS_v2:d3s_fpace_17_EMS {};
	class d3s_charger_15_EMS:d3s_fpace_17_EMS {};
	class dd3s_charger_15_EMS_v2:d3s_fpace_17_EMS {};
	class d3s_explorer_EMS_13:d3s_fpace_17_EMS {};
	class d3s_raptor_EMS_17:d3s_fpace_17_EMS {};
	class d3s_raptor_EMS_17_v2:d3s_fpace_17_EMS {};
	class d3s_uaz_3165M_EMS:d3s_fpace_17_EMS {};
	class d3s_vklasse_17_EMS:d3s_fpace_17_EMS {};
	class d3s_vklasse_17_EMS_v2:d3s_fpace_17_EMS {};
	class d3s_s650_18:d3s_fpace_17_EMS {};
	class RRPVehicle_insurgent_EMS:d3s_fpace_17_EMS {};
	class d3s_malibu_18_COP:d3s_fpace_17_EMS {};
	class d3s_svr_17_EMS:d3s_fpace_17_EMS {};
	class d3s_camry_18_EMS:d3s_fpace_17_EMS {};
	class d3s_f90_18_med:d3s_fpace_17_EMS {};
	class d3s_actros_14_EMS:d3s_fpace_17_EMS {};
	class I_MRAP_03_F:d3s_fpace_17_EMS {};
	class d3s_durango_18_EMS:d3s_fpace_17_EMS {};
	class d3s_tahoe_EMS:d3s_fpace_17_EMS {};
	//arm
	
	class RRPVehicle_Tanker_w_A4{
		frequency = 50;
	};
	class RRPVehicle_Tanketka_A4:RRPVehicle_Tanker_w_A4 {};
	class RRPVehicle_Marid2_A3:RRPVehicle_Tanker_w_A4 {};
	class RRPVehicle_Marid1_A3:RRPVehicle_Tanker_w_A4 {};
	class RRPVehicle_BOBA01_A3:RRPVehicle_Tanker_w_A4 {};
	class RRPVehicle_Tanketka_A3:RRPVehicle_Tanker_w_A4 {};
	class RRP_Marid2_a2:RRPVehicle_Tanker_w_A4 {};
	class RRPVehicle_Marshal_A3:RRPVehicle_Tanker_w_A4 {};
	class RRP_Marid1_a2:RRPVehicle_Tanker_w_A4 {};
	class RRP_Tanker_w_a2:RRPVehicle_Tanker_w_A4 {};
	
	class RRPVehicle_BTR90_A3 {
		frequency = 105;
	};
	class RRPVehicle_BTR90_BlackSnow:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_Pirates:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_Soprano:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_CostraNostra:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_IMPERIUM:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_Phoenix:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_Sector7:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_Cigane:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_Deadlock:RRPVehicle_BTR90_A3 {};
	class RRPVehicle_BTR90_MS13:RRPVehicle_BTR90_A3 {};
	class BTR90:RRPVehicle_BTR90_A3 {};
	
	class RRPVehicle_Karen_A3 {
		frequency = 150;
	};
	class RRPVehicle_LSVAT_A4:RRPVehicle_Karen_A3 {};
	class RRPVehicle_OffroadPT_A4:RRPVehicle_Karen_A3 {};
	class RRPVehicle_Ultrainsurgent_A4:RRPVehicle_Karen_A3 {};
	class LRm2_A1:RRPVehicle_Karen_A3 {};
	class UAZm2_A1:RRPVehicle_Karen_A3 {};
	class Qilin_A1:RRPVehicle_Karen_A3 {};
	class RRPVehicle_Qilin_PD:RRPVehicle_Karen_A3 {};
	class RRP_Marid_PD_Armered:RRPVehicle_Karen_A3 {};
	class RRP_Marid_PD_Armered_1:RRPVehicle_Karen_A3 {};
	class cop_marsh:RRPVehicle_Karen_A3 {};
	
	class cop_gh{
		frequency = 180;
	};
	class cop_helli:cop_gh {};
	class RRPHelicopter_Vladika_A4:cop_gh {};
	class RRPHelicopter_Dragonfly_A4:cop_gh {};
	class RRPHelicopter_Dodj_A4:cop_gh {};
	class RRPVehicle_Dragonfly_A3:cop_gh {};
	class RRPHelicopter_AS565_A3:cop_gh {};
	class RRPBoat_Karas_A3:cop_gh {};
	class RRPVehicle_Armed_Boat_PD:cop_gh {};
	class RRP_Dodj_a2:cop_gh {};
	class AS_565_A1:cop_gh {};
	class An2_A1:cop_gh {};
	
   }
};
