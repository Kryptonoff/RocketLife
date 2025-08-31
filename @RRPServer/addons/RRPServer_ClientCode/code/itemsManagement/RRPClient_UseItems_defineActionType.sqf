/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
private ['_usedItem','_type','_ActionList','_itemInfo','_itemName'];
_usedItem = param [0,'',['']];
_type = getText(configFile >> 'CfgMagazines' >> _usedItem >> 'Interactions' >> 'type');

_ActionList = switch (_type) do {
case 'food'      : {['action_eat_3','FT_Act_Eat_Bread','Употребляю ']};
case 'drink'     : {['action_drink_bottle','FT_Act_Drink_Water','Употребляю ']};
case 'alco'      : {['action_drink_bottle','FT_Act_Drink_Water','Употребляю ']};
case 'hypodermic': {'','','Употребляю '};
case 'bandaging' : {'','','Употребляю '};
case 'smoking' : {'','AG_cigaretSmoke_in','Употребляю '};
default {''};
};

_itemInfo = [_usedItem] call RRPClient_util_itemDetails;
_itemName = _itemInfo select 1;

_titleText = format ['%1 %2, Ожидайте...',(_ActionList select 2),_itemName];
_titleText = if ((_type in ['food','drink']) and RRPClientDiarrhea) then {format ['%1 Так как у вас диарея, эффект от приминения послаблен',_titleText];} else {_titleText};
_ActionList pushBack _titleText;

_ActionList
