class CfgPatches
{
	class RRPHC_Mutants
	{
		units[]={};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"RRPHC",
			"rimas_agent"
		};
	};
};

class CfgFunctions
{
	class RRPHC_Mutants
	{
		class core
		{
			file="\RRPHC_Mutants\bootstrap";
			class preInit
			{
				preInit=1;
			};
            class postInit
            {
                postInit=1;
            };
		};
	};
};

/*
	case "BS_Ex_Mutant_01" : {fss_mut_initBloodsucker};
	case "boar_old_testu" : {fss_mut_initBoar};
	case "Chimera_Fatum" : {fss_mut_initChimera};
	case "Controller_Ex_Mutant_01" : {fss_mut_initController};
	case "Flesh_Ex_Mutant_01" : {fss_mut_initFlesh};
	case "Snork_Ex_Mutant_01" : {fss_mut_initSnork};
	case "Zombie_Ex_Mutant_01" : {fss_mut_initZombie};
	case "Pseudo_Fatum" : {fss_mut_initGiant};sssssss
	case "Burer_Fatum" : {fss_mut_initBurer};
*/

class ZombieAbstract{MutantClass = "Zombie_Ex_Mutant_01"; Amount = 16; Cooldown = 0; Radius = 200; isFixedPos = 0; Position[] = {}; FixedPos[] = {};};
class SnorkAbstract {MutantClass = "Snork_Ex_Mutant_01"; Amount = 2; Cooldown = 0; Radius = 200; isFixedPos = 0; Position[] = {2754.746,6871.082,0}; FixedPos[] = {};};
class ChimeraAbstract {MutantClass = "Chimera_RIMAS"; Amount = 1; Cooldown = 1200; Radius = 225; isFixedPos = 0; Position[] = {4592.38,9807.88,0}; FixedPos[] = {};};
class GiantAbstract {MutantClass =  "Pseudo_RIMAS"; Amount = 1; Cooldown = 1200; Radius = 225; isFixedPos = 0; Position[] = {4959.71,6358.55,0}; FixedPos[] = {};};
class BurerAbstract {MutantClass =  "Burer_RIMAS"; Amount = 1; Cooldown = 1200; Radius = 225; isFixedPos = 0; Position[] = {7023.34,2270.52,0}; FixedPos[] = {};};
class BloodsuckerAbstract {MutantClass = "BS_Ex_Mutant_01"; Amount = 1; Cooldown = 1200; Radius = 225; isFixedPos = 0; Position[] = {5622.67,10331,0}; FixedPos[] = {};};
class ControllerAbstract {MutantClass = "Controller_Ex_Mutant_01"; Amount = 1; Cooldown = 1200; Radius = 225; isFixedPos = 0; Position[] = {5720.28,8640.95,0}; FixedPos[] = {};};

class ZombieFighterAbstract {MutantClass = "Controller_Ex_Mutant_01"; Amount = 1; Cooldown = 1200; Radius = 225; isFixedPos = 0; Position[] = {5720.28,8640.95,0}; FixedPos[] = {};};

