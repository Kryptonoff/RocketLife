RRPClient_ltds_ltd_actions = {
private ["_dataCompany","_isOwner","_pageSettings","_listManagers"];
str _this call debugConsole;
private _mode = param [0,"",[""]];
RRPClientLTDsData params ["_id","_name"];
_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
_dataCompany params ["_owner","_name","_bank","_members"];
_isOwner = (getPlayerUID player) isEqualTo _owner;
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 38000;

_pageSettings = _slide controlsGroupCtrl 1037;
_withdraw = _pageSettings controlsGroupCtrl 2109;
_withdraw ctrlSetFontHeight 0.035;

_transferCompany = _pageSettings controlsGroupCtrl 2111;
_transferCompany ctrlSetFontHeight 0.035;

_listManagers = _pageSettings controlsGroupCtrl 2104;


private _casinoRefresh = {
	private ["_cur","_casino","_pageCasino","_informText","_paymentText","_nameEdit","_limitEdit","_bankEdit","_openClose","_openCloseText","_textureList","_index"];
	_cur = param [2,[],[[],objNull]];
	_casino = if (_cur isEqualType []) then {objectFromNetId((_cur select 0) lbData (_cur select 1))}else{_cur};
	_display setVariable ["selectedCasino",_casino];
	_pageCasino = _display displayCtrl 1039;
	_informText = _pageCasino controlsGroupCtrl 2314;
	_informText ctrlSetStructuredText parseText (format ["<t size='.8'>Название: %1<br/>На счету: $%2<br/>Лимит: $%3<br/>Оплачен до: %4<br/>Статус: %5</t>",
		_casino getVariable ["ltdName","WHAT?"],
		[_casino getVariable ["ltdBank",0]] call RRPClient_util_numberText,
		[_casino getVariable ["ltdBLim",0]] call RRPClient_util_numberText,
		[_casino getVariable ["ltdPayedUntil",[]]] call RRPClient_util_dateToString,
		(if !(_casino getVariable ["ltdClosed",false])then{"Открыт"}else{"Закрыт"})
	]);
	_paymentText = _pageCasino controlsGroupCtrl 2304;
	_paymentText ctrlSetStructuredText (parseText (format ["<t size='.8'>ОПЛАЧЕН: %1</t>",[_casino getVariable ["ltdPayedUntil",[]]] call RRPClient_util_dateToString]));
	_nameEdit = _pageCasino controlsGroupCtrl 2310;
	_nameEdit ctrlSetText (_casino getVariable ["ltdName","UNDEFINED"]);
	_limitEdit = _pageCasino controlsGroupCtrl 2312;
	_limitEdit ctrlSetText ((_casino getVariable ["ltdBLim",1000]) call RRPClient_util_exponentToString);

	_bankEdit = _pageCasino controlsGroupCtrl 2320;
	_bankEdit ctrlSetText ((_casino getVariable ["ltdBank",1000]) call RRPClient_util_exponentToString);

	_openClose = _pageCasino controlsGroupCtrl 2318;
	_openClose cbSetChecked !(_casino getVariable ["ltdClosed",false]);
	_openCloseText = _pageCasino controlsGroupCtrl 2319;
	_openCloseText ctrlSetText (if !(_casino getVariable ["ltdClosed",false])then{"Открыт"}else{"Закрыт"});

	_textureList = _pageCasino controlsGroupCtrl 2325;
	lbClear _textureList;
	{
		_x params ["_name","_var","_textures"];
		_index = _textureList lbAdd _name;
		_textureList lbSetPictureRight [_index,_textures select 0];
		_textureList lbSetData [_index,_var];
		if ((_casino getVariable ["ltdTexture","default"]) isEqualTo _var) then {_textureList lbSetCurSel _forEachIndex};
	}forEach (getArray(getMissionConfig "CfgLtds" >> "casino" >> vehicleVarName _casino >> "textureList")); 
};

private _storeRefresh = {
	private ["_cur","_store","_pageStores","_percentDiscount","_dayDiscount","_taxBox","_listGoods","_discount","_discountDate","_tmp","_discText","_modeSel","_modeSelText","_editNameStore","_opOrCloseStore","_opOrCloseStoreText","_paymentTextStore","_slotsTextStore"	];
	_cur = param [2,[],[[],objNull]];
	_store = if (_cur isEqualType []) then {objectFromNetId((_cur select 0) lbData (_cur select 1))}else{_cur};
	_display setVariable ["selectedStore",_store];
	_pageStores = _display displayCtrl 1038;
	_percentDiscount = _pageStores controlsGroupCtrl 2204;
	_dayDiscount = _pageStores controlsGroupCtrl 2205;
	_taxBox = _pageStores controlsGroupCtrl 2210;
	_listGoods = _pageStores controlsGroupCtrl 2221;

	private _discount = 	_store getVariable ["ltdDiscount",0];
	private _discountDate = _store getVariable ["ltdDiscountDate",[]];
	{lbClear _x}forEach [_percentDiscount,_dayDiscount,_taxBox,_listGoods];
	{
		_x params ["","_item","_count","_cost","_tax","_selled_in","_selled_by","_trash"];
		_tmp = [_item] call RRPClient_util_itemDetails;
		_itemIcon = _tmp select 2;
		_itemName = _tmp select 1;
		_index = _listGoods lbAdd _itemName;
		_listGoods lbSetPicture [_index,_itemIcon];
		_listGoods lbSetTextRight [_index,format["$%1 (ост. %2)", [[_cost,_discount] call RRPClient_ltd_calculateDiscount] call RRPClient_util_numberText, [_count] call RRPClient_util_numberText]];
		_listGoods lbSetTooltip [_index,format["%2\nКомиссия за товар: %3%1\nПродавец: %4 \n%5",
			"%",
			_itemName,
			 _tax,
			 _selled_by call RRPClient_ltds_util_getNameLtd,
			 if (_trash) then {"В мусоре"}else{""}
			]
		];
	}forEach (_store getVariable ["ltdItems",[]]);
	for "_i" from 1 to 25 do {_index = _percentDiscount lbAdd format["%1%2",_i,"%"]; _percentDiscount lbSetValue [_index,_i]};
	for "_i" from 1 to 7 do {_index = _dayDiscount lbAdd format["%1 дней",_i]; _dayDiscount lbSetValue [_index,_i]};
	_discText = _pageStores controlsGroupCtrl 2203;
	
	_discount = if (_discount isEqualTo 0) then {""}else{format["%1%2",_discount,"%"]};
	_discountDate = if (_discountDate isEqualTo "") then {"НЕ АКТИВНА"}else{[_discountDate] call RRPClient_util_dateToString};
	_discText ctrlSetStructuredText (parseText (format ["<t size='.8'>СКИДКА %1 %2</t>",_discountDate,_discount]));
	
	_modeSel = _pageStores controlsGroupCtrl 2207;
	_modeSelText = _pageStores controlsGroupCtrl 2218;
	for "_i" from 1 to 25 do {_index = _taxBox lbAdd format["%1%2",_i,"%"]; _taxBox lbSetValue [_index,_i]};
	_taxBox lbSetCurSel ((_store getVariable ["ltdTax",0]) - 1);
	_editNameStore = _pageStores controlsGroupCtrl 2216;
	_editNameStore ctrlSetText (_store getVariable ["ltdName","UNDEFINED"]);
	_paymentTextStore = _pageStores controlsGroupCtrl 2226;
	_paymentTextStore ctrlSetStructuredText (parseText (format ["<t size='.8'>ОПЛАЧЕН: %1</t>",[_store getVariable ["ltdPayedUntil",[]]] call RRPClient_util_dateToString]));
	_slotsTextStore = _pageStores controlsGroupCtrl 2227;
	_slotsTextStore ctrlSetStructuredText (parseText (format ["<t size='.8'>СЛОТОВ: %1</t>",_store getVariable ["ltdMaxGds",5]]));
	
	_opOrCloseStoreCb = _pageStores controlsGroupCtrl 2219;
	_opOrCloseStoreCb cbSetChecked (_store getVariable ["ltdActive",false]);
	_opOrCloseStoreText = _pageStores controlsGroupCtrl 2220;
	_opOrCloseStoreText ctrlSetStructuredText parseText (if (_store getVariable ["ltdActive",false]) then{"Открыт"}else{"Закрыт"});

	_modeCb = _pageStores controlsGroupCtrl 2207;
	_modeCb cbSetChecked (_store getVariable ["ltdMode",false]);
	_modeText = _pageStores controlsGroupCtrl 2218;
	_modeText ctrlSetStructuredText parseText (if (_store getVariable ["ltdMode",false]) then{"Публичный"}else{"Частный"});

	{_x ctrlEnable true}forEach [_pageStores controlsGroupCtrl 2207,_pageStores controlsGroupCtrl 2219];
};

private _requestLtd = {
	private ["_display","_ltdName","_s","_badChar"];
	_display = uiNamespace getVariable ["RRPDialogRegisterLtd",displayNull];
	if (RRPClientAtmWaitingResponse) throw "Еще не пришел ответ от сервера...";
	_ltdName = ctrlText 7102;
	if ([_ltdName] call RRPClient_util_checkASCII) throw "Можно использовать только латинские символы от A-Z и a-z";
	_s = count (toArray _ltdName);
	if (_s < 4 or _s > 16) throw "Количество символов должно быть не менее 4 и не более 16ти";
	
	if (((toArray _ltdName) select 0) isEqualTo 32) throw "Пробел в начале названия недопустим";
	if (((toArray _ltdName) select (_length-1)) isEqualTo 32) throw "Пробел в конце названия недопустим";
	_badChar = false;
	{
		if ((_x isEqualTo 32) && (((toArray _ltdName) select (_forEachIndex + 1)) isEqualTo 32)) exitWith {_badChar = true};
	} forEach (toArray _ltdName);
	if (_badChar) throw "Два пробела подряд запрещены";
	RRPClientAtmWaitingResponse = true;
	["register",-1,[player,_ltdName]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
	closeDialog 0;
};

private _refreshMain = {
	private ["_isOwner","_nameLtd","_pageSettings","_delComp","_settingsText","_managers","_text","_nameEdit"];
	if (isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) exitWith {};

	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 38000;

	private _pageSettings = _slide controlsGroupCtrl 1037;
	private _pageStores = _slide controlsGroupCtrl 1038;
	private _pageCasino = _slide controlsGroupCtrl 1039;
	private _pageFuels = _slide controlsGroupCtrl 1040;


	RRPClientLTDsData params ["_id"];
	private _dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
	_dataCompany params ["_owner","_name","_bank","_members"];

	private _isOwner = (getPlayerUID player) isEqualTo _owner;

	private _nameLtd = _slide controlsGroupCtrl 23999;
	_nameLtd ctrlSetStructuredText parseText (format ["<t size='1.1'>%1</t>",_name]);

	comment "//------- Настройки";
	_delComp = _pageSettings controlsGroupCtrl 2100;
	_settingsText = _pageSettings controlsGroupCtrl 2101;
	_settingsText ctrlSetStructuredText parseText (format [
		"<t size='1.2'>%1</t><br/>" +
		"<t size='1'>На счету компании: %2<br/>" + 
		"<t size='1'>Магазинов во владении: %3<br/>" + 
		"<t size='1'>Казино во владении: %4<br/>" + 
		"<t size='1'>Заправок во владении: %5<br/>" +
		"<t size='1'>Менеджеров: %6<br/>",
		_name,
		[_bank] call RRPClient_util_numberText,
		count ((allMissionObjects "LtdsStore") select {_x getVariable ["ltdOwner",-1] isEqualTo _id}),
		count ((allMissionObjects "RRP_SM_I") select {_x getVariable ["ltdOwner",-1] isEqualTo _id}),
		count ((allMissionObjects "fuels") select {_x getVariable ["ltdOwner",-1] isEqualTo _id}),
		count _members
	]);

	private _managers = _pageSettings controlsGroupCtrl 2104;
	lbClear _managers;
	_text = "";
	{
		private _name = _x select 0;
		private _playerUID = _x select 1;
		_text = format ["%1",_name];
		_index = _managers lbAdd _text;
		_managers lbSetData [_index,_playerUID];
		
		if (_playerUID isEqualTo _owner) then
		{
			_managers lbSetColor [_forEachIndex, [0/255, 178/255, 205/255, 1]];
		};
	} forEach _members;
	lbSort [_managers,"ASC"];

	private _nameEdit = _pageSettings controlsGroupCtrl 2106;
	_nameEdit ctrlSetText _name;

	comment "//------- Магазин";
	private _storeList = _pageStores controlsGroupCtrl 2200;
	lbClear _storeList;
	{
		_index = _storeList lbAdd (_x getVariable ["ltdName",""]);
		_storeList lbSetData [_index,netId _x];
		_storeList lbSetValue [_index,_x getVariable ["ltdID",-1]];
	}forEach ((allMissionObjects "Land_rrp_panel") select {_x getVariable ["ltdOwner",-1] isEqualTo _id});
	_storeList lbSetCurSel 0;
	

	comment "//------- Казино";
	private _listCasino = _pageCasino controlsGroupCtrl 2300;
	lbClear _listCasino;
	{
		_index = _listCasino lbAdd (_x getVariable ["ltdName",""]);
		_listCasino lbSetData [_index,netId _x];
		_listCasino lbSetValue [_index,_x getVariable ["ltdID",-1]];
	}forEach ((allMissionObjects "RRP_SM_I") select {_x getVariable ["ltdOwner",-1] isEqualTo _id});
	_listCasino lbSetCurSel 0;

	private _paymentTextCasino = _pageCasino controlsGroupCtrl 2304;
	private _nameCasino = _pageCasino controlsGroupCtrl 2310;
	private _limitEdit = _pageCasino controlsGroupCtrl 2312;
	private _informTextCasino = _pageCasino controlsGroupCtrl 2314;
	private _coOrOpCasino = _pageCasino controlsGroupCtrl 2318;
	private _cloroptextCasino = _pageCasino controlsGroupCtrl 2319;
	private _bankEditCasino = _pageCasino controlsGroupCtrl 2320;

	comment "//------- Заправки";
	private _listStation = _pageFuels controlsGroupCtrl 2401;
	private _paymentTextCasino = _pageFuels controlsGroupCtrl 2404;
	private _levelTextCasino = _pageFuels controlsGroupCtrl 2405;
	private _informTextCasino = _pageFuels controlsGroupCtrl 2409;
	private _zakupEdit = _pageFuels controlsGroupCtrl 2412;
	private _sellEdit = _pageFuels controlsGroupCtrl 2413;
	private _bankEdit = _pageFuels controlsGroupCtrl 2420;
	if (isRemoteExecuted) then {
		call _dropWait;		
	};
};

private _dropWait = {
	RRPClientLtdsWaitingResponse = false;
};

try
{
	switch _mode do
	{
		case "register": 
		{
			if !(RRPClientLTDsData isEqualTo []) throw "У вас уже есть компания";
			switch (_this select 1) do
			{
				case "openMenu": {
					disableSerialization;
					createDialog "RRPDialogRegisterLtd";
					(uiNamespace getVariable ["RRPDialogRegisterLtd",displayNull] displayCtrl 7101) ctrlSetStructuredText parseText format ["<t size='0.85'>При регистрации вы должны внести в уставной капитал сумму в размере <t color='#3b7200'>$%1</t><br/>",[getNumber(getMissionConfig "CfgLtds" >> "costToCreate")] call RRPClient_util_numberText];
				};
				case "request": _requestLtd;
			};
		};
		case "rename": 
		{
			if !(_isOwner) throw "У вас нет прав на это действие";
			_nameEdit = _pageSettings controlsGroupCtrl 2106;
			if ([ctrlText _nameEdit] call RRPClient_util_checkASCII) throw "Можно использовать только латинские символы от A-Z и a-z";
			if ((ctrlText _nameEdit) isEqualTo _name) throw "Ваша компания уже так называется";
			["rename",_id,[ctrlText _nameEdit]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
			RRPClientLtdsWaitingResponse = true;
		};
		case "withdraw": 
		{
			if !(_isOwner) throw "У вас нет прав на это действие";
			_withdrawMin = getNumber(getMissionConfig "CfgLtds" >> "allowToWithdraw");
			if (_withdrawMin > _bank) throw format ["Вывод средств доступен от $%1",[_withdrawMin] call RRPClient_util_numberText];
			[
				(uiNamespace getVariable ["RRPDialogTablet",displayNull]),
				{
					["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
					["withdraw",RRPClientLTDsData#0,[player]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
				},[],
				"Вывести средства?",
				format ["Вы уверены что хотите вывести средства с компании '%2'? Комиссия составляет 3%1, итоговая сумма составляет $%3","%",RRPClientLTDsData#1, [round(_bank - (_bank * 0.03))] call RRPClient_util_numberText]
			] call RRPClient_util_prompt;
		};
		case "changeOwner": 
		{
			if !(_isOwner) throw "У вас нет прав на это действие";
			private _selectedUid = _listManagers lbData (lbCursel _listManagers);
			private _playerName = _listManagers lbText (lbCursel _listManagers);
			if (_selectedUid isEqualTo "") throw "Вы никого не выбрали";
			if (_selectedUid isEqualTo _owner) throw "Для начала нужно передать руководителя компании другому";
			_display setVariable ["temp",[_selectedUid,_playerName]];

			[
				(uiNamespace getVariable ["RRPDialogTablet",displayNull]),
				{
					["changeOwner",RRPClientLTDsData#0,[(uiNamespace getVariable ["RRPDialogTablet",displayNull]) getVariable ["temp",[]]]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
				},[],
				"Вывести средства?",
				format ["Вы уверены что хотите передать управление компанией '%2' для %1? Это действие необратимо", _playerName, RRPClientLTDsData#1]
			] call RRPClient_util_prompt;
		};
		case "removeManager": 
		{
			if !(_isOwner) throw "У вас нет прав на это действие";
			private _selectedUid = _listManagers lbData (lbCursel _listManagers);
			private _playerName = _listManagers lbText (lbCursel _listManagers);
			if (_selectedUid isEqualTo "") throw "Вы никого не выбрали";
			if (_selectedUid isEqualTo _owner) throw "Для начала нужно передать руководителя компании другому";
			_display setVariable ["temp",[_selectedUid,_playerName]];
			[
				(uiNamespace getVariable ["RRPDialogTablet",displayNull]),
				{
					["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
					["removeManager",RRPClientLTDsData#0,[(uiNamespace getVariable ["RRPDialogTablet",displayNull]) getVariable ["temp",[]]]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
				},[],
				"Уволить?",
				format ["Уволить менеджера '%1'", _playerName]
			] call RRPClient_util_prompt;
		};
		case "addManager": 
		{
			if !(_isOwner) throw "У вас нет прав на это действие";
			if (isNull curTarget) throw "Игрок не определен";
			if !(isPlayer curTarget) throw "Это не игрок";
			
			[
				(findDisplay 46),
				{
					["askToAdd",RRPClientLTDsData#0,format["%1 пригласил вас в компанию '%2' на должность менеджера",player call getFullname,(RRPClientLTDsData#0 call RRPClient_ltds_util_getNameLtd)]] remoteExecCall ["RRPClient_ltds_ltd_actions",curTarget];
				},[],
				"Принять в компанию?",
				format ["Вы хотите принять в компанию '%1'?",curTarget call getFullname]
			] call RRPClient_util_prompt;

		};
		case "askToAdd": 
		{
			if !(RRPClientLTDsData isEqualTo []) then
			{
				["ErrorTitleAndText",["Управление бизнесом",format ["%1 уже состоит в другой компании",player call getFullname]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
				throw "Кто-то хотел пригласить вас в другую компанию...";
			};
			idinvited = _this select 1;
			[
				(findDisplay 46),
				{
					["addManager",idinvited,[player,remoteExecutedOwner]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
				},[],
				"Принять в приглашение?",
				_this select 2
			] call RRPClient_util_prompt;
		};
		case "deleteCompany": 
		{
			if !(_isOwner) throw "У вас нет прав на это действие";
			[
				(uiNamespace getVariable ["RRPDialogTablet",displayNull]),
				{
					["InfoTitleOnly",["Отправляем запрос на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
					["deleteCompany",RRPClientLTDsData#0,[player]] remoteExecCall ["RRPServer_ltds_ltd_actions",2];
				},[],
				"Удалить компанию?",
				format ["Вы уверены что хотите удалить компанию '%1'? Все деньги которые у вас на счету, а так же все магазины/казино/азс будут удалены, это действие невозвратно!",RRPClientLTDsData#1]
			] call RRPClient_util_prompt;
		};
		case "deleteCompanyResponse":
		{
			if !(isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) then {["MainMenu",0] call RRPClient_tablet_slide};
			private _name = (_this select 1);
			["InfoTitleAndText",["Бизнес",format["Компания '%1' была упразднена. Благодарим за сотрудничество!",_name]]] call toast;
			RRPClientLTDsData = [];
		};
		case "refresh":
		{
			switch (param [1,"",[""]]) do
			{
				case "main": _refreshMain;
				case "directPlayer": 
				{
					switch (param [2,"",[""]]) do
					{
						case "punish": 
						{
							private _response = param [3,""];
							["InfoTitleAndText",["Управление бизнесом",_response]] call SmartClient_gui_toaster_addTemplateToast;
							RRPClientLTDsData = [];
						};
						case "ceo": 
						{
							private _response = param [3,""];
							["InfoTitleAndText",["Управление бизнесом",_response]] call SmartClient_gui_toaster_addTemplateToast;
						};
						case "add": 
						{
							private _response = param [3,""];
							private _data = param[4,[],[[]]];
							["InfoTitleAndText",["Управление бизнесом",_response]] call SmartClient_gui_toaster_addTemplateToast;
							RRPClientLTDsData = _data;
						};
						case "register": 
						{
							private _response = param [3,[],[[]]];
							RRPClientLTDsData = _response;
							["InfoTitleAndText",["Управление бизнесом",format ["'%1' компания успешно зарегистрирована<br/>Надеемся, что Вы сможете стать успешным!",RRPClientLTDsData#1]]] call SmartClient_gui_toaster_addTemplateToast;
							RRPClientAtmWaitingResponse = false;
						};
					};
				};
				case "store": _storeRefresh;
				case "casino": _casinoRefresh;
				case "fuels": {};
				default {};
			};
		};
		default {throw "Чего чего чего?"};
	};
}catch{
	["ErrorTitleAndText",["Управление бизнесом",_exception]] call SmartClient_gui_toaster_addTemplateToast;	
	RRPClientLtdsWaitingResponse = false;
};
true
}