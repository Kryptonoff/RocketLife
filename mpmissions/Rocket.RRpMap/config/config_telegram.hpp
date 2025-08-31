class CfgTelegram
{
	messgsVar = "PRNS_Conversations";
	indexVar = "PRNS_FilterIndex";

	class CfgDedicatedChanels
	{
		/*
			id:
				0 - не рабочий
				1 - Для всех игроков
				2 - Для всех определенной организации
				3 - Для всех определенной организации с выдачей позиции (алерт для копов и медиков)
				4 - Личное
		*/
		class AbstractChannel
		{

			id = 0;
			icon = "";
			displayName = "";
			variable = "";
			condition = "";
			show_is_online = 0; // ОБЯЗАТЕЛЬНО УКАЗАТЬ КАКУЮ ОРГАНИЗАЦИЮ СЧИТАТЬ В group_variable !!!
			group_id = -1; // Требуется для show_is_online, 
			color[] = {0.7,0,0,1};
		};
		class admin: AbstractChannel
		{
			id = 1;
			icon = "";
			displayName = "Администрация";
			variable = "__ADMIN__";
			condition = "(call life_adminlevel) isEqualTo 0";
			color[] = {0.7,0,0,1};
		};
		class adminAll: AbstractChannel
		{
			id = 2;
			icon = "";
			displayName = "Админ Всем";
			variable = "__ADMIN__";
			condition = "(call life_adminlevel) > 0";
			color[] = {0.7,0,0,1};
		};
		class cop: AbstractChannel
		{
			id = 3;
			icon = "\rimas_agent\assets\organizations\police.paa";
			displayName = "Полиция";
			variable = "__COP__";
			condition = "('cop' call RRPClient_groups_getSideLevel) isEqualTo 0";
			show_is_online = 1;
			group_id = 1;
			color[] = {0,0.1,1,1};
		};
		class copAll: AbstractChannel
		{
			id = 1;
			icon = "\rimas_agent\assets\organizations\police.paa";
			displayName = "Полиция всем";
			variable = "__COP__";
			condition = "('cop' call RRPClient_groups_getSideLevel) > 0";
			color[] = {0,0.1,1,1};
		};
		class es: AbstractChannel
		{
			id = 3;
			icon = "\rimas_agent\assets\organizations\ems.paa";
			displayName = "EMS";
			variable = "__MED__";
			condition = "('med' call RRPClient_groups_getSideLevel) isEqualTo 0";
			show_is_online = 1;
			group_id = 2;
			color[] = {0,0.1,1,1};
		};
		class esAll: AbstractChannel
		{
			id = 1;
			icon = "\rimas_agent\assets\organizations\ems.paa";
			displayName = "EMS всем";
			variable = "__MED__";
			condition = "('med' call RRPClient_groups_getSideLevel) > 0";
			color[] = {0,0.1,1,1};
		};
		class taxi: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\taxi.paa";
			displayName = "Taxi Services";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class press: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\7news.paa";
			displayName = "7-News Agency";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class judge: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\judge.paa";
			displayName = "Ministry of Justice";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class ms: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\ms13.paa";
			displayName = "MS-13";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class alpha: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\alpha.paa";
			displayName = "Alpha";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class cigane: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\cigane.paa";
			displayName = "Cigane";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class escobaro: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\pirates.paa";
			displayName = "La Escobaro Familia";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class kasatky: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\kasatki.paa";
			displayName = "KASATKI";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class phoenix: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\phoenix.paa";
			displayName = "Phoenix";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class bs: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\bs.paa";
			displayName = "Black Snow";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class dl: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\deadlock.paa";
			displayName = "Damned Knights";
			variable = "__REB__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class cwrka: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\cvrk.paa";
			displayName = "Ц.В.Р.К.А.";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class wolves: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\wolves.paa";
			displayName = "Wolves";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
		class sector: AbstractChannel
		{
			id = 1;
			picture = "\rimas_agent\assets\organizations\sector7.paa";
			displayName = "Sector 7";
			variable = "__CIV__";
			condition = "true";
			color[] = {0,0.1,1,1};
		};
	};
};

class CfgEmoji
{
	class smile {
		displayName = "smile"; //Название
		keyword = "smile"; //Ключевое слово
		conditions = "true"; //Условие
		image = "emojepack\smile.paa"; //Путь к текстуре
	};
	class smiley {
		displayName = "Smiley";
		keyword = "smiley";
		conditions = "true";
		image = "emojepack\smiley.paa";
	};
	class smirk {
		displayName = "Smirk";
		keyword = "smirk";
		conditions = "true";
		image = "emojepack\smirk.paa";
	};
	class sob {
		displayName = "Sob";
		keyword = "sob";
		conditions = "true";
		image = "emojepack\sob.paa";
	};
	class sunglasses {
		displayName = "Sunglasses";
		keyword = "sunglasses";
		conditions = "true";
		image = "emojepack\sunglasses.paa";
	};
	class angry {
		displayName = "Angry";
		keyword = "angry";
		conditions = "true";
		image = "emojepack\angry.paa";
	};
};