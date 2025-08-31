[

"other_ref1",
	[[ref1_control] call RRPClient_refinery_mapInfo],

"other_ref2",
	[[ref2_control] call RRPClient_refinery_mapInfo],

"other_ref3",
	[[ref3_control] call RRPClient_refinery_mapInfo],

"other_ref4",
	[[ref4_control] call RRPClient_refinery_mapInfo],

"nat_golds",
	[format ["<t font='RobotoCondensedBold'>Возможность ограбить доступна в субботу и среду с 20 часов</t>"]],

"RRP_Proc_Clay",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/> %1 <br/>", "RRP_Clay_Proc" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_Mineral",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/> %1 <br/>", "RRP_Mineral_Proc" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_ShaleOil",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/> %1 <br/>", "RRP_Gasolin_Proc" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_Wheat",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/> %1 <br/>", "RRP_Wheat_Proc" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_Sulfur",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/> %1 <br/>", "RRP_Sulfur_Proc" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_Glass",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/> %1 <br/>", "RRP_Sand_Proc" call RRPClient_markerfeed_util_getRecipe]],

	/* Нелегальные */
"RRP_Proc_RZ_1",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/> %1 <br/>", "RRP_RZ_Proc_1" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_RZ_2",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/> %1 <br/>", "RRP_RZ_Proc_2" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_Scallops",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/> %1 <br/>", "RRP_Proc_Scallops" call RRPClient_markerfeed_util_getRecipe]],
"RRP_Proc_Palladium",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/> %1 <br/>", "RRP_Palladium_Proc" call RRPClient_markerfeed_util_getRecipe]],


"RRP_Buyer_Fruits",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>овощей</t><br/>
			<t font='RobotoCondensedBold'>Яблоко</t> - %1 $<br/><br/>
			<t font='RobotoCondensedBold'>Картофель</t> - %2 $<br/><br/>
			<t font='RobotoCondensedBold'>Рис</t> - %3 $<br/><br/>",

			("RRP_Apple" call RRPClient_markerfeed_util_getprice),
			("RRP_Potato" call RRPClient_markerfeed_util_getprice),
			("RRP_Rice" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Artef",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>овощей</t><br/>
			<t font='RobotoCondensedBold'>Хлам</t> - %1 $<br/><br/>
			<t font='RobotoCondensedBold'>Подвеска</t> - %2 $<br/><br/>
			<t font='RobotoCondensedBold'>Браслет</t> - %3 $<br/><br/>
			<t font='RobotoCondensedBold'>Ложка</t> - %4 $<br/><br/>
			<t font='RobotoCondensedBold'>Украшение</t> - %5 $<br/><br/>
			<t font='RobotoCondensedBold'>Пустая банка</t> - %6 $<br/><br/>
			<t font='RobotoCondensedBold'>Медальон</t> - %7 $<br/><br/>
			<t font='RobotoCondensedBold'>Корона</t> - %8 $<br/><br/>
			<t font='RobotoCondensedBold'>Диадема</t> - %9 $<br/><br/>
			<t font='RobotoCondensedBold'>Золотая монета</t> - %10 $<br/><br/>",

			("RRP_Treasure_1" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_2" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_3" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_4" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_5" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_6" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_7" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_8" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_9" call RRPClient_markerfeed_util_getprice),
			("RRP_Treasure_10" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Clay",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>кирпича</t><br/>
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",

			("RRP_Brick" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_ShaleOil",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>безнина</t><br/>
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",

			("RRP_ClearGasolin" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Matches",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>спичек</t><br/>
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",

			("RRP_Matches" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Wheat",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>хлеба</t><br/>
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",

			("RRP_Bread" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Glass",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>стекла</t><br/>
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",
			("RRP_Glass" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Mining",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>минералов и руды</t>.<br/>
			<t font='RobotoCondensedBold'>Уголь</t> - %1 $<br/>
			<t font='RobotoCondensedBold'>Медь</t> - %2 $<br/>
			<t font='RobotoCondensedBold'>Железо</t> - %3 $<br/>
			<t font='RobotoCondensedBold'>Олово</t> - %4 $<br/>
			<t font='RobotoCondensedBold'>Свинец</t> - %5 $<br/>
			<t font='RobotoCondensedBold'>Никель</t> - %6 $<br/>
			<t font='RobotoCondensedBold'>Серебро</t> - %7 $<br/>
			<t font='RobotoCondensedBold'>Золото</t> - %8 $<br/>
			<t font='RobotoCondensedBold'>Титаний</t> - %9 $<br/>
			<t font='RobotoCondensedBold'>Мифрил</t> - %10 $<br/>
			<t font='RobotoCondensedBold'>Яшма</t> - %11 $<br/>
			<t font='RobotoCondensedBold'>Нефрит</t> - %12 $<br/>
			<t font='RobotoCondensedBold'>Обсидиан</t> - %13 $<br/>
			<t font='RobotoCondensedBold'>Апатит</t> - %14 $<br/>
			<t font='RobotoCondensedBold'>Малахит</t> - %15 $<br/>
			<t font='RobotoCondensedBold'>Янтарь</t> - %16 $<br/>
			<t font='RobotoCondensedBold'>Топаз</t> - %17 $<br/>
			<t font='RobotoCondensedBold'>Опал</t> - %18 $<br/>
			<t font='RobotoCondensedBold'>Рубин</t> - %19 $<br/>
			<t font='RobotoCondensedBold'>Сапфир</t> - %20 $<br/>",

			("RRP_Coal" call RRPClient_markerfeed_util_getprice),
			("RRP_Copper" call RRPClient_markerfeed_util_getprice),
			("RRP_Iron" call RRPClient_markerfeed_util_getprice),
			("RRP_Tin" call RRPClient_markerfeed_util_getprice),
			("RRP_Lead" call RRPClient_markerfeed_util_getprice),
			("RRP_Nickel" call RRPClient_markerfeed_util_getprice),
			("RRP_Silver" call RRPClient_markerfeed_util_getprice),
			("RRP_Gold" call RRPClient_markerfeed_util_getprice),
			("RRP_Titan" call RRPClient_markerfeed_util_getprice),
			("RRP_Mithril" call RRPClient_markerfeed_util_getprice),
			("RRP_Yashma" call RRPClient_markerfeed_util_getprice),
			("RRP_Nephritis" call RRPClient_markerfeed_util_getprice),
			("RRP_Obsidian" call RRPClient_markerfeed_util_getprice),
			("RRP_Apatit" call RRPClient_markerfeed_util_getprice),
			("RRP_Malachit" call RRPClient_markerfeed_util_getprice),
			("RRP_Amber" call RRPClient_markerfeed_util_getprice),
			("RRP_Topaz" call RRPClient_markerfeed_util_getprice),
			("RRP_Opal" call RRPClient_markerfeed_util_getprice),
			("RRP_Ruby" call RRPClient_markerfeed_util_getprice),
			("RRP_Sapphire" call RRPClient_markerfeed_util_getprice)
			]
	],

"RRP_Buyer_Scallops",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>мяса гребешков</t>.
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",

			("RRP_Scallops_Meat" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_Palladium",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>палладия</t>.
			<t font='RobotoCondensedBold'>Цена</t> - %1 $<br/><br/>",

			("RRP_Palladium_Ref" call RRPClient_markerfeed_util_getprice)
			]
	],
"RRP_Buyer_RZ_1",
	[
		format [
			"
			<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>
			Точка сбыта <t font='RobotoCondensedBold'>наркотиков</t>.
			<t font='RobotoCondensedBold'>Кокаин</t> - %1 $<br/>
			<t font='RobotoCondensedBold'>Гашишное масло</t> - %2 $<br/>
			<t font='RobotoCondensedBold'>Самокрутка</t> - %3 $<br/>
			<t font='RobotoCondensedBold'>Героин</t> - %4 $<br/>",

			("RRP_Cocaine" call RRPClient_markerfeed_util_getprice),
			("RRP_Hemp" call RRPClient_markerfeed_util_getprice),
			("RRP_Cigarette" call RRPClient_markerfeed_util_getprice),
			("RRP_Heroin" call RRPClient_markerfeed_util_getprice)
			]
	],

"RRP_Buyer_RZ_Money",
	[format ["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>Отмывка <t font='RobotoCondensedBold'>грязных</t> денег."]],


"RRP_Gather_Mining_1",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Рудник для добычи горнорудных металлов, для добычи вам нужна кирка!"],

"RRP_Gather_Rice_1",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Рисовое поле, для добычи вам нужна лопата!"],

"RRP_Gather_Potato_1",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Кортофельное поле, для добычи вам нужна лопата!"],

"RRP_Gather_Mineral_1",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Рудник для добычи минералов, для добычи вам нужна кирка!"],

"RRP_Gather_Cotton",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Хлопковое поле, добывать нужно с помощью рук"],

"RRP_Gather_Wheat",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Пшеничное поле, для добычи нужен комбайн, который продается в магазине индустриальной техники"],

"RRP_Gather_Mining",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Рудник для добычи минералов, для добычи вам нужна кирка!"],

"RRP_Gather_Apple",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Яблоневый сад, идеальный ресурс для новичков. Для добычи не требуется никаких инструментов "],

"RRP_Gather_Clay",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Месторождение глины, для добычи нужна кирка"],

"RRP_Gather_Sulfur",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>Месторождение серы, для добычи нужна лопата"],

"RRP_Gather_Hunt",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#ff00a8' >легальный</t><br/><br/>В этих местах обитают такие виды животных как: куры, петухи, козы, барашки. Многие местные жители охотятся для готовки сытных блюд "],



"RRP_Gather_Tobacco",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],

"RRP_Gather_Hemp",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],

"RRP_Gather_Opium",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],

"RRP_Gather_Cocaine",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],

"RRP_Gather_Palladium",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],

