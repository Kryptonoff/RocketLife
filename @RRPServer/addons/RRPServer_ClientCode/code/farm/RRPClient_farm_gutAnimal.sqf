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
if (life_action_inUse) exitwith {};
life_action_inUse = true;
uiSleep 0.5;
private ['_hunterID', '_useAnimal', '_chance', '_multiplierCombo', '_animalCorpse', '_classnameItem', '_itemslist', '_item', '_amount', '_profname', '_curlvl', '_dataProf', '_maxLVL', '_time', '_defaulttime', '_complete', '_amountexp'];
_animalCorpse = param [0, objNull, [objNull]];

try {
    if (player getVariable ['lifeState', ''] in ['REspawn', 'inCAPACITATED', 'DEAD']) throw "Вы находитесь в агонии!";
    if (player getVariable "restrained") throw "";
    if (player getVariable "surrender") throw "";
    
    _hunterID = _animalCorpse getVariable ["abuse", ""];
    if (_hunterID isEqualto "") then {
        _animalCorpse setVariable ["abuse", getplayerUID player, true];
        _useAnimal = false;
    } else {
        if (_hunterID isEqualto (getplayerUID player)) then {
            _useAnimal = false
        } else {
            _useAnimal = if ([_hunterID] call RRPClient_system_isUIDActive) then {
                true
            } else {
                false
            };
        };
    };
    if (_useAnimal) throw "Уже кто-то разделывает эту тушь...";
    
    if (isNull _animalCorpse) throw '';
    _classnameItem = typeOf _animalCorpse;
    
    if (player distance _animalCorpse > 3.5) throw 'Вы должны быть рядом с тушей';
    if ((['extItem_knife'] call RRPClient_util_itemcount) isEqualto 0) throw 'Что бы разделать тушь нужен нож, который можно купить в универмаге';
    
    if ((['Turtle_', _classnameItem] call RRPClient_util_xstring) and (player distance getmarkerPos 'gather_turtle' > 350) and (player distance getmarkerPos 'gather_turtle_1' > 350)) throw 'Вы не в зоне ловли черепах!';
    _itemslist = switch (true) do {
        case (['Turtle_', _classnameItem] call RRPClient_util_xstring) : {
            ['RRpitem_Turtle_RAW', 6];
        };
        case (['Animal_Rooster_', _classnameItem] call RRPClient_util_xstring): {
            ['RRpitem_Rooster_RAW', 4]
        };
        case (['Animal_Goat_', _classnameItem] call RRPClient_util_xstring) : {
            ['RRpitem_Goat_RAW', 6]
        };
        case (['Animal_Sheep_', _classnameItem] call RRPClient_util_xstring) : {
            ['RRpitem_Sheep_RAW', 8]
        };
        case (['Animal_Hen_', _classnameItem] call RRPClient_util_xstring) : {
            ['RRpitem_Rooster_RAW', 2]
        };
        default {
            []
        };
    };
    if (_itemslist isEqualto []) throw '';
    
    _profname = 'Hunting_Prof';
    _defaulttime = 70;
    
    _dataProf = missionnamespace getVariable (_profname);
    _curlvl = _dataProf select 0;
    _maxLVL = 30;
    
    _time = [_maxLVL, _curlvl, _defaulttime] call RRPClient_util_countSavingtime;
    
    if ((call (life_adminlevel) > 0) and !((getplayerUID player) isEqualto "76561197984276591")) then {
        hint format ["DEBUG | time: %1", _time];
        _time = 40;
    };
    
    _complete = ["Разделываю тушь...", {
        (speed player < 4) and ((player getVariable ["lifeState", ""]) isEqualto "HEALTHY") and (alive player) and (getplayerUID player isEqualto (_animalCorpse getVariable ["abuse", ""]))
    }, true, _time, false, true, {
        call RRPClient_animation_kneelWork
    }] call RRPClient_system_newProgressBar;
    if (isnil "_complete") throw "Действие прервано";
    if !(_complete) throw 'Действие отменено!';
    
    _item = _itemslist select 0;
    _amount = if (_item isEqualto "RRpitem_Turtle_RAW") then {
        ceil(_itemslist select 1)
    } else {
        (_itemslist select 1)
    };
    
    _amountexp = [(_amount * 2), _curlvl] call RRPClient_farm_util_countAmountXP;
    if (['Turtle_', _classnameItem] call RRPClient_util_xstring) then {
        if ([true, "turtleraw", _amount] call RRPClient_system_handleinv) then {
            [_profname, _amountexp] call RRPClient_skills_addXP;
            [(_amount * 2), "разделку тушки"] call addXP;
        } else {
            ['WarningTitleandtext', ['Инвентарь', 'Ваш инвентарь переполнен!']] call SmartClient_gui_toaster_addTemplatetoast;
        };
    } else {
        for'_i' from 1 to _amount step 1 do {
            [_item] call RRPClient_inventory_addItemtoinventory
        };
        [_profname, _amountexp] call RRPClient_skills_addXP;
        [(_amount * 2), "разделку тушки"] call addXP;
    };
    
    [[_itemslist], 'Physical'] call RRPClient_farm_util_notificationadditems;
    
    life_action_inUse = false;
    deletevehicle _animalCorpse;
    player switchAction 'stop';
    _animalCorpse setVariable ["abuse", nil, true];
} catch {
    if ((_animalCorpse getVariable ["abuse", "-1"]) isEqualto getplayerUID player) then {
        _animalCorpse setVariable ["abuse", nil, true]
    };
    life_action_inUse = false;
    ['WarningTitleandtext', ['Ошибка!', _exception]] call SmartClient_gui_toaster_addTemplatetoast;
    player switchAction 'stop';
};