/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd

*/
private ["_mod","_display","_ctrlStrText","_ctrlGroup","_sliderIDC","_ctrlLB","_index","_ctrlBtnStartQuest","_questList","_currentQuest","_questsList","_textForSlider","_arrayTextForSlider","_arrayTextForOneSlider"];
_mod = _this;
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
_ctrlGroup = _display displayCtrl 1020;
_ctrlStrText = _ctrlGroup controlsGroupCtrl 1022;
_ctrlLB = _display displayCtrl 1023;

_ctrlStrText ctrlSetStructuredText parseText "";
lbClear _ctrlLB;
{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
} forEach [_ctrlLB,_ctrlStrText];

_sliderIDC = 1025;
if !(isnil "amountIndicators") then {
  for "_i" from _sliderIDC to (_sliderIDC + amountIndicators + 4) do {
    ctrlDelete (_display displayCtrl _i);
    amountIndicators = nil;
  };
};
infoListForSlider = nil;
curSlider = nil;

ctrlDelete (_display displayCtrl 2001);

switch (_mod) do {
    case ("quests"): {
      _questList = player getVariable ["rrpvar_questsList",[]];
      _currentQuest = _questList findIf {_x isEqualTo 0};
      _questsList = call RRPClient_forBeginner_missionsCfg;

      _arrayTextForSlider = [];
     {
      _arrayTextForOneSlider = [];
      _textForSlider = format ["<t color='#FFFFFF' align = 'center' font = 'RobotoCondensedLight'><t size = '1.3' font = 'overwatch'>%1</t><br/>%2<br/><br/><t size = '1.2' font = 'RobotoCondensedBold'>Инструкция</t><br/>%3<br/><br/>Вознаграждение: %4%5</t>",(_x select 0),(_x select 1),(_x select 2),((_x select 3) select 1),(if (((_x select 3) select 0) isEqualTo "atm") then {"$"} else {"RC"})];
      _arrayTextForOneSlider pushBack false;
      _arrayTextForOneSlider pushBack _textForSlider;
      _arrayTextForSlider pushBack _arrayTextForOneSlider;
     } forEach _questsList;

      _ctrlBtnStartQuest = _display ctrlCreate ["RRP_btn_green", 2001];
      _ctrlBtnStartQuest ctrlSetPosition [0.430391 * safezoneW + safezoneX,0.61 * safezoneH + safezoneY,0.139219 * safezoneW,0.044 * safezoneH];
      _ctrlBtnStartQuest ctrlSetText "Начать";
      _ctrlBtnStartQuest buttonSetAction format ["%1 call RRPClient_forBeginner_missionStart",_currentQuest];
      _ctrlBtnStartQuest ctrlCommit 0;

      _arrayTextForSlider call RRPClient_forBeginner_createSlider;
    };
    case "freshpawn" : {
        _ctrlStrText ctrlSetStructuredText parseText "<t><t size='1' color='#FFFFFF' align='center' valign='middle'  font='RobotoCondensedLight' ><img color='#FFFFFF' size='8' align = 'center' image='\RRP_icons\forBeginners\forBeginner.paa'></img><br/><br/><t size='1.2' font = 'overwatch'>Привет, салага!</t><br/>Перед тем как самостоятельно познавать этот огромнейший мир, Вам нужно пройти ряд обучающих заданий, это следующая кнопка «Обучение», там рассказаны самые базовые вещи без которых играть невозможно, по этому отнеситесь со всей серьезностью и ничего не пропускайте и будьте внимателен. Удачи Вам в этом долгом и тернистом пути!</t>";
    };
    case "control" : {
      lbClear _ctrlLB;
      {
          _index = _ctrlLB lbAdd (_x select 1);
          _ctrlLB lbSetTextRight [_index, (_x select 0)];
          _ctrlLB lbSetTooltip [_index, (_x select 2)];
          if ((_x select 0) isEqualTo "") then {_ctrlLB lbSetColor [_index, [0, 1, 0, 0.5]]};
      } forEach [
        ["","*ИГРОК*",""],
          ["Y"," Планшет","Меню игрока"],
          ["Ctrl + Tab"," Громкость речи","Шепот/разговор/крик"],
          ["Shift + Page up"," Беруши [Убавить]","Увелечение громкости окружающей среды"],
          ["Shift + Page down"," Беруши [Заглушить]","Уменьшение громкости окружающей среды"],
          ["I"," Инвентарь","Инвентарь персонажа"],
          ["Shift + V"," Поднять руки","Поднять руки"],
          ["V"," Перешагнуть",""],
          ["Shift + Пробел"," Прыжок",""],
          ["F"," Оружие","Быстро достать оружие"],
          ["Правый Enter"," Смена вида","Переключатель между видом от 1го и 3го лица"],
          ["От 1 до 0"," Жесты","Различные жесты"],
          ["Shift + Num1"," Танцы",""],
          ["Shift + Num2"," Жесты",""],
          ["Shift + Num3"," Жесты №2",""],
        ["","",""],

        ["","*ТРАНСПОРТ*",""],
          ["U"," Открыть","Наведитесь на машину что-бы открыть/закрыть ее"],
          ["Скролл"," Сесть","Прокрутите колесиком мыши для вызова действия"],
          ["Скролл"," Инвентарь","Прокрутите колесиком мыши для вызова действия"],
          ["Win"," Действия","Перевернуть/высадить/взломать..."],
          ["T"," Инвентарь для ресурсов","В него складываются ресурсы"],
          ["L"," Свет","Включение фар"],
          ["Q,E"," Поворотники",""],
          ["X"," Ручник","Для авиатехники работает как автозависание"],
          ["Mouse1"," Сигнал",""],
          ["V"," Выйти из ТС","Двойное нажатие - выход из транспорта в движении"],
          ["Z"," Посадка","Посадка воздушного транспорта"],
        ["","",""],

        ["","*ВЗАИМОДЕЙСТВИЯ*",""],
          ["Win"," Взаимодействие","Взаимодействие с техникой, домом, связаным игроком"],
          ["Shift + G"," Ударить","Возможно только имея оружие в руке"],
          ["Shift + R"," Связать","Связать оглушенного/поднявшего руки человека"],
        ["","",""],

        ["","*РАЦИЯ*",""],
          ["Caps Lock"," Говорить","В момент разговора нужно зажимать кнопку"],
          ["Ctrl + P"," Рация КВ","КВ - короткие волны, не более 5км"],
          ["Alt + P"," Рация ДВ","ДВ - дальние волны, по умолчанию установлен в транспорте"],
          ["Ctrl + ~"," Рация ПР","Настройка подводной рации"],
          ["Ctrl + Caps"," Подводная рация","Радиус действия очень мал"],
        ["","",""],

        ["","*ПРОЧЕЕ*",""],
          ["SHIFT + T"," Пинг-Метка","Пинг метка используемая в тусовке"],
          ["N"," ПНВ","Прибор ночного видения"],
          ["M"," Карта","Топографическая карта"],
          ["Ctrl + M"," GPS","GPS"],
          ["Shift + Num5"," Военное положение","Установка военного положения"]
      ];
    };
    case "fraction" : {
      [
        [true,"\RRP_icons\forBeginners\fraction_civ.paa","Гражданские","Каждый человек, первый раз прибывая на остров, получает паспорт гражданина. Государство выплачивает пособия, защищает силами правоохранительных органов, заботится о здоровье работниками службы спасения. Каждый гражданин занимается, как правило, легальной деятельностью, и, возможно, скрытыми нелегальными махинациями."],
        [true,"\RRP_icons\forBeginners\fraction_cop.paa","Полиция","Гарант безопасности и спокойствия мирных граждан государства. Как правило, долгожитель острова, не замеченный в криминальной активности в прошлом, отлично знающий правила проекта и внутренние распоряжения своей структуры. Этот человек никогда не откажет в помощи, поможет освоиться новоприбывшим и вытащит вас из трудных ситуаций."],
        [true,"\RRP_icons\forBeginners\fraction_med.paa","Медики","Государственная служба острова Altis. Создана для спасения жизней людей в большинстве сложных ситуаций, таких как тяжелое ранение, авария, катастрофа. Обратиться к ним можно для психологической помощи, а также чтобы избавиться от наркозависимости. Нейтральная роль, призванная помогать всем жителям острова Altis, не совершивших особо тяжких преступлений. Также они могут усовершенствовать ваш транспорт."],
        [true,"\RRP_icons\forBeginners\fraction_taxi.paa","Служба такси","Профессия является совсем непростой, сложность работы водителя такси заключается в том, что и в мороз, и в жару, одним словом - при любых погодных условиях и в любое время суток таксист выезжает на дорогу с целью помочь людям, которым надо срочно добраться домой, в аэропорт, на вокзал, на дачу или в любое другое место. Профессиональным и опытным водителям такси не страшны никакие природные катаклизмы, они всегда на линии.Занимаются мелким бизнесом. Ко всем жителям острова относятся нейтрально. Не имеют союзов, не имеют врагов организации Не представляет угрозы для вашей жизни."],

        [true,"\RRP_icons\forBeginners\fraction_news.paa","Новостное агенство","Телеканал 7 news был основан в 2018 году и сразу стал лидером в сфере медиабизнеса. Основной род деятельности,рекламный и медиабизнес,так же телеканал 7news занимается организацией всеразличных мероприятий, и благотворительной деятельностью.
    		Телеканал 7news является государственной компанией и подчиняется не посредственно правительству острова Altis,поговаривают что именно благодаря этому он и остается монополистом в сфере медиабизнеса."],

        [true,"\RRP_icons\forBeginners\WIP.paa","Министерство юстиции","Одна из структур гражданской государственной службы Республики Altis, основной целью которой является защита конституционных прав и свобод гражданина Республики Лемнос."],
        [true,"\RRP_icons\forBeginners\WIP.paa","Бандиты","Не граждани (лица без гражданства) острова Лемнос, принявшего решение отречься от государства. Они могут быть революционерами, преступниками, наркоторговцами, бандитами. Они не защищены государством, им закрыт доступ на любой легальный бизнес, но при этом, для них открыты безграничные возможности для ведения криминальной деятельности и сбыта нелегальных ресурсов."],
        [true,"\RRP_icons\forBeginners\fraction_privateOrg.paa","Приватные организации","Приватные организации отличаются от государственных тем что она создана и поддерживается и финансируется частными лицами, у них свои частные поставки оружия и снаряжения. Род деятельности таких организаций может быть абсолютно любой, от корпорации по производству продуктов питания, ценных металов, до наркокортеля. По поводу создания таких организаций обращайтесь к администрации"]
      ] call RRPClient_forBeginner_createSlider;
    };
    case "farm" : {
      [
        [true,"\RRP_icons\forBeginners\work_port.paa","Грузчик","Это работенка для новичков, находится она в порту в Пиргосе. Работа заключается в том что-бы носить ящики с точка A в точку B. За каждый принесенный ящик вы получаете некую сумму денег. На карте она отмечена как <img image='\welmen_newmarks\icons\welmen_other_work-in-docks.paa'></img> «Работа в порту»"],
        [true,"\RRP_icons\forBeginners\work_combine.paa", "Комбайн", "С помощью комбайна происходит сбор пшеницы которая является основным ингредиентом для выпекания хлеба, а так же является компонентом для создания фирменного пива Jim Beam. Комбайн с помощью которого осуществляется сбор, продается в автосалоне индустриальной техники. Локация для сбора называется <img image='\welmen_newmarks\icons\welmen_production_violet_hoe.paa'></img> «Пшеничное поле»"],
        [true,"\RRP_icons\forBeginners\work_diving.paa","Дайвер","В профессию дайвера входит целый комплекс по добыче класса Двустворчатых, а именно добыча морских гребешков и различные виды устриц, локации на карте обозначены маркером <img image='\welmen_newmarks\icons\welmen_production_violet_fishing.paa'></img> . Для данной работы необходимо снаряжение для погружения под воду"],
        [true,"\RRP_icons\forBeginners\work_fishing.paa","Рыбалка","Является источников добычи пищи. На карте размещено несколько зон для рыбалки которые отображаются как <img image='\welmen_newmarks\icons\welmen_production_violet_fishing.paa'></img> «Рыбалка», что-бы заниматься этой деятельностью вам необходима только лодка"],
        [true,"\RRP_icons\forBeginners\work_hunting.paa","Охота","Охота это один из основных источников добычи пищи. Профессия не мудреная, вам нужно лишь приехать на охотничье угодья <img image='\welmen_newmarks\icons\welmen_production_grey_hunt.paa'></img> и иметь при себе оружие и обычный нож для того что-бы освежевать дичь "],
        [true,"\RRP_icons\forBeginners\work_gas.paa","Нефтяник","Профессия нефтяник подразумевает под собой добычу газа и нефти, а так же остального что производится с этих компонентов. Для работы вам необходим только грузовик. Локации на карте отображаются <img image='\welmen_newmarks\icons\welmen_other_sweetwater.paa'></img>"],
        [true,"\RRP_icons\forBeginners\work_DHL.paa","Служба доставки","Легкая и низкооплачиваемая профессия, что-бы начать работать, вам требуется проследовать в офис DHL, обязательно одеться в форму сотрудника и после чего можно брать автомобиль"],
        [true,"\RRP_icons\forBeginners\work_turtleFarm.paa","Отлов черепах","Основное отличие этой профессии от других заключается в том что она нелегальная, этот промысел считается браконьерством и преследуется законом. Но риск оправдан высокой ценой. Для отлова вам необходим костюм для дайвинга и оружие для подводной стрельбы, которое продается на столице Бандитизма. Локация для отлова называется <img image='\welmen_newmarks\icons\welmen_production_red_fishing.paa'></img> «Южное течение». "],
        [true,"\RRP_icons\forBeginners\work_mining.paa","Добыча полезных ископаемых","Одна из самых сложных и интересных профессий на острове. Она делится на две группы, горнорудка и добыча минералов. Эти группы включают целый комплекс возможных добыче ресурсов, но все они заблокированы к добыче и привязаны к вашему уровню профессии, по мере прокачки уровня, ресурсы будут открываться. Локации залежей этих ресурсов отмечены <img image='\welmen_newmarks\icons\welmen_production_violet_pickaxe.paa'></img> Для данной профессии вам требуется иметь грузовик и кирку"]
      ] call RRPClient_forBeginner_createSlider;
    };
    case "survival" : {
      [
        [true,"\RRP_icons\forBeginners\survival_food.paa","Питание","На сервере присутствует система воды и еды. Вы постоянно будете испытывать голод и жажду, по этому эти показатели нужно пополнять. Есть всего два способа где можно раздобыть еду. Первый, это купить в одном из вендинговых автоматов которые стоят по всей карте и отмечены на карте серым маркером, подробнее в вкладке «Бизнес». Второй - это добыть и приготовить собственноручно. Есть два места где вы можете добывать еду. Это рыбалка и охота, подробнее об этих профессиях читайте во вкладке «Заработок». Ознакомится со всеми рецептами приготовления еды подробнее можете перейдя в меню крафта которое находится в планшете"],

        [true,"\RRP_icons\forBeginners\survival_med.paa","Медицина","Система медицины очень простая и понятная. Есть всего 4 симптома это ушибы, ранения, диарея и зависимости от наркотиков. И ряд медикаментов которые представлены списком ниже
        <t align = 'left'>
          <br/>
          <br/>
             <img image='\rimas_items\pics\detoxin.paa'></img> <t font = 'RobotoCondensedBold'>Детоксин</t> - Избавляет вас от тяжелой и легкой формы зависимости, шанс выздоровления 70%<br/>
             <img image='\rimas_items\pics\vitaminbottle.paa'></img> <t font = 'RobotoCondensedBold'>Витамины</t> - Нужно принимать при диареи, шанс выздоровления 50%<br/>
             <img image='\rimas_items\pics\bandage.paa'></img> <t font = 'RobotoCondensedBold'>Бинты</t> - Останавливает кровотечение и используется  при ушибах<br/>
             <img image='\rimas_items\pics\antibiotic.paa'></img> <t font = 'RobotoCondensedBold'>Антибиотики</t> - Курс антибиотиков поправил ваще здоровье и избавил от болезней, шанс выздоровления 50%<br/>
             <img image='\rimas_items\pics\painkillers.paa'></img> <t font = 'RobotoCondensedBold'>Обезболивающие</t> - Нейтрализует шок травматического эффекта, , шанс выздоровления 80% <br/>
             <img image='\rimas_items\pics\bp_morphine_ca.paa'></img> <t font = 'RobotoCondensedBold'>Морфин</t> - Снимает негативный эффект от критического ранения, шанс выздоровления 90%<br/>
        </t>
        "],
        [true,"\RRP_icons\forBeginners\survival_Buffs.paa","Стимуляторы","Стимуляторы или как их называют еще «баффы» это ряд веществ которые стимулируют какие то из ваших умений, например выносливость. Некоторые из них вызывают наркотическую зависимость. Подробный список данных веществ представлен ниже
        <t align = 'left'>
          <br/>
          <br/>
            <img image='\rimas_items\pics\buffout.paa'></img> <t font = 'RobotoCondensedBold'>Баффаут</t> - Убирает усталость при беге на 5 мин и не вызывает зависимости<br/>
            <img image='\rimas_items\pics\jet.paa'></img> <t font = 'RobotoCondensedBold'>Джет</t> - Убирает усталость при беге на 10 мин и вызывает легкую зависимость с шансом 10%<br/>
            <img image='\rimas_items\pics\psycho.paa'></img> <t font = 'RobotoCondensedBold'>Психо</t> - Убирает усталость при беге на 15 мин и вызывает тяжелую зависимость с шансом 15%<br/>
            <img image='\rimas_items\pics\radx.paa'></img> <t font = 'RobotoCondensedBold'>RadX</t> - Делает вас невосприимчивым к радиации на 20 минут <br/>
        </t>
        "]
      ] call RRPClient_forBeginner_createSlider;
    };
    case "busines" : {
      _ctrlStrText ctrlSetStructuredText parseText "<t><t size='1' color='#FFFFFF' align='center' valign='middle'  font='RobotoCondensedLight' >
        <img color='#FFFFFF' size='8' align = 'center' image='\RRP_icons\forBeginners\bussines_vending.paa'></img><br/><br/><t size='1.2' font = 'overwatch'>Бизнес</t><br/>
       </t>";
    };

};
[_ctrlStrText, 0, 0] call BIS_fnc_ctrlFitToTextHeight;