"RRP_Gather_Sulfur",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],

"RRP_Gather_Sulfur",
		["<t font='RobotoCondensedBold'>Статус</t> - <t color='#00d702' >нелегальный</t><br/><br/>"],



"grp_PD",
	[
		"
		<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00b2ff' >Полиция</t><br/>
		Полицейский Департамент о. Алтис представляет собой оплот законности и является гарантом безопасности Граждан республики.
		Имея в своем распоряжении передовые средства для обнаружения и нейтрализации угроз, а так же обладая сильным кадровым составом - Полицейский Департамент в состоянии пресечь любое правонарушение.
		Специальные подразделения Полицейского Департамента включают в себя Национальное Бюро Расследований, Береговой Патруль, Патрульно Постовую службу,
		а так же спецбатальон сотрудников Государственной Инспекции Дорожного Движения и Кадетский Корпус, что полностью гарантирует безопасность во всех сферах жизнедеятельности граждан.
		Девиз Полицейского Департамента: 'Неважно, что произойдет - ПД всегда идет вперед!'
		"
	],

"grp_FBI",
	["<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00b2ff' >Полиция</t><br/>Штаб-квартира FBI, внутри которой размещены все подконтрольные подразделению отделы. Вуаль тайны окутывает эту закрытую территорию, на которой, по легендам острова, пропало немало бандитов.Никто не знает сотрудников этой организации в лицо, мало кто может подтвердить, что видел их в живую... Но все те, кто мог бы рассказать об этом - вряд ли станут рисковать."],

