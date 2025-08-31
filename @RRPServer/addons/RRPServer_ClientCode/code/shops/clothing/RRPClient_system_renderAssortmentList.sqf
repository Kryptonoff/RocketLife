/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

if (isNil "currencyType") exitWith {};
try {
    disableSerialization;
    private ["_control","_selection","_display"];
    _display = uiNamespace getVariable ["RRPDialogClothingShop",displayNull];
    _control = _display displayCtrl 3105;
    if (isNull _control) throw "Ошибка в диалоге...";

    _selection = lbCurSel _control;
    if (_selection isEqualTo -1) throw "Выберите раздел!";

    private _clothList = _display displayCtrl 3101;
    lbClear _clothList;


    private _configArray = switch (_selection) do {
    	case 0: {getArray(missionConfigFile >> "LifeCfgClothShops" >> currentShop >> "uniforms")};
    	case 1: {getArray(missionConfigFile >> "LifeCfgClothShops" >> currentShop >> "headgear")};
    	case 2: {getArray(missionConfigFile >> "LifeCfgClothShops" >> currentShop >> "goggles")};
    	case 3: {getArray(missionConfigFile >> "LifeCfgClothShops" >> currentShop >> "vests")};
    	case 4: {getArray(missionConfigFile >> "LifeCfgClothShops" >> currentShop >> "backpacks")};
    	default {[]};
    };
    private _configArrayExlusive = [];
    _configArrayExlusive = switch (_selection) do {
    	case 0: {getArray(missionConfigFile >> "LifeCfgClothShops" >> "exclusive_clothing" >> "uniforms") + (['clothing', 'uniform'] call RRPClient_system_getPurchasedItemsList)};
    	case 1: {getArray(missionConfigFile >> "LifeCfgClothShops" >> "exclusive_clothing" >> "headgear") + (['clothing', 'headgear'] call RRPClient_system_getPurchasedItemsList) };
    	case 2: {getArray(missionConfigFile >> "LifeCfgClothShops" >> "exclusive_clothing" >> "goggles") + (['clothing', 'goggles'] call RRPClient_system_getPurchasedItemsList)};
    	case 3: {getArray(missionConfigFile >> "LifeCfgClothShops" >> "exclusive_clothing" >> "vests") + (['clothing', 'vest'] call RRPClient_system_getPurchasedItemsList)};
    	case 4: {getArray(missionConfigFile >> "LifeCfgClothShops" >> "exclusive_clothing" >> "backpacks") + (['clothing', 'backpack'] call RRPClient_system_getPurchasedItemsList)};
    };

    if ((getText(missionConfigFile >> "LifeCfgClothShops" >> currentShop >> "pushVIPitems") isEqualto "")) then {
    	if !(_configArrayExlusive isEqualTo []) then {
    		{_x pushBack "exlusive"} forEach _configArrayExlusive;
            _configArray = _configArrayExlusive + _configArray;
    	};
    };

    if (_configArray isEqualTo []) throw "RRPClient_system_clothingFilter CFG ПУСТ";

    {
        _x params [["_class","",[""]],["_exlusive","",[""]]];
        (_class call RRPClient_clothing_getItemInfo) params ["_displayName",["_conditions","false"],"_conditionsMsg","_conditionsUse,","_conditionsUseMsg","_price"];
        diag_log format ["_class: %1",_class];
    	private _details = [_class] call RRPClient_util_itemDetails;
    	if !(_details isEqualTo []) then {

            ([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
    		if ([_conditions] call RRPClient_util_conditionsCheck) then {
    			_displayName = [_displayName,if (_details isEqualTo []) then {"Такого предмета не существует"} else {_details select 1}] select (_displayName isEqualTo "");
    			private _index = _clothList lbAdd format["%1",_displayName];
                _price = if (_details # 12 < 0) then {_price} else {_details # 12};
                if (_price > -1) then {
                    _clothList lbSetData [_index,_class];
                    _price = ["countPrice",_price] call RRPClient_shops_utils;
                    _clothList lbSetValue [_index,_price];
                    _clothList lbSetPicture [_index,_details select 2];
                    _clothList lbSetTextRight [_index, format["  %1 %2", [_price] call RRPClient_util_numberText,["getName"] call RRPClient_shops_utils]];

                    if (_curLimit >= _maxLimit AND _maxLimit > -1) then {
                        lbSetColor [_index, 0, [0.82, 0.82, 0.82, 1]];
                        _clothList lbSetPictureRight [_index,"\RRP_icons\shop\exlusiveContent.paa"];
                        _clothList lbSetTooltip [_index,"Нет в наличии"];
                    };

                    if (_exlusive isEqualTo "exlusive") then {
                        _clothList lbSetPictureRight [_index,"\RRP_icons\shop\exlusiveContent.paa"];
                    };

                    if !([_conditions] call RRPClient_util_conditionsCheck) then {
                        _clothList lbSetColor [_index, [0.89, 0.0, 0.0, 0.5]];
                    };
                } else {
                    diag_log format ["clothing shop ERROR [undefined price: %1]", _class];
                };
    		};
    	} else {
    	format["Нету в аддонах [LifeCfgClothShops select %2] [classname %1]",_class,_selection] call RRPClient_system_log;
    	};
    } foreach _configArray;


    life_clothing_filter = _selection;

} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
