#define true 1
#define false 0

class cfgItemUse
{
	class RRP_Item
	{
		scope=2;
		descriptionShort="by RRP";
		displayName="RRP";
		author="RRP";
		count=1;
		mass=1;
		class Interactions
		{
		};
	};
	class RRP_Effect
	{
		type="food";
		thirst=0; //Жажда
		hunger=0; //Голод
		diareaChance=0; //Шанс получить диарею
		Sprint[]={0,0}; //ускоряет бег, процент и время
		Stamina=0; //восстанавливает стамину
		Cargo[]={0,0}; // Добавляет доп слоты для ресурсов на время
		Heal=0; //хилка
		Gheal[]={0,0}; //фласка, хилит постепенно, но если получаешь дамаг, эффект сбивается
		BoostFarm[]={0,0}; //буст фарма, процент и время - нужно привязать к новому фарму
		drugAddict=0; //зависимость
		CD=0; //кулдаун, на использование
		newItem=""; // после использовании что появится в замен

		fill = false; //Для заполнения чего либо, например если это фляга, тогда после использования игрок получит newItem и этот удалится
		fillCondition = ""; //Условие при котором можно выполнять заполнение, например колонка с водой в радиусе 3х метров
		fillMessage = ""; //Сообщение если условие не соблюдается
		visualEffest = ""; //Визуальный эффект, например для наркотиков
	};
	class RRPItem_Roll_Tuna_F: RRP_Item
	{
		displayName="Ролл с тунцом";
		picture="\RRP_items\images\roll_tuna.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Это рулет из риса и тунца завернутый в сушеные листья водорослей нори.<br/>Голод: -25%<br/>Скорость бега: +10%/на 60 секунд<br/>Скорость фарма: +25%/на 2 минуты";
		class Interactions: RRP_Effect
		{
			hunger=25;
			Sprint[]={10,60};
			BoostFarm[]={25,120};
			CD=60;
			diareaChance=1;
		};
	};
	class RRPItem_Roll_Skumbria_F: RRP_Item
	{
		displayName="Ролл со скумбрией";
		picture="\RRP_items\images\roll_skumbria.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Это рулет из риса и скумбрии завернутый в сушеные листья водорослей нори.<br/>Голод: -25%<br/>Скорость бега: +10%/на 60 секунд<br/>Дополнительная вместимость на 2 минуты";
		class Interactions: RRP_Effect
		{
			hunger=25;
			Sprint[]={10,60};
			Cargo[]={50,120};
			CD=60;
			diareaChance=1;
		};
	};
	class RRPItem_Sushi_Tuna_F: RRP_Item
	{
		displayName="Суши с тунцом";
		picture="\RRP_items\images\sushi_tuna.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Это скрученный в форме рулетика рис, на который сверху положен кусочек тунца.<br/>Голод: -25%<br/>Скорость бега: +10%/на 60 секунд<br/>Регенерация: +50%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=25;
			Sprint[]={10,60};
			Gheal[]={50,60};
			CD=60;
			diareaChance=1;
		};
	};
	class RRPItem_Sushi_Skumbria_F: RRP_Item
	{
		displayName="Суши со скумбрией";
		picture="\RRP_items\images\sushi_skumbria.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Это скрученный в форме рулетика рис, на который сверху положен кусочек скумбрии.<br/>Голод: -25%<br/>Скорость бега: +10%/на 60 секунд<br/>Дополнительная выносливость на 1 минуту";
		class Interactions: RRP_Effect
		{
			hunger=25;
			Sprint[]={10,60};
			Stamina=60;
			CD=60;
			diareaChance=1;
		};
	};
	class RRPItem_jivchik_1: RRP_Item
	{
		count=1;
		displayName="Живчик (3\3)";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\RRPItem_jivchik_1.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 3/3<br/>Чудесный Живчик, полного хватает на 3 раза.<br/>Жажда: -50%<br/>Стамина: 5 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=50;
			Stamina=5;
			Gheal[]={30,180};
			diareaChance=1;
			newItem="RRPItem_jivchik_1_2";
		};
	};
	class RRPItem_jivchik_1_2: RRP_Item
	{
		count=1;
		displayName="Живчик (2\3)";
		mass=8;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\RRPItem_jivchik_1_2.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 2/3<br/>Чудесный Живчик, полного хватает на 3 раза.<br/>Жажда: -50%<br/>Стамина: 5 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=50;
			Stamina=5;
			Gheal[]={30,180};
			diareaChance=1;
			newItem="RRPItem_jivchik_1_3";
		};
	};
	class RRPItem_jivchik_1_3: RRP_Item
	{
		count=1;
		displayName="Живчик (1\3)";
		mass=6;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\RRPItem_jivchik_1_3.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 1/3<br/>Чудесный Живчик, полного хватает на 3 раза.<br/>Жажда: -50%<br/>Стамина: 5 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=50;
			Stamina=5;
			Gheal[]={30,180};
			diareaChance=1;
			newItem="RRPItem_jivchik_1_4";
		};
	};
	class RRPItem_cola: RRP_Item
	{
		count=1;
		displayName="Coca Cola";
		mass=8;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\RRPItem_cola.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Банка Колы<br/>Жажда: -60<br/>Стамина: 5 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=60;
			Stamina=5;
			diareaChance=1;
		};
	};
	class RRPItem_pepsi: RRP_Item
	{
		count=1;
		displayName="Pepsi";
		mass=8;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\RRPItem_pepsi.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Банка Pepsi<br/>Жажда: -60<br/>Стамина: 5 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=60;
			Stamina=5;
			diareaChance=1;
		};
	};
	class RRPItem_flash: RRP_Item
	{
		count=1;
		displayName="Flash";
		mass=15;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\RRPItem_flash.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Банка Flash<br/>Жажда: -100<br/>Стамина: 60 сек.<br/>Шанс диареи: 50%<br/>Здоровье -30";
		class Interactions: RRP_Effect
		{
			thirst=100;
			Stamina=60;
			Heal=-30;
			diareaChance=40;
		};
	};
	/* Первинтин */
	class RRPItem_perventinSyringe: RRP_Item
	{
		displayName="Шприц с Первинтин";
		mass=10;
		picture="\RRP_items\images\RRPItem_perventinSyringe.paa";
        model="\A3\structures_f_epa\Items\medical\antibiotic_F";
		descriptionShort="Первинтин очень сильный стимулятор, восстанавливает здоровье в кратчайший срок, но сильно просаживает печень.<br/>Здоровье: +50<br/>Регенерация: +50/за 50 сек.";
		class Interactions: RRP_Effect
		{
			//thirst=-15;
			//hunger=-15;
			Gheal[]={50,50};
			Heal=50;
			drugAddict=1;
			CD=80;
			visualEffest = "RRPClient_effects_cocaine";
		};
	};
	class RRPItem_perventiPills_1_1: RRP_Item
	{
		displayName="Первинтин в пилюлях";
		mass=10;
		picture="\RRP_items\images\RRPItem_perventiPills_1_1.paa";
        model="\A3\structures_f_epa\Items\medical\antibiotic_F";
		descriptionShort="Первинтин очень сильный стимулятор, восстанавливает здоровье в кратчайший срок, но сильно просаживает печень.<br/>Регенерация: +100/за 100 сек.";
		class Interactions: RRP_Effect
		{
			//thirst=-15;
			//hunger=-15;
			Gheal[]={100,100};
			drugAddict=1;
			CD=80;
			newItem="RRPItem_perventiPills_1_2";
		};
	};
	class RRPItem_perventiPills_1_2: RRP_Item
	{
		displayName="Первинтин в пилюлях";
		mass=5;
		picture="\RRP_items\images\RRPItem_perventiPills_1_2.paa";
        model="\A3\structures_f_epa\Items\medical\antibiotic_F";
		descriptionShort="Первинтин очень сильный стимулятор, восстанавливает здоровье в кратчайший срок, но сильно просаживает печень.<br/>Регенерация: +100/за 100 сек.";
		class Interactions: RRP_Effect
		{
			//thirst=-15;
			//hunger=-15;
			Gheal[]={100,100};
			drugAddict=1;
			CD=80;
		};
	};
	class RRPItem_JeamBean_F: RRP_Item
	{
		displayName="Пиво «Jim Beam»";
		picture="\RRP_items\images\JimBeam.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Это самое знаменитое пиво на острове. Можно приобрести только в баре у байкеров.<br/>Жажда: -60%<br/>Скорость бега: +15%/на 60 секунд<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			thirst=60;
			Sprint[]={15,60};
			Gheal[]={30,60};
			CD=60;
			diareaChance=5;
		};
	};
	/* Косяк */
	class RRPItem_Jamb_F: RRP_Item
	{
		displayName="Косяк";
		picture="\RRP_icons\items\Jamb.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Косяк будет очень полезен во многих ситуациях, но вызывает сильную зависимость.<br/>Голод: +50%<br/>Жажда: +25%<br/>Скорость бега: +60%/на 30 секунд<br/>Регенерация: +100%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			thirst=-25;
			hunger=-50;
			Sprint[]={60,30};
			Stamina=100;
			Gheal[]={100,30};
			drugAddict=40;
			CD=180;
			visualEffest = "RRPClient_effects_Marj";
		};
	};
	/* Спидбол */
	class RRPItem_Speedball_F: RRP_Item
	{
		displayName="Спидбол";
		picture="\RRP_icons\items\Speedball.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Спидбол будет очень полезен во время фарма.<br/>Здоровье: -10%<br/>Жажда: +25%<br/>Скорость фарма: +50%/на 5 минут<br/>Дополнительная вместимость под ресурсы на 4 минуты";
		class Interactions: RRP_Effect
		{
			Heal=-10;
			thirst=-25;
			Cargo[]={65,360};
			BoostFarm[]={50,360};
			drugAddict=50;
			CD=720;
		};
	};
	class RRPItem_Omega_F: RRP_Item
	{
		displayName="Омега";
		picture="\RRP_icons\items\Omega.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Препарат Омега будет очень полезен во время фарма.<br/>Жажда: +20%<br/>Скорость фарма: +40%/на 6 минут<br/>Дополнительная вместимость под ресурсы на 6 минут";
		class Interactions: RRP_Effect
		{
			thirst=-25;
			Cargo[]={65,420};
			BoostFarm[]={40,420};
			drugAddict=2;
			CD=720;
		};
	};
	class RRPItem_Bafaut_F: RRP_Item
	{
		displayName="Бафаут";
		picture="\rimas_items\pics\buffout.paa";
		model="\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort="Препарат Бафаут очень полезен для длительных пробежек.<br/>Не вызывает привыкания<br/>Стамина: 5 минут<br/>Скорость бега: +15%/на 60 секунд";
		class Interactions: RRP_Effect
		{
			Sprint[]={15,60};
			Stamina=360;
			drugAddict=1;
			CD=360;
		};
	};
	class RRPItem_Orange_F: RRP_Item
	{
		count=1;
		displayName="Апельсин";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Orange.paa";
		model="\A3\Props_F_Orange\Humanitarian\Supplies\Orange_01_F.p3d";
		descriptionShort="Мы делили апельсин, много нас, а он один!<br/>Голод: -7%<br/>Жажда: -3%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=3;
			hunger=7;
			diareaChance=1;
		};
	};
	class RRPItem_Pumpkin_F: RRP_Item
	{
		count=1;
		displayName="Тыква";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Pumpkin.paa";
		model="\A3\Props_F_Orange\Humanitarian\Supplies\Pumpkin_01_F.p3d";
		descriptionShort="А вы слышали сказки от деда Пупкина про эту пищу?<br/>Голод: -20%<br/>Жажда: -10%<br/>Шанс диареи: 4%";
		class Interactions: RRP_Effect
		{
			thirst=10;
			hunger=20;
			diareaChance=4;
		};
	};
	class RRPItem_Apple_Red: RRP_Item
	{
		count=1;
		displayName="Красное яблоко";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Apple_Red.paa";
		model="\RRP_items\models\Apple_Red.p3d";
		descriptionShort="Наливное спелое красное яблоко<br/>Голод: -5%<br/>Жажда: -2%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=2;
			hunger=5;
			diareaChance=1;
		};
	};
	class RRPItem_Apple_Green: RRP_Item
	{
		count=1;
		displayName="Зеленое яблоко";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Apple_Green.paa";
		model="\RRP_items\models\Apple_Green.p3d";
		descriptionShort="Очень вкусный фрукт!<br/>Голод: -3%<br/>Жажда: -4%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=4;
			hunger=3;
			diareaChance=1;
		};
	};
	class RRPItem_Blueberry: RRP_Item
	{
		count=1;
		displayName="Голубика";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Blueberry.paa";
		model="\RRP_items\models\Blueberry.p3d";
		descriptionShort="Может из нее что-нибудь приготовить?<br/>Голод: -4%<br/>Жажда: -2%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=2;
			hunger=4;
			diareaChance=1;
		};
	};
	class RRPItem_Pear: RRP_Item
	{
		count=1;
		displayName="Груша";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Pear.paa";
		model="\RRP_items\models\Pear.p3d";
		descriptionShort="Ростовская вкусняшка!<br/>Голод: -6%<br/>Жажда: -5%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=5;
			hunger=6;
			diareaChance=1;
		};
	};
	class RRPItem_Strawberry: RRP_Item
	{
		count=1;
		displayName="Клубника";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Strawberry.paa";
		model="\RRP_items\models\Strawberry.p3d";
		descriptionShort="Очень вкусная клубника!<br/>Голод: -3%<br/>Жажда: -7%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=7;
			hunger=3;
			diareaChance=1;
		};
	};
	class RRPItem_Tomato: RRP_Item
	{
		count=1;
		displayName="Томат";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Tomato.paa";
		model="\RRP_items\models\Tomato.p3d";
		descriptionShort="Вкусный томат, но лучше с него что-нибудь приготовить!<br/>Голод: -10%<br/>Жажда: -5%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=5;
			hunger=10;
			diareaChance=1;
		};
	};
	class RRPItem_Cucumber: RRP_Item
	{
		count=1;
		displayName="Огурец";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Cucumber.paa";
		model="\RRP_items\models\Cucumber.p3d";
		descriptionShort="Сочный огурчик!<br/>Голод: -5%<br/>Жажда: -10%<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=10;
			hunger=5;
			diareaChance=1;
		};
	};
	class RRPItem_Canteen_Clean_F: RRP_Item
	{
		count=1;
		displayName="Фляга (Чистая вода)";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Canteen.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 100%<br/>Фляга с чистой водой, не содержит бактерий. Пейте медленно, чтобы хватило надолго.<br/>Жажда: -30%<br/>Стамина: 15 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=30;
			Stamina=15;
			diareaChance=1;
			newItem="RRPItem_Canteen_Clean_C";
		};
	};
	class RRPItem_Canteen_Clean_C: RRP_Item
	{
		count=1;
		displayName="Фляга (Чистая вода)";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Canteen.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 50%<br/>Фляга с чистой водой, не содержит бактерий. Пейте медленно, чтобы хватило надолго.<br/>Жажда: -30%<br/>Стамина: 15 сек.<br/>Шанс диареи: 1%";
		class Interactions: RRP_Effect
		{
			thirst=30;
			Stamina=15;
			diareaChance=1;
			newItem="RRPItem_Canteen_Empty_L";

			fill = true;
			fillCondition = "[cursorObject] call RRPClient_util_getModelName isEqualTo 'water_source_f' AND cursorObject distance player < 2"; 
			fillMessage = "Вы должны смотреть на колонку и она должна быть в радиусе 2х метров";
		};
	};
	class RRPItem_Canteen_Dirty_F: RRP_Item
	{
		count=1;
		displayName="Фляга (Пресная вода)";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Canteen.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 100%<br/>Наслаждайтесь настоящим вкусом пресной воды.<br/>Жажда: -30%<br/>Стамина: 10 сек.<br/>Шанс диареи: 40%";
		class Interactions: RRP_Effect
		{
			thirst=30;
			Stamina=10;
			diareaChance=40;
			newItem="RRPItem_Canteen_Dirty_C";
		};
	};
	class RRPItem_Canteen_Dirty_C: RRP_Item
	{
		count=1;
		displayName="Фляга (Пресная вода)";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Canteen.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Состояние: 50%<br/>Наслаждайтесь настоящим вкусом пресной воды.<br/>Жажда: -30%<br/>Стамина: 15 сек.<br/>Шанс диареи: 40%";
		class Interactions: RRP_Effect
		{
			thirst=30;
			Stamina=15;
			diareaChance=40;
			newItem="RRPItem_Canteen_Empty_L";
		};
	};
	class RRPItem_Canteen_Empty_L: RRP_Item
	{
		count=1;
		displayName="Фляга (Пустая)";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Canteen.paa";
		model="a3\structures_f_epa\items\food\canteen_f.p3d";
		descriptionShort="Заполните флягу водой в океане или в местных резервуарах для воды.";
		class Interactions: RRP_Effect
		{
			fill = true;
			fillCondition = "[cursorObject] call RRPClient_util_getModelName isEqualTo 'water_source_f' AND cursorObject distance player < 2"; 
			fillMessage = "Вы должны смотреть на колонку и она должна быть в радиусе 2х метров";
		};
	};
	class RRPItem_Sheep_RAW: RRP_Item
	{
		count=1;
		displayName="Сырая баранина";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Sheep_RAW.paa";
		model="\RRP_items\models\Sheep_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Sheep_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная баранина";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Sheep_CK.paa";
		model="\RRP_items\models\Sheep_CK.p3d";
		descriptionShort="Голод: -30%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_CatShark_F: RRP_Item
	{
		count=1;
		displayName="Сырая кошачья акула";
		mass=60;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\CatShark_F.paa";
		model="\A3\animals_f\Fishes\CatShark_F.p3d";
		descriptionShort="Для приготовления его нужно разделать.<br/> Требуется нож!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_CatShark_RAW: RRP_Item
	{
		count=1;
		displayName="Филе кашачей акулы";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\CatShark_RAW.paa";
		model="\RRP_items\models\CatShark_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_CatShark_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная кошачья акула";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\CatShark_CK.paa";
		model="\RRP_items\models\CatShark_CK.p3d";
		descriptionShort="Голод: -40%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Chicken_RAW: RRP_Item
	{
		count=1;
		displayName="Сырая курица";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Chicken_RAW.paa";
		model="\RRP_items\models\Chicken_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Chicken_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная курица";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Chicken_CK.paa";
		model="\RRP_items\models\Chicken_CK.p3d";
		descriptionShort="Голод: -30%";
		class Interactions: RRP_Effect
		{
			hunger=40;
			diareaChance=5;
		};
	};
	class RRPItem_Goat_RAW: RRP_Item
	{
		count=1;
		displayName="Сырая козлятина";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Goat_RAW.paa";
		model="\RRP_items\models\Goat_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Goat_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная коза";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Goat_CK.paa";
		model="\RRP_items\models\Goat_CK.p3d";
		descriptionShort="Голод: -35%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Fin_RAW: RRP_Item
	{
		count=1;
		displayName="Сырые плавники";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Fin_RAW.paa";
		model="\RRP_items\models\Fin_RAW.p3d";
		descriptionShort="Плавники акулы, на вкус не очень, но могут немного насытить. <br/>Голод: -10%<br/>Шанс диареи: 40%";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Fin_CK: RRP_Item
	{
		count=1;
		displayName="Запеченные плавники";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Fin_CK.paa";
		model="\RRP_items\models\Fin_CK.p3d";
		descriptionShort="Голод: -47%";
		class Interactions: RRP_Effect
		{
			hunger=40;
			diareaChance=5;
		};
	};
	class RRPItem_Mackrel_F: RRP_Item
	{
		count=1;
		displayName="Сырая скумбрия";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Mackrel_F.paa";
		model="\A3\animals_f\Fishes\mackerel_F.p3d";
		descriptionShort="Для приготовления его нужно разделать.<br/> Требуется нож!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Mackrel_RAW: RRP_Item
	{
		count=1;
		displayName="Филе скумбрии";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Mackrel_RAW.paa";
		model="\RRP_items\models\Mackrel_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Mackrel_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная скумбрия";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Mackrel_CK.paa";
		model="\RRP_items\models\Mackrel_CK.p3d";
		descriptionShort="Голод: -43%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Tuna_F: RRP_Item
	{
		count=1;
		displayName="Сырой тунец";
		mass=80;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Tuna_F.paa";
		model="\A3\animals_f\Fishes\Tuna_F.p3d";
		descriptionShort="Для приготовления его нужно разделать.<br/> Требуется нож!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Tuna_RAW: RRP_Item
	{
		count=1;
		displayName="Филе тунца";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Tuna_RAW.paa";
		model="\RRP_items\models\Tuna_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Tuna_CK: RRP_Item
	{
		count=1;
		displayName="Приготовленный тунец";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Tuna_CK.paa";
		model="\RRP_items\models\Tuna_CK.p3d";
		descriptionShort="Приготовленный тунец, уже не такой вкусный, но питательный. <br/>Голод: -50%";
		class Interactions: RRP_Effect
		{
			hunger=50;
			diareaChance=5;
		};
	};
	class RRPItem_Rabbit_RAW: RRP_Item
	{
		count=1;
		displayName="Сырой кролик";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Rabbit_RAW.paa";
		model="\RRP_items\models\Rabbit_RAW.p3d";
		descriptionShort="Сырой кролик, советую не есть его морковку... <br/>Голод: -10%<br/>Шанс диареи: 40%";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Rabbit_CK: RRP_Item
	{
		count=1;
		displayName="Приготовленный кролик";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Rabbit_CK.paa";
		model="\RRP_items\models\Rabbit_CK.p3d";
		descriptionShort="Приготовленный кролик, надеюсь вы запикали его с морковью. <br/>Голод: -25%<br/>Шанс диареи: 5%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Rooster_RAW: RRP_Item
	{
		count=1;
		displayName="Сырой петух";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Rooster_RAW.paa";
		model="\RRP_items\models\Rooster_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Rooster_CK: RRP_Item
	{
		count=1;
		displayName="Приготовленный петух";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Rooster_CK.paa";
		model="\RRP_items\models\Rooster_CK.p3d";
		descriptionShort="Голод: -40%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Salema_F: RRP_Item
	{
		count=1;
		displayName="Сырая ставрида";
		mass=40;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Salema_F.paa";
		model="\A3\animals_f\Fishes\Salema_porgy_F.p3d";
		descriptionShort="Для приготовления его нужно разделать.<br/> Требуется нож!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Salema_RAW: RRP_Item
	{
		count=1;
		displayName="Филе салемы";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Salema_RAW.paa";
		model="\RRP_items\models\Salema_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Salema_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная салема";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Salema_CK.paa";
		model="\RRP_items\models\Salema_CK.p3d";
		descriptionShort="Голод: -35%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Mullet_F: RRP_Item
	{
		count=1;
		displayName="Сырая кефаль";
		mass=35;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Mullet_F.paa";
		model="\A3\animals_f\Fishes\Mullet_F.p3d";
		descriptionShort="Для приготовления его нужно разделать.<br/> Требуется нож!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Mullet_RAW: RRP_Item
	{
		count=1;
		displayName="Филе кефали";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Mullet_RAW.paa";
		model="\RRP_items\models\Mullet_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Mullet_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная кефаль";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Mullet_CK.paa";
		model="\RRP_items\models\Mullet_CK.p3d";
		descriptionShort="Голод: -37%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Ornate_F: RRP_Item
	{
		count=1;
		displayName="Рыбка-попугай";
		mass=20;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Ornate_F.paa";
		model="\A3\animals_f\Fishes\ornate_F.p3d";
		descriptionShort="Для приготовления его нужно разделать.<br/> Требуется нож!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Ornate_RAW: RRP_Item
	{
		count=1;
		displayName="Филе рыбки-попугая";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Ornate_RAW.paa";
		model="\RRP_items\models\Ornate_RAW.p3d";
		descriptionShort="Для употребления нужно приготовить на костре!";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Ornate_CK: RRP_Item
	{
		count=1;
		displayName="Запеченая рыбка-попугай";
		mass=10;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Ornate_CK.paa";
		model="\RRP_items\models\Ornate_CK.p3d";
		descriptionShort="Голод: -33%";
		class Interactions: RRP_Effect
		{
			hunger=25;
			diareaChance=5;
		};
	};
	class RRPItem_Turtle_RAW: RRP_Item
	{
		count=1;
		displayName="Сырая черепаха";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Turtle_RAW.paa";
		model="\RRP_items\models\Turtle_RAW.p3d";
		descriptionShort="Сырая черепаха, будьте осторожны, они сильно кусаются. <br/>Голод: -10%<br/>Шанс диареи: 40%";
		class Interactions: RRP_Effect
		{
			hunger=10;
			diareaChance=40;
		};
	};
	class RRPItem_Turtle_CK: RRP_Item
	{
		count=1;
		displayName="Запеченная черепаха";
		mass=1;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Turtle_CK.paa";
		model="\RRP_items\models\Turtle_CK.p3d";
		descriptionShort="Запеченная черепаха, самая настоящая вкуснятина. <br/>Голод: -39%<br/>Шанс диареи: 5%";
		class Interactions: RRP_Effect
		{
			hunger=30;
			diareaChance=5;
		};
	};
	class RRPItem_Container: RRP_Item
	{
		count=1;
		displayName="Пищевой контейнер (Пустой)";
		mass=2;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Я должен быть в состоянии что-то приготовить с этим.";
	};
	class RRPItem_Container_Rabbit_Potato: RRP_Item
	{
		count=1;
		displayName="Мясо кролика с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе кролика с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -70%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=70;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Rabbit_Potato_L";
		};
	};
	class RRPItem_Container_Rabbit_Potato_L: RRP_Item
	{
		count=1;
		displayName="Мясо кролика с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе кролика с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -70%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=70;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Rabbit_Rice: RRP_Item
	{
		count=1;
		displayName="Мясо кролика с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе кролика с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Rabbit_Rice_L";
		};
	};
	class RRPItem_Container_Rabbit_Rice_L: RRP_Item
	{
		count=1;
		displayName="Мясо кролика с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе кролика с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Rooster_Potato: RRP_Item
	{
		count=1;
		displayName="Мясо петуха с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе петуха с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Rooster_Potato_L";
		};
	};
	class RRPItem_Container_Rooster_Potato_L: RRP_Item
	{
		count=1;
		displayName="Мясо петуха с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе петуха с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Rooster_Rice: RRP_Item
	{
		count=1;
		displayName="Рис с мясом петуха";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе петуха с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Rooster_Rice_L";
		};
	};
	class RRPItem_Container_Rooster_Rice_L: RRP_Item
	{
		count=1;
		displayName="Рис с мясом петуха";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе петуха с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Goat_Potato: RRP_Item
	{
		count=1;
		displayName="Козлятина с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе козы с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Goat_Potato_L";
		};
	};
	class RRPItem_Container_Goat_Potato_L: RRP_Item
	{
		count=1;
		displayName="Козлятина с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе козы с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Goat_Rice: RRP_Item
	{
		count=1;
		displayName="Козлятина с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе козы с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Goat_Rice_L";
		};
	};
	class RRPItem_Container_Goat_Rice_L: RRP_Item
	{
		count=1;
		displayName="Козлятина с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе козы с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Fin_Potato: RRP_Item
	{
		count=1;
		displayName="Плавники с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Плавники с картофелем очень полезная еда с великолепным вкусом. Вы должны попробовать это!<br/>Голод: -70%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=70;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Fin_Potato_L";
		};
	};
	class RRPItem_Container_Fin_Potato_L: RRP_Item
	{
		count=1;
		displayName="Плавники с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Плавники с картофелем очень полезная еда с великолепным вкусом. Вы должны попробовать это!<br/>Голод: -70%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=70;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Fin_Rice: RRP_Item
	{
		count=1;
		displayName="Плавники с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Плавники с рисом очень полезная еда с великолепным вкусом. Вы должны попробовать это!<br/>Голод: -80%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Fin_Rice_L";
		};
	};
	class RRPItem_Container_Fin_Rice_L: RRP_Item
	{
		count=1;
		displayName="Плавники с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Плавники с рисом очень полезная еда с великолепным вкусом. Вы должны попробовать это!<br/>Голод: -80%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Chicken_Potato: RRP_Item
	{
		count=1;
		displayName="Курица с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе курицы с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Chicken_Potato_L";
		};
	};
	class RRPItem_Container_Chicken_Potato_L: RRP_Item
	{
		count=1;
		displayName="Курица с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе курицы с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +25%/за 25 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={25,25};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Chicken_Rice: RRP_Item
	{
		count=1;
		displayName="Курица с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе курицы с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Chicken_Rice_L";
		};
	};
	class RRPItem_Container_Chicken_Rice_L: RRP_Item
	{
		count=1;
		displayName="Курица с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе курицы с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Sheep_Potato: RRP_Item
	{
		count=1;
		displayName="Баранина с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Баранина с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Sheep_Potato_L";
		};
	};
	class RRPItem_Container_Sheep_Potato_L: RRP_Item
	{
		count=1;
		displayName="Баранина с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Баранина с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Sheep_Rice: RRP_Item
	{
		count=1;
		displayName="Баранина с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Баранина с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Sheep_Rice_L";
		};
	};
	class RRPItem_Container_Sheep_Rice_L: RRP_Item
	{
		count=1;
		displayName="Баранина с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Баранина с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -75%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=75;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Tuna_Potato: RRP_Item
	{
		count=1;
		displayName="Филе тунца с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе тунца с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -70%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=70;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Tuna_Potato_L";
		};
	};
	class RRPItem_Container_Tuna_Potato_L: RRP_Item
	{
		count=1;
		displayName="Филе тунца с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе тунца с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -70%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=70;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Tuna_Rice: RRP_Item
	{
		count=1;
		displayName="Филе тунца с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе тунца с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Tuna_Rice_L";
		};
	};
	class RRPItem_Container_Tuna_Rice_L: RRP_Item
	{
		count=1;
		displayName="Филе тунца с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе тунца с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_CatShark_Potato: RRP_Item
	{
		count=1;
		displayName="Картофель с акульим мясом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Акулье мясо с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_CatShark_Potato_L";
		};
	};
	class RRPItem_Container_CatShark_Potato_L: RRP_Item
	{
		count=1;
		displayName="Картофель с акульим мясом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Акулье мясо с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_CatShark_Rice: RRP_Item
	{
		count=1;
		displayName="Рис с акульим мясом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Акулье мясо с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -60%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=60;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_CatShark_Rice_L";
		};
	};
	class RRPItem_Container_CatShark_Rice_L: RRP_Item
	{
		count=1;
		displayName="Рис с акульим мясом ";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Акулье мясо с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -60%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=60;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Salema_Potato: RRP_Item
	{
		count=1;
		displayName="Филе салемы с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе салемы с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -55%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=55;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Salema_Potato_L";
		};
	};
	class RRPItem_Container_Salema_Potato_L: RRP_Item
	{
		count=1;
		displayName="Филе салемы с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе салемы с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Salema_Rice: RRP_Item
	{
		count=1;
		displayName="Филе салемы с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе салемы с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -55%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=55;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Salema_Rice_L";
		};
	};
	class RRPItem_Container_Salema_Rice_L: RRP_Item
	{
		count=1;
		displayName="Филе салемы с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе салемы с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -55%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=55;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Mullet_Potato: RRP_Item
	{
		count=1;
		displayName="Филе кефали с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе кефали с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Mullet_Potato_L";
		};
	};
	class RRPItem_Container_Mullet_Potato_L: RRP_Item
	{
		count=1;
		displayName="Филе кефали с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе кефали с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Mullet_Rice: RRP_Item
	{
		count=1;
		displayName="Филе кефали с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе кефали с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -55%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=55;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Mullet_Rice_L";
		};
	};
	class RRPItem_Container_Mullet_Rice_L: RRP_Item
	{
		count=1;
		displayName="Филе кефали с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе кефали с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -55%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=55;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Ornate_Potato: RRP_Item
	{
		count=1;
		displayName="Изысканное филе с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Изысканное филе с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -60%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=60;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Ornate_Potato_L";
		};
	};
	class RRPItem_Container_Ornate_Potato_L: RRP_Item
	{
		count=1;
		displayName="Изысканное филе с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Изысканное филе с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -60%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=60;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Ornate_Rice: RRP_Item
	{
		count=1;
		displayName="Изысканное филе с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Изысканное филе с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Ornate_Rice_L";
		};
	};
	class RRPItem_Container_Ornate_Rice_L: RRP_Item
	{
		count=1;
		displayName="Изысканное филе с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Изысканное филе с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -80%<br/>Регенерация: +15%/за 30 сек.";
		class Interactions: RRP_Effect
		{
			hunger=80;
			Gheal[]={15,30};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Mackrel_Potato: RRP_Item
	{
		count=1;
		displayName="Филе скумбрии с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе скумбрии с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Mackrel_Potato_L";
		};
	};
	class RRPItem_Container_Mackrel_Potato_L: RRP_Item
	{
		count=1;
		displayName="Филе скумбрии с картошкой";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе скумбрии с картофелем очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -50%<br/>Регенерация: +30%/за 60 сек.";
		class Interactions: RRP_Effect
		{
			hunger=50;
			Gheal[]={30,60};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
	class RRPItem_Container_Mackrel_Rice: RRP_Item
	{
		count=1;
		displayName="Филе скумбрии с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 100%<br/>Филе скумбрии с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container_Mackrel_Rice_L";
		};
	};
	class RRPItem_Container_Mackrel_Rice_L: RRP_Item
	{
		count=1;
		displayName="Филе скумбрии с рисом";
		mass=7;
		scope=2;
		author="RRP";
		picture="\RRP_items\images\Container.paa";
		model="a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
		descriptionShort="Состояние: 50%<br/>Филе скумбрии с рисом очень полезное блюдо с великолепным вкусом. Вы должны попробовать это! <br/>Голод: -65%<br/>Регенерация: +20%/за 40 сек.";
		class Interactions: RRP_Effect
		{
			hunger=65;
			Gheal[]={20,40};
			diareaChance=2;
			CD=30;
			newItem="RRPItem_Container";
		};
	};
};
