
class AbstractStore
{
	defaultName = "Абстракция";
	rentCost = 6600; //rc
	costUpgrade = 3300; //rc
	maxSlots = 20;
	maxStack = 50;
	texture = "";
};

class CfgLtds
{
	costToCreate = 50000;
	allowToWithdraw = 10000;
	taxWithdraw = 3;

	class casino
	{
		class abstract_casino
		{
			defaultName = "Абстракция";
			rentCost = 9900; //rc
			texture = "";
			textureList[] = {
				{	
					"Стандартный",
					"default",
					{
						"rrp_objects\textures\SM_R_01.paa",
						"rrp_objects\textures\SM_R_02.paa"
					}
				},
				{	
					"Mega Jackpot",
					"megajackpot",
					{
						"rrp_objects\textures\slots\SM_I_01_1.paa",
						"rrp_objects\textures\slots\SM_I_02_2.paa"
					}
				},
				{	
					"Happy Patrick",
					"happypatrick",
					{
						"rrp_objects\textures\slots\SM_I_01_11.paa",
						"rrp_objects\textures\slots\SM_I_02_22.paa"
					}
				},
				{	
					"GOP WIN 8 Bit",
					"gopwin",
					{
						"rrp_objects\textures\slots\SM_I_01_111.paa",
						"rrp_objects\textures\slots\SM_I_02_222.paa"
					}
				},
				{	
					"Anime Win",
					"animewin",
					{
						"rrp_objects\textures\slots\SM_I_01_1111.paa",
						"rrp_objects\textures\slots\SM_I_02_2222.paa"
					}
				},
				{	
					"Power Buck$",
					"powerbucks",
					{
						"rrp_objects\textures\slots\SM_I_01_11111.paa",
						"rrp_objects\textures\slots\SM_I_02_22222.paa"
					}
				},
				{	
					"Cosmos",
					"cosmos",
					{
						"rrp_objects\textures\slots\SM_I_01_111111.paa",
						"rrp_objects\textures\slots\SM_I_02_222222.paa"
					}
				},
				{	
					"Life Of Boris",
					"lifeboris",
					{
						"rrp_objects\textures\slots\SM_I_01_1111111.paa",
						"rrp_objects\textures\slots\SM_I_02_2222222.paa"
					}
				},
				{	
					"Pow!",
					"pow",
					{
						"rrp_objects\textures\slots\SM_I_01_11111111.paa",
						"rrp_objects\textures\slots\SM_I_02_22222222.paa"
					}
				},
				{	
					"My Little Ponny!",
					"littleponny",
					{
						"rrp_objects\textures\slots\SM_I_01_111111111.paa",
						"rrp_objects\textures\slots\SM_I_02_222222222.paa"
					}
				},
				{	
					"The Pig Wizard",
					"pigwizard",
					{
						"rrp_objects\textures\slots\SM_I_01_1111111111.paa",
						"rrp_objects\textures\slots\SM_I_02_2222222222.paa"
					}
				}
			};
		};
		class impcas: 	abstract_casino {};
		class impcas_1: abstract_casino {};
		class impcas_2: abstract_casino {};
		class impcas_3: abstract_casino {};
		class impcas_4: abstract_casino {};
	};
	class stores
	{
		class private_store_1: AbstractStore
		{
			defaultName = "Кавала 24/7";
		};
		class store_pirgos: AbstractStore
		{
			defaultName = "Пиргос 24/7";
		};
		class store_dp11: AbstractStore
		{
			defaultName = "Айос-Дионисиос 24/7";
		};
		class store_Atira: AbstractStore
		{
			defaultName = "Атира 24/7";
		};
		class store_sofia: AbstractStore
		{
			defaultName = "София 24/7";
		};
	};
};
