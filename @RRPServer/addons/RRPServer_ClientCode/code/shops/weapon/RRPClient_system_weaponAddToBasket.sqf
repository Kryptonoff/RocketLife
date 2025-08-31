/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

try {
	private ["_display","_mode","_control","_class","_inBasket","_curSel","_item","_type","_itemList","_amountItem","_countMode","_condition","_conditionMsg"];
	_mode = param [0,"",[""]];
	_type = param [1,"",[""]];
	_countMode = param [2,"",[""]];

	_display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];
	_control = _display displayCtrl (switch (_type) do {
	    case ("items"): {38403};
		case ("mags"): {38407};
		case ("basket"): {38412};
	});
	_itemList = _display displayCtrl 38403;

	_amountItem = if (_countMode isEqualTo "multi" AND weaponShopMode isEqualTo "buy") then {
		 parseNumber(ctrlText(if (_type isEqualTo "items") then {38406} else {38408}))
	} else {1};


	_curSel = (lbCurSel _control);
	if (_curSel isEqualTo -1) throw format ["Вы не выбрали предмет для %1",(["Добавления","Удаления"] select (_mode isEqualTo "delete"))];
	private _class = _control lbData _curSel;

	_inBasket = (RRPWeaponBasket findIf {_x # 0 isEqualTo _class});
	if ((_mode isEqualTo "delete") AND (_inBasket isEqualTo -1)) throw "Нечего удалять...";

	_condition = getText(missionConfigFile >> "LifeCfgItems" >> _class >> "conditions_buy");
	_conditionMsg = getText(missionConfigFile >> "LifeCfgItems" >> _class >> "conditions_buy_message");

	([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
	if ((_mode isEqualTo "add") AND _curLimit >= _maxLimit AND _maxLimit > 0) throw "Нет в наличии!";

	switch (_mode) do {
	    case ("delete"): {
			if (weaponShopMode isEqualTo "sell") then {
				private ["_index","_amountDel"];
				 _index = (playerInventory findIf {(_x # 0) isEqualTo (_class)});
				 if (_index < 0) then {
					 playerInventory pushBackUnique [_class, 1]
				 } else {
					 (playerInventory # _index) set [1,(playerInventory # _index) # 1 + 1];
				 }
			};

			if ((RRPWeaponBasket # _inBasket) # 1 < 2) then {
				RRPWeaponBasket deleteAt _inBasket;
			} else {
				(RRPWeaponBasket # _inBasket) set [1,(RRPWeaponBasket # _inBasket) # 1 - 1]
			};
	    };

		case ("add"): {
			if (_conditionMsg isEqualTo "") then {_conditionMsg = "Доступ закрыт!"};
			if !([_condition] call RRPClient_util_conditionsCheck) throw _conditionMsg;
			private _amount = (_control lbValue _curSel);

			if (_inBasket < 0) then {
				RRPWeaponBasket pushBackUnique [_class, _amountItem];
			} else {
				if !(_maxLimit isEqualTo -1 AND _curLimit isEqualTo -1) then {
					if (((RRPWeaponBasket # _inBasket) # 1) > (_maxLimit - _curLimit)) throw "Вы выбрали больше чем есть в наличии!";
					(RRPWeaponBasket # _inBasket) set [1,(RRPWeaponBasket # _inBasket) # 1 + _amountItem]
				} else {
					(RRPWeaponBasket # _inBasket) set [1,(RRPWeaponBasket # _inBasket) # 1 + _amountItem]
				};
			};

			if (weaponShopMode isEqualTo "sell" AND _amount > 0) then {
				private ["_index","_amountDel"];
				 _index = (playerInventory findIf {(_x # 0) isEqualTo (_class)});
				 _amountDel = (playerInventory # _index) # 1;
				 if (_amountDel < 2) then {
					 playerInventory deleteAt _index;
				 } else {
					 playerInventory # _index set [1, _amountDel - 1];
				 };
			};
		};
	};

	call RRPClient_weapon_updateBasket;
	if (weaponShopMode isEqualTo "sell") then {
		call RRPClient_system_renderListItemsSell;
	};
} catch {
	if !(_exception isEqualTo "") then {["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;}
};
