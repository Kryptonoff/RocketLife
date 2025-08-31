#define COND_ANIM "true"

class CfgAnimations 
{
	class Stop
	{
		displayName = "Отмена";
		condition = COND_ANIM;
		icon = "icons\actions.paa";
		f = "['Stop'] call RRPClient_player_anim";
	};
	class Actions 
	{
		displayName = "Действия";
		condition = COND_ANIM;
		icon = "icons\actions.paa";
		class Animations
		{
			class HandsUp
			{
				displayName = "Руки вверх";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class HandsDown
			{
				displayName = "Опустить руки";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class Surrender
			{
				displayName = "Сдаться";
				condition = COND_ANIM;
				icon = ""; 
				f = "['HandsUp'] call RRPClient_player_anim";
			};
		};
	};
	class Poses
	{
		displayName = "Позы";
		condition = COND_ANIM;
		icon = "icons\poses.paa";
		class Animations
		{
			class Smoke
			{
				displayName = "Курит сигарету";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class Tablet
			{
				displayName = "Записываю в блокнот";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class HandsX
			{
				displayName = "Скрестил руки";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
		};
	};
	class Positive
	{
		displayName = "Позитивные";
		condition = COND_ANIM;
		icon = "icons\positive.paa";
		class Animations
		{
			class HandsUp
			{
				displayName = "Руки вверх";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class HandsDown
			{
				displayName = "Руки вниз";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
		};
	};
	class Negative
	{
		displayName = "Негативные";
		condition = COND_ANIM;
		icon = "icons\negative.paa";
		class Animations
		{
			class HandsUp
			{
				displayName = "Руки вверх";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class HandsDown
			{
				displayName = "Руки Вниз";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
		};
	};
	class Dance
	{
		displayName = "Танцы";
		condition = COND_ANIM;
		icon = "icons\dances.paa";
		class Animations
		{
			class Ivan
			{
				displayName = "Иван";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class Stefan
			{
				displayName = "Стефан";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class StefanV
			{
				displayName = "Стефан V";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class NightClub
			{
				displayName = "Ночной клуб";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class DubStep
			{
				displayName = "Дап-Степ";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class DubStepPop
			{
				displayName = "Дап-Степ поп";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class HipHop
			{
				displayName = "Хип-Хоп";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class Robot
			{
				displayName = "Робот";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
			class Russian
			{
				displayName = "Русский";
				condition = COND_ANIM;
				icon = "";
				f = "['HandsUp'] call RRPClient_player_anim";
			};
		};
	};
	class Etc
	{
		displayName = "Прочее";
		condition = COND_ANIM;
		icon = "icons\etc.paa";
		class Animations
		{
			class KamenNozhnici
			{
				displayName = "Камень, ножницы, бумага";
				condition = COND_ANIM;
				icon = "";
				f = "['etc','KamenNozhnici'] call RRPClient_player_anim";
			};
		};
	};
};

class CfgPosePlayer {
	class AM_slavicSquat_loop {
		name = "Сесть на карты (#1)";
		description = "";
		action = "AM_slavicSquat_loop";
		actionPre = "AM_slavicSquat_in";
		actionPos = "AM_slavicSquat_out";
		actionPreTime = 1.6;
		actionPosTime = 1.6;
		spawnWeapon = "";
		condition = "true";
		conditionView = "true";
		needVip = 0;
		error_text = "";
	};
};