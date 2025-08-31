/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
try {
	private ["_display","_mode","_control","_curData","_inBasket","_curSel"];
	_mode = _this;
	_display = uiNamespace getVariable ["RRPDialogClothingShop",displayNull];
	_control = _display displayCtrl ([3101,3108] select (_mode isEqualTo "delete"));
	_curSel = (lbCurSel _control);
	if (_curSel isEqualTo -1) throw format ["Вы не выбрали предмет для %1",(["Добавления","Удаления"] select (_mode isEqualTo "delete"))];
	_curData = _control lbData _curSel;
	_inBasket = (RRPClothingBasket findIf {_x # 0 isEqualTo _curData});
	if ((_mode isEqualTo "delete") AND (_inBasket isEqualTo -1)) throw "Нечего удалять...";

	([_curData] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
	if ((_mode isEqualTo "add") AND _curLimit >= _maxLimit AND _maxLimit > 0) throw "Нет в наличии!";

	switch (_mode) do {
	    case ("delete"): {
			if (life_clothing_filter isEqualTo 'backpack') then {
				backpackADddet = !backpackADddet;
			};
			if ((RRPClothingBasket # _inBasket) # 1 < 2) then {
				RRPClothingBasket deleteAt _inBasket;
			} else {
				(RRPClothingBasket # _inBasket) set [1,(RRPClothingBasket # _inBasket) # 1 - 1]
			};
	    };

		case ("add"): {
			if (life_clothing_filter isEqualTo 'backpack') then {
				if (backpackADddet) throw "Нельзя складывать в корзину более одного рюкзака!";
				if !(backpackADddet) then {backpackADddet = true}
			};

			if (_inBasket < 0) then {
				RRPClothingBasket pushBackUnique [_curData, 1];
			} else {
				if !(_maxLimit isEqualTo -1 AND _curLimit isEqualTo -1) then {
					if (((RRPClothingBasket # _inBasket) # 1) > (_maxLimit - _curLimit)) throw "Вы выбрали больше чем есть в наличии!";
					(RRPClothingBasket # _inBasket) set [1,(RRPClothingBasket # _inBasket) # 1 + 1]
				} else {
					(RRPClothingBasket # _inBasket) set [1,(RRPClothingBasket # _inBasket) # 1 + 1];
				};
			};
		};
	};

	call RRPClient_system_updateBasket;
} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