"grp_KPP",
	["<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00b2ff' >Полиция</t><br/>КПП на участке Национальной трассы Атира-Пиргос является стационарным пунктом проверки документов и досмотра автомобилей.На территории КПП соблюдается скоростной режим с ограничением в 50км/ч."],

"grp_base_cop_jail_1",
	["<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00b2ff' >Полиция</t><br/>Центральная Тюрьма острова - главное исправительное учреждение республики, включающее в себя сеть корпусов и административных зданий, обнесенных высокой стеной.Тюрьма является режимным объектом и на ее территории действую строгие правила поведения и содержания заключенных."],

"grp_wolves",
	["The Wolvesнастолько крутые что не знают как в двух словах описать свою организацию..."],

"grp_imperium_spawn_1",
	["Известный синдикат Sumiyushi-kai, занимающий важное место в жизни острова, организованный для борьбы с революцией для своей выгоды.На данный момент владеет некоторыми горнорудными компаниями. Синдикат сотрудничает с гражданскими группировками и государственными структурами в своих целях,поддерживает гражданское население, тем самым расширяя влияние синдиката на острове. Так же ходят легенды, что на их базе похоронена мать Лики Хана<br/><br/>"],

"grp_deadlock_spawn_1",
	["Damned Knights настолько крутые что не знают как в двух словах описать свою организацию..."],

