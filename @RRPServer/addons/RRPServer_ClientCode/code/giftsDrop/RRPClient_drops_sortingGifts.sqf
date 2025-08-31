params [
  ["_type","",[""]],
  ["_gift","",[""]],
  ["_have",false,[false]]
];

try {
    if (_type isEqualTo "") throw "";
    if (_gift isEqualTo "") throw ""; 


    private _textNY = "";
    switch (_type) do {
        case ("money"): {
          [
            "money",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,5' align='center'  font = 'RobotoCondensedBold' >Поздравляем, Вы выиграли деньги!</t><br/><t size='2.5' font = 'RobotoCondensedBold' align='center'  >%3$</t></t>",(player call getNickName),_textNY,_gift],
            _gift

          ] call RRPClient_drops_showGift;
        };

        case ("rc"): {
          [
            "money",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,5' align='center'  font = 'RobotoCondensedBold' >Поздравляем, Вы выиграли RCredits !</t><br/><t size='2.5' font = 'RobotoCondensedBold' align='center'  >%3 RC</t></t>",(player call getNickName),_textNY,_gift],
            _gift

          ] call RRPClient_drops_showGift;
        };

        case ("car"): {
          [
            "cars",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,2' align='center'>Поздравляем, Вы выиграли коллекционный автомобиль!</t><br/><t size='2' align='center'>%3</t><br/><t color='#ff5b00' size='0.8'>Ты можешь забрать машину в тайнике!!</t></t>",(player call getNickName),_textNY,(([_gift] call RRPClient_util_fetchVehInfo) # 3)],
            _gift
          ] call RRPClient_drops_showGift;
        };
        case "vip1":
        {
          [
            "cars",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,2' align='center'>Поздравляем, Вы выиграли VIP-1!</t><br/><t size='2' align='center'>на %3 дней</t><br/><t color='#ff5b00' size='0.8'>Ты можешь забрать приз в тайнике!!</t></t>",(player call getNickName),_textNY,_gift],
            _gift
          ] call RRPClient_drops_showGift;
        };
        case "vip2":
        {
          [
            "cars",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,2' align='center'>Поздравляем, Вы выиграли VIP-2!</t><br/><t size='2' align='center'>на %3 дней</t><br/><t color='#ff5b00' size='0.8'>Ты можешь забрать приз в тайнике!!</t></t>",(player call getNickName),_textNY,_gift],
            _gift
          ] call RRPClient_drops_showGift;
        };
        case "vip3":
        {
          [
            "cars",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,2' align='center'>Поздравляем, Вы выиграли VIP-3!</t><br/><t size='2' align='center'>на %3 дней</t><br/><t color='#ff5b00' size='0.8'>Ты можешь забрать приз в тайнике!!</t></t>",(player call getNickName),_textNY,_gift],
            _gift
          ] call RRPClient_drops_showGift;
        };
        case "vip4":
        {
          [
            "cars",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,2' align='center'>Поздравляем, Вы выиграли VIP-4!</t><br/><t size='2' align='center'>на %3 дней</t><br/><t color='#ff5b00' size='0.8'>Ты можешь забрать приз в тайнике!!</t></t>",(player call getNickName),_textNY,_gift],
            _gift
          ] call RRPClient_drops_showGift;
        };

        case ("prem_cloth"): {
          _itemName = call {
            if (isClass (getMissionConfig "secret_shop_items_groups" >> _gift)) exitWith {getText(getMissionConfig "secret_shop_items_groups" >> _gift >> "displayName")};
            if (isClass (getMissionConfig "secret_shop_items" >> _gift)) exitWith {getText(getMissionConfig "secret_shop_items" >> _gift >> "displayName")};
            if (isClass (configFile >> "CfgWeapons" >> _gift)) exitWith {getText(configFile >> "CfgWeapons" >> _gift >> "displayName")};
            _gift
          };
          if (_have) exitWith {
            [
              "prem_cloth",
              format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/>Вы нашли эксклюзивную вещь, но вы уже ею владеете, расскажите своим друзьям о местонахождении этого подарка!<br/></t>",(player call getNickName)],
              _gift
            ] call RRPClient_drops_showGift;
          };
          [
            "prem_cloth",
            format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/>%2 <br/>Поздравляем, Вы выиграли эксклюзивную вещь, доступ к ней уже доступен <br/><t size='1.8' align='center'  font='RobotoCondensedBold' >%3</t></t>",(player call getNickName),_textNY,_itemName],
            _gift
          ] call RRPClient_drops_showGift;
          secretShop pushBackUnique _gift;
        };
        default {};
    };
} catch {
  ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
