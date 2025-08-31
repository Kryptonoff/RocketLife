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
[
  {
    try {
      "Нажмите «M» что-бы открыть карту..." call RRPClient_forBeginner_watermark;
      waitUntil {visibleMap or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      ["all",RRPClient_markers_idc] call RRPClient_markers_switch;
      uiSleep 2;
      ["1/4<br/>Карта","На карте отображены все локации, магазины, добычи, организации и много чего другого. Так как карта очень насыщена и в этом легко затарятся, есть ряд инструментов для удобства"] call RRPClient_forBeginner_guideNotification;
      if !(visibleMap) throw "";
      uiSleep 0.1;
      ["2/4<br/>Фильтр","Он находится слева в углу в виде плитки с иконками. Он позволяет отключить ненужные локации и отображать только те, которые нужны в данный момент"] call RRPClient_forBeginner_guideNotification;
      if !(visibleMap) throw "";
      uiSleep 0.1;
      ["3/4<br/>Поиск","Карта огромная и глаза порой теряются даже используя фильтр. По этому существует поиск, в него достаточно ввести часть названия нужной вам локации и он отобразит ближайшею от вас"] call RRPClient_forBeginner_guideNotification;
      if !(visibleMap) throw "";
      uiSleep 0.1;
      ["4/4<br/>Описание локаций","Что-бы узнать подробней о локации, достаточно навестить курсором мыши на маркер и перед вами будет сводка с краткой информацией "] call RRPClient_forBeginner_guideNotification;
      if !(visibleMap) throw "";
      uiSleep 0.1;
      openMap false;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try {
      uiSleep 0.1;
      ["Планшет 1/2","Нажмите «Y» что бы открыть планшет"] call RRPClient_forBeginner_guideNotification;
      "Нажмите «Y» что бы открыть планшет..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 0.1;
      ["Планшет 2/2","Это меню игрока в облике Планшета, в нем собраны все основные функции по управлению вашим персонажем. Ознакомьтесь с ними",2000] call RRPClient_forBeginner_guideNotification;
      "Ознакомьтесь со вкладками и закройте его для завершения..." call RRPClient_forBeginner_watermark;
      waitUntil {(isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
      closeDialog 0;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try{
      uiSleep 0.1;
      ["1/3<br/>Банкомат","Идите к банкомату, на карте банкоматы отображаются <img image='\welmen_newmarks\icons\welmen_other_atm.paa'></img>. Откройте карту и у фильтре включите раздел «прочее» что-бы отобразить их."] call RRPClient_forBeginner_guideNotification;
      "Найдите банкомат и подойдите к нему..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (findDisplay 2700)) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      ["2/3<br/>Банкомат","Через банкомат можно переводить средства другим игрокам, вносить деньги на общак организации или просто хранить деньги в безопасности. Учитывайте что при переводе есть небольшая комиссия!",2700] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["3/3<br/>Банкомат","Обналичте деньги, они пригодятся в следующем задании",2700] call RRPClient_forBeginner_guideNotification;
      "Обналичте деньги, они пригодятся в следующем задании..." call RRPClient_forBeginner_watermark;
      private _oldCash = RRPClientCashMoney;
      waitUntil {RRPClientCashMoney >  _oldCash};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try{
      uiSleep 0.1;
      ["Магазин одежды 1/2","Найдите на карте магазин одежды <img image='\welmen_newmarks\icons\welmen_shop_violet_cloth.paa'></img> и отправляйтесь к нему"] call RRPClient_forBeginner_guideNotification;
      "Загляните в магазин одежды..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (findDisplay 3100)) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      ["Магазин одежды 2/2","Купите что-то",3100] call RRPClient_forBeginner_guideNotification;
      waitUntil {(isNull (findDisplay 3100)) or !activeQuest};
      uiSleep 0.1;
      ["Вы девушка?","Что-бы получить доступ к женским вещам, обратитесь к медику, чтобы он выдал вам соответствующую отметку"] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try {
      uiSleep 0.1;
      ["1/5<br/>Рация","Найдите на карте универмаг <img image='\welmen_newmarks\icons\welmen_shop_violet_grocery.paa'></img> и следуйте к нему"] call RRPClient_forBeginner_guideNotification;
      "Найти на карте «Универмаг» и зайдите в него..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (findDisplay 38400)) or !activeQuest};
      uiSleep 0.1;
      ["2/5<br/>Рация","Найдите рацию в списке с названием «AN/PRC-148 JEM» и приобретите ее",38400] call RRPClient_forBeginner_guideNotification;
      "Приобрести рацию «AN/PRC-148 JEM»" call RRPClient_forBeginner_watermark;
      waitUntil {!(((assignedItems player) findIf {["tf_anprc148jem_",_x] call RRPClient_util_xString }) isEqualTo -1) or !activeQuest};
      uiSleep 2;
      "delete" call RRPClient_forBeginner_watermark;
      ["3/5<br/>Рация","Нажмите комбинацию клавиш «Ctrl + P» впишите в дисплей частоту 150 и нажмите «ent»",38400] call RRPClient_forBeginner_guideNotification;
      "Нажмите комбинацию клавиш «Ctrl + P» впишите в дислей частоту 150 и нажмите «ent»" call RRPClient_forBeginner_watermark;
      waitUntil {((parseNumber(ctrlText IDC_ANPRC148JEM_RADIO_DIALOG_EDIT_ID)) isEqualTo 150) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 4;
      ["4/5<br/>Рация","Вы вышли на частоту «150» и если другие игроки выйдут на нее тоже, вы сможете общаться с ними. Частоту можно ставить любую в заданом диапазоне. Для это рации диапазон 30-512Гц",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["5/5<br/>Рация","Что-бы говорить в рацию, зажимайте клавишу «Caps-Lock». Вещание в эфир будет только когда кнопка зажата. Двойное нажатие активирует вещание на постоянную основу",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try{
      uiSleep 0.1;
      ["1/7<br/>Орудия труда","Вернитесь в  «Универмаг» и откройте магазин"] call RRPClient_forBeginner_guideNotification;
      "Отройте меню магазина «Универмаг»" call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (findDisplay 38400)) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 0.1;
      ["2/7<br/>Кирка","Служит для добычи минералов и горнорудных металов. Подробнее о профессиях можно узнать во вкладке «Заработок» в инфопанели",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["3/7<br/>Топор","Топор применяется для рубки деревьев, что-бы получить дрова для костра.",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["4/7<br/>Металоискатель","Применяется для раскопок. Подробнее о профессиях можно узнать во вкладке «Зарабаток» в инфопанели",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["5/7<br/>Спички","Нужны для создания костра",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["6/7<br/>Нож","Применяется для открытия консервов, освежевания животных и в других действиях где есть нужда в остром предмете",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["7/7<br/>Открывашка","Применяется для открытия консервов. Альтернатива открывашке - нож",38400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
      closeDialog 0;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try {
      uiSleep 0.1;
      ["1/5<br/>Авторынок","Найдите карте авторынок <img image='\welmen_newmarks\icons\welmen_shop_violet_car.paa'></img> и идите к нему"] call RRPClient_forBeginner_guideNotification;
      "Найдите авторынок на карте и следуйте к нему..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (findDisplay 2300)) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 0.1;
      ["2/5<br/>Авторынок","Что бы вращать камеру вокруг машины, зажмите ПКМ и двигайте мышь",2300] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["3/5<br/>Купите авто","Купите квадроцикл или любую другую технику на которую вам хватает средств",2300] call RRPClient_forBeginner_guideNotification;
      "Купите автомобиль..." call RRPClient_forBeginner_watermark;
      waitUntil {!(life_vehicles isEqualTo []) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 2;
      ["4/5<br/>Закрыть Авто","Если машина открыта, любой игрок может с ней взаимодействовать по этому всегда ее закрывайте. Что бы закрыть вам нужно навестись на технику и нажать «U»"] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["Где найти машину после рестарта?","После рестарта вы cможете найти ваш автомобиль в любом публичном гараже. На карте он отмечен как <img image='\welmen_newmarks\icons\welmen_transport_car-garage.paa'></img>. Если в технике были ресурсы, техника привязывается к ближайшему гаражу на момент рестарта"] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  },

  {
    try {
      uiSleep 0.1;
      ["Зарабаток","Отправляйтесь в яблоневый сад <img image='\welmen_newmarks\icons\welmen_production_violet_hoe.paa'></img>, который находится недалеко от Кавалы"] call RRPClient_forBeginner_guideNotification;
      "Найдите на карте яблоневый сад и направляйтесь туда..." call RRPClient_forBeginner_watermark;
      waitUntil {((player distance2D (getMarkerPos  "RRP_Gather_Apple_2")) < 40) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      ["Добыча","Что бы начать добывать ресурс нажмите клавишу WIN"] call RRPClient_forBeginner_guideNotification;
      "Нажмите WIN для сбора персиков..." call RRPClient_forBeginner_watermark;
      waitUntil {(life_inv_RRP_Apple > 0) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      uiSleep 0.1;
      ["Ресурс","Вы добыли свой первый ресурс. Ресурсы отличаются от других игровых предметов."] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["Инвентарь ресурсов","Ресурсы отмечены синим цветом"] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["Инвентарь ресурсов","Инвентарь игрока отображается там же, где и обычный, откройте его нажав «I»"] call RRPClient_forBeginner_guideNotification;
      "Откройте инвентарь «I» ..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull(findDisplay 1000))};
      ["Инвентарь ресурсов","Ресурсы находяться вместо со всеми предметами, так вы можете их передавать другим игрокам или удалять из инвентаря"] call RRPClient_forBeginner_guideNotification;
      uiSleep 5;
      closeDialog 0;
      uiSleep 0.1;
      ["Хранилище ресурсов в технике","Что-бы открыть инвентарь в технике вам нужно навестись на нее и нажать «T»"] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["Сбыт ресурсов","Когда заполните инвентарь яблоками, вам нужно их продать. Точка продажи находится в к северу от Кавалы, на карте подписана как «Сбыт фруктов»"] call RRPClient_forBeginner_guideNotification;
      "Заполните инвентарь вашей машины и ваш инвентарь и отравляйтесь на Сбыт фруктов что-бы продать яблоки..." call RRPClient_forBeginner_watermark;
      waitUntil {!(isNull (findDisplay 2400)) or !activeQuest};
      "delete" call RRPClient_forBeginner_watermark;
      ["Налоги","На сервере существует система налогов, при каждой продаже с Вас автоматически будет списываться некий % налога",2400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["Рынок","Цены на ресурсы постоянны и редко меняются, но есть ограничение по количеству сданных ресурсов, по достижению лимита он будет заблокирован на некоторое время к продаже",2400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      ["Где следить за ценами?","Узнать актуальную цену вы можете в [Планшет >> Сенат] или в Личном кабинете, с ним Вас познакомим чуть позже",2400] call RRPClient_forBeginner_guideNotification;
      uiSleep 0.1;
      numberQuest call RRPClient_forBeginner_missionComplete;
      activeQuest = nil;
      numberQuest = nil;
    } catch {
      activeQuest = nil;
      numberQuest = nil;
      ["ErrorTitleAndText", ["Ошибка!", "Задание прервано! Что бы начать заново нажмите F10"]] call SmartClient_gui_toaster_addTemplateToast;
    };
  }
 ];