"grp_sector_spawn",
	["Sector 7, особо жестокое военное содружество, основано на прибрежье Тихого океана и имеет тесную связь с различными структурами имеющие негативные последствия в сферах своей деятельности. Как и все ЧВК за определенные условия найма организация занималась похищениями людей, подрывом зданий, убийствами невинных граждан, пропагандой и установлением законов направленных на развитие своего влияния.Основатели организации до сих пор не известны, Sector 7 несёт ответственность за самые жестокие злодеяния"],

"grp_Phoenix_spawn_1",
	["Частная международная корпорация, которая имеет огромное влияние в мире. Занимается производством, транспортировкой, охраной, а также продажей БИО технологий.Благодаря грамотному управлению и взвешенной политики компании приобрела в собственность у правительства Алтиса целый остров! Поговаривают, что именно на этом острове и расположена секретная лаборатория по производству, а также испытанию биологического оружия, но официальных доказательств нет.Корпорация ведет независимую от государства Алтиса политику!"],

"grp_CWRKA_spawn_1",
	["Центральный Военно Революционный Комитет Алтиса (ЦВРКА) - это учреждение, которое находится на территории старого форпоста.Военный комплекс располагает современнейшим промышленным оборудованием, что позволяет организации сотрудничать с различными группировками и выстраивать взаимовыгодные торговые отношения.Данное ведомство является идеологическими сторонниками революции ради объединения различных людей и групп в одну структуру с целью смены преступного режима на острове.Комитет вербует гражданских в рабочих революционеров и возглавляет союз вольных повстанцев."],

"grp_base_hospital_",
	["Департамент Министерства чрезвычайных Ситуаций О. Алтис предоставляет такие услуги как: оказание первой медицинской помощи, профилактике заболеваний, проведении поисково-спасательных мероприятий.Так же обслуживание транспортного средства: ремонт, и установка улучшений."],

"grp_cigane_spawn_m_1",
	["Цыганы настолько крутые что не знают как в двух словах описать свою организацию..."],

"grp_blacksnow_spawn_m_1",
	["Организация BlackSnow является гражданской нейтральной группировкой.Основная деятельность - это предоставление рабочих мест гражданским (скупка меди и морских гребешков) и защита мирного населения на подконтрольной территории."],

"grp_news_1",
	["Телеканал 7 news был основан в 2018 году и сразу стал лидером в сфере медиабизнеса. Основной род деятельности,рекламный и медиабизнес,так же телеканал 7news занимается организацией всеразличных мероприятий, и благотворительной деятельностью.Телеканал 7news является государственной компанией и подчиняется не посредственно правительству острова Altis,поговаривают что именно благодаря этому он и остается монополистом в сфере медиабизнеса."],

"grp_LaEscobaro",
	["Организация  La Escobaro Familia! Враждебная Группировка!Владеет всеми Морскими ресурсами.Крайне негативно настроена к сотрудникам государственной власти.Ведет постоянные боевые действия на острове Altis!Создана с целью контроля денежных потоков от Легальных и Нелегальных ресурсов!"],

"gov_grp",
	["Резиденция губернатора, временно закрыта по ненадобности!"],

"grp_kasatky_spawn_1",
	["«КАСАТКИ» является ведущей компанией по добыче и переработке полезных ископаемых.Корпорация тесно сотрудничает со всеми государственными структурами острова, широко участвует в благотворительной деятельности, тем самым воплощая в жизнь одну из основных своих целей – борьбу с бедностью."],

"grp_Umbrella",
	["Акционерное общество “Blood’s” - выходцы из рабочего класса, сплотившихся в группы, надеясь таким образом повысить свои шансы на выживание среди преступного синдиката острова, которых объединяют общие цели и стремления: защита гражданского населения на легальных ресурсах, предоставление возможности заработка."],

"grp_kifo",
	["KIFO - Кровожадный, особо жестокий экстремистский преступный синдикат. Стратегия сосредоточена на торговле наркотиками и разбоях. Группировка контролирует практически весь наркотрафик своей части острова.Кроме наркотиков ещё получает доход с торговли людьми, рэкета, угона транспорта, краж  и грабежей населения. Цель разработать операцию по захвату всей территории и обоснование своей республики."],