class CfgMutSpawnPos
{
    //class Burer1_1: BurerAbstract { amount = 2; Cooldown = 480; Radius = 100; Position[] = {3326.02,3000.27,0}; };
 
 
    class zombie1_1: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 75; Position[] = {7318.82,6277.77,0}; };
    class zombie1_2: ZombieAbstract { amount = 5; Cooldown = 480; Radius = 75; Position[] = {7266.74,6132.63,0}; };
    class zombie1_3: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {7069.06,5969.48,-0.857156}; };
    class zombie1_4: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {6951.1,5774.45,0}; };
    class zombie1_5: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 75; Position[] = {6723.88,5568.31,0}; };
    class zombie1_6: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 75; Position[] = {6702.68,5414.23,0}; };
    class zombie1_7: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 150; Position[] = {6421.02,5406.89,4.76837e-007}; };
    class zombie1_8: ZombieAbstract { amount = 6; Cooldown = 480; Radius = 200; Position[] = {6038.43,5611.42,0.146544}; };
    class zombie1_9: ZombieAbstract { amount = 5; Cooldown = 480; Radius = 300; Position[] = {2095.71,5614.29,0}; };//аэро
    class zombie1_10: ZombieAbstract { amount = 6; Cooldown = 480; Radius = 200; Position[] = {3299.18,5777.57,-4.76837e-007}; };
    class zombie1_11: ZombieAbstract { amount = 5; Cooldown = 480; Radius = 200; Position[] = {2959.82,6030.14,0}; };
    class zombie1_12: ZombieAbstract { amount = 8; Cooldown = 480; Radius = 200; Position[] = {5009.15,5906.49,0}; };//верхвоенка
    class zombie1_13: ZombieAbstract { amount = 6; Cooldown = 480; Radius = 75; Position[] = {5221.27,5004.25,0}; };//военкановая
    class zombie1_14: ZombieAbstract { amount = 5; Cooldown = 480; Radius = 200; Position[] = {3316.06,2981.03,0}; };//марксвелл
    class zombie1_15: ZombieAbstract { amount = 5; Cooldown = 480; Radius = 150; Position[] = {2796.28,3389.04,-1.52588e-005}; };//точкаотсчета
    class zombie1_16: ZombieAbstract { amount = 2; Cooldown = 480; Radius = 75; Position[] = {3509.67,4924.82,1.52588e-005}; };
    class zombie1_17: ZombieAbstract { amount = 6; Cooldown = 480; Radius = 100; Position[] = {4333.75,3885.62,0}; };//майк1
    class zombie1_18: ZombieAbstract { amount = 6; Cooldown = 480; Radius = 100; Position[] = {4366.17,3729.63,0}; };//майк2
    class zombie1_19: ZombieAbstract { amount = 5; Cooldown = 480; Radius = 100; Position[] = {5022.37,5404.04,1.52588e-005}; };
    class zombie1_20: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {3081.51,2141.71,0}; };
    class zombie1_21: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {2022.83,2733.17,0}; };
    class zombie1_22: ZombieAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {1975.31,3533.61,0}; };
 
    class Snork1_1: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 100; Position[] = {7069.06,5969.48,-0.857156}; };
    class Snork1_2: SnorkAbstract { amount = 4; Cooldown = 480; Radius = 150; Position[] = {6421.02,5406.89,4.76837e-007}; };
    class Snork1_3: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 200; Position[] = {6063.15,5120,0}; };
    class Snork1_4: SnorkAbstract { amount = 2; Cooldown = 480; Radius = 200; Position[] = {6038.43,5611.42,0.146544}; };
    class Snork1_5: SnorkAbstract { amount = 5; Cooldown = 480; Radius = 200; Position[] = {2626.6,5663.57,0}; };
    class Snork1_6: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 200; Position[] = {5009.15,5906.49,0}; };//верхвоенка
    class Snork1_7: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 75; Position[] = {5221.27,5004.25,0}; };//военкановая
    class Snork1_8: SnorkAbstract { amount = 5; Cooldown = 480; Radius = 200; Position[] = {3316.06,2981.03,0}; };//марксвелл
    class Snork1_9: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 75; Position[] = {3509.67,4924.82,1.52588e-005}; };
    class Snork1_10: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 100; Position[] = {4366.17,3729.63,0}; };//майк2
    class Snork1_11: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 200; Position[] = {1769.23,5181.6,0}; };
    class Snork1_12: SnorkAbstract { amount = 4; Cooldown = 480; Radius = 75; Position[] = {2171.85,5638.63,0}; };//покаснорк
    class Snork1_13: SnorkAbstract { amount = 6; Cooldown = 480; Radius = 75; Position[] = {3268.68,6826.53,0.161449}; };
    class Snork1_14: SnorkAbstract { amount = 2; Cooldown = 480; Radius = 200; Position[] = {3723.44,7542.77,-17.5332}; };
    class Snork1_15: SnorkAbstract { amount = 2; Cooldown = 480; Radius = 200; Position[] = {4505.61,6802.59,0}; };
    class Snork1_16: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 100; Position[] = {5022.37,5404.04,1.52588e-005}; };
    class Snork1_17: SnorkAbstract { amount = 3; Cooldown = 480; Radius = 100; Position[] = {3081.51,2141.71,0}; };
    class Snork1_18: SnorkAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {2022.83,2733.17,0}; };
    class Snork1_19: SnorkAbstract { amount = 4; Cooldown = 480; Radius = 100; Position[] = {1975.31,3533.61,0}; };
    class Snork1_20: SnorkAbstract { amount = 4; Cooldown = 480; Radius = 200; Position[] = {2840.71,4485.16,0}; };
 
 
    class Bloodsucker_1: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {5497.61,5805.21,0}; };
    class Bloodsucker_2: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {5744.46,4498.69,0}; };
    class Bloodsucker_3: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {4809.42,4683.88,0}; };
    class Bloodsucker_4: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {3299.18,5777.57,-4.76837e-007}; };
    class Bloodsucker_5: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {2486.39,5152.16,-3.8147e-006}; };
    class Bloodsucker_6: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {4402.37,6031.72,0}; };
    class Bloodsucker_7: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 100; Position[] = {4342.17,4360.76,0.15065}; };
    class Bloodsucker_8: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {4647.23,3703.38,0}; };
    class Bloodsucker_9: BloodsuckerAbstract { amount = 2; Cooldown = 1080; Radius = 100; Position[] = {4505.61,6802.59,0}; };
    class Bloodsucker_10: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {3668.01,4129.82,0}; };
    class Bloodsucker_11: BloodsuckerAbstract { amount = 1; Cooldown = 1080; Radius = 200; Position[] = {2531.94,2843.83,0}; };
 
	
 
    class Controller_1: ControllerAbstract { amount = 1; Cooldown = 2400; Radius = 300; Position[] = {2095.71,5614.29,0}; };//аэро
    class Controller_2: ControllerAbstract { amount = 1; Cooldown = 2400; Radius = 150; Position[] = {2796.28,3389.04,-1.52588e-005}; };//точкаотсчета
    class Controller_3: ControllerAbstract { amount = 1; Cooldown = 480; Radius = 200; Position[] = {4356.86,3812.35,0}; };//майк2
 
 
    // class Chimera_1: ChimeraAbstract { amount = 1; Cooldown = 2400; Radius = 300; Position[] = {2095.71,5614.29,0}; };//аэро
    // class Chimera_2: ChimeraAbstract { amount = 1; Cooldown = 2400; Radius = 100; Position[] = {1856.6,6047.02,0}; };//аэро
	
    class Gigant_1: GiantAbstract { amount = 1; Cooldown = 2400; Radius = 300; Position[] = {2095.71,5614.29,0}; };//аэро
    class Gigant_2: GiantAbstract { amount = 1; Cooldown = 2400; Radius = 200; Position[] = {5009.15,5906.49,0}; };//верхвоенка
    class Gigant_3: GiantAbstract { amount = 1; Cooldown = 2400; Radius = 200; Position[] = {3292.63,2999.43,0}; };//марксвелл
	
    class Burer_1: BurerAbstract { amount = 1; Cooldown = 1080; Radius = 300; Position[] = {2095.71,5614.29,0}; };//аэро
    class Burer_2: BurerAbstract { amount = 1; Cooldown = 1080; Radius = 75; Position[] = {5221.27,5004.25,0}; };//военкановая
	/*
    class Snork1: SnorkAbstract { amount = 5; Cooldown = 0; Radius = 200; Position[] = {2754.746,6871.082,0}; };
    class Chimera1: ChimeraAbstract { amount = 5; Cooldown = 0; Radius = 200; Position[] = {2754.746,6871.082,0}; };
    class Gigant1: GiantAbstract { amount = 5; Cooldown = 0; Radius = 200; Position[] = {2754.746,6871.082,0}; };
    class Bloodsucker1: BloodsuckerAbstract { amount = 5; Cooldown = 0; Radius = 200; Position[] = {2754.746,6871.082,0}; };
    class Controller1: ControllerAbstract { amount = 5; Cooldown = 0; Radius = 200; Position[] = {2754.746,6871.082,0}; };
	*/
};