"grp_Constant_spawn_1",
	[
	"Акционерное общество “Blood’s” - выходцы из рабочего класса, сплотившихся в группы, надеясь таким образом повысить свои шансы на выживание среди преступного синдиката острова, которых объединяют общие цели и стремления: защита гражданского населения на легальных ресурсах, предоставление возможности заработка."
	],

"grp_base_reb_4",
	["<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00d702' >Бандиты</t><br/><br/>Место вербовки в бандитов. За приличную сумму вам сделают пропуск к темной стороне, это даст вам возможность заниматся нелегальным заработком и пользоватся арсеналом бандитом"],

"grp_base_reb_31",
	["<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00d702' >Бандиты</t><br/><br/>Северный лагерь бандитов, место базирования бандитов и людей которые отреклись от власти"],

"grp_base_reb_3",
  ["<t font='RobotoCondensedBold'>Фракция</t> - <t color='#00d702' >Бандиты</t><br/><br/>Столица бандитов, место базирования бандитов и людей которые отреклись от власти"],

"vehshop_car",
	["Местный автосалон, в нем вы сможете найти себе машину на любой цвет, вкус и размер кошелька. В данном месте продаются только легковые автомобили"],

"vehshop_truck",
	["Автосалон грузовой техники. Представлен большой выбор комерческой технки. В данном месте продаются только автомобили для перевозок грузов"],

"vehshop_industrial",
	["Автосалон индустриальной техники, сейчас в наличии только пару моделей комбайнов, а в целом только они и пользуются спросом"],

"vehshop_moto",
	["Мотосалон, ассортимент не велик, но представленны очень даже не плохие модели, такие как: TODO"],

"dp_",
	["Один из пунктов, местной почтовой служби. Жители за частую используют их для ориентира на карте"],

"atm_",
	["Для взаимодействия с ним нажмите Win-key"],

"other_port_work",
	["Работа в порту, хорошо подходит для новичков, которые очень нуждаются хоть в каких то деньгах."],

"port_",
	["Морской порт, здесь можно купить лодку или воспользоватся публичным гаражем лодок"],

"garage_",
	["Публичный гараж"],

"other_hunt",
	["Охотничьи угодья. Ареал обитания диких животных, тут вы можете встретить диких коз, куропаток, редкий вид алтийских петушков,а так же горных барашек"],

"other_dhl",
	["Офис местной и единственной почтовой служби. И как всегда она нуждается в сотрудниках, попасть на работу к ним очень просто, достаточно иметь права и не поленится приехать к ним для получение формы, машины и груза"],

"other_pirates_harbor",
	["Пиратская гавань, по одной из легенд, возникла  во время золотой лихорадки, местные бандюки использовали ее в качестве буферной зоны для дальнейшего экспорта. Сейчас это популярное место среди криминального круга, там сосредоточенна перебивка водного транспорта, скупка скандия и золота"],

"shop_cloth",
	["Большой ассортимент качественной одежды, тут вы можете найти любые вещи, а так же акссесуары на любой вкус и кошелек"],

"shop_apteka",
	["Продаются медикаменты первой помощи"],

"shop_genstore",
	["Магазин бытовых товаров, в продаже имеются орудия труда, приспособления для кулинариии и другие различные вещи для выживания на острове"],

"shop_diving",
	["Продается дайверское снаряжение для погружения под воду"],

"shop_license",
	["В данном месте вы можете приобрести лицензию на различную деятельность"],

"other_bank",
	["Отделение банка, в нем можно взять кредит"],

"shop_woomen_cloch",
	["Женский магазин одежды"],

"other_speed_",
	["Скоростные радары"],

"chop_shop",
	["Подпольный гараж который специлизируется на скупке краденых авто, а так же их перебивке"],

"civ_",
	["Гражданский"],

"reb_",
	["Бандит"],

"cop_",
	["Полицейский"],

"med_",
	["Медик"],

"LTDStore_",
	["Частный магазин"],

"slavery_",
	["Торговец людьми, работает только с бандитами"],

"death_warn_",
	["Вам запрещено взаимодействовать с людьми, которые повлияли на вашу смерть и продолжать участвовать в данном процессе после смерти "]
];
