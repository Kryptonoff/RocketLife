
#define DISPLAY (uiNamespace getVariable ["RRPDialogTablet",displayNull])
#define PAGESTOREIDC(x) (DISPLAY displayCtrl 1038) controlsGroupCtrl x
#define SELECTEDSTORE ((uiNamespace getVariable ["RRPDialogTablet",displayNull]) getVariable ["selectedStore",objNull])
#define CONFIGSTORE(x) 	_config = getMissionConfig "CfgLtds" >> "stores" >> vehicleVarName x; if !(isClass _config) then {_config = getMissionConfig "CfgLtds" >> "stores" >> "abstract"};

private _mode = param [0,"",[""]];
systemChat str _this;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainPage = _display displayCtrl 24001;
private _ltdSlide = _mainPage controlsGroupCtrl 38000;
private _storePage = _ltdSlide controlsGroupCtrl 1038;
try
{
	_store = _display getVariable ["selectedStore",objNull];
	if (isNull _store) throw "Выбранный магазин не определен, попробуйте еще раз";
	_config = getMissionConfig "CfgLtds" >> "stores" >> vehicleVarName _store;
	if !(isClass _config) then {_config = getMissionConfig "CfgLtds" >> "stores" >> "abstract"};
	_display setVariable ["storeVar",_store];
	switch _mode do
	{
		case "pay": 
		{
			if (RRPClientCredits < getNumber(_config >> "rentCost")) throw (format ["У вас недостаточно средств! Стоимость оплаты %1 RC",getNumber(_config >> "rentCost")]);
			[
				DISPLAY,
				{
					CONFIGSTORE(SELECTEDSTORE);
					["pay",SELECTEDSTORE,[player,getNumber(_config >> "rentCost")]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
				},[],
				"Оплатить магазин?",
				format ["Стоимость оплаты магазина %2 составляет %1 RC", getNumber(_config >> "rentCost"), _store getVariable ["ltdName","UNDEFINED"]]
			] call RRPClient_util_prompt;
		};
		case "upgrade": 
		{
			if (RRPClientCredits < getNumber(_config >> "costUpgrade")) throw (format ["У вас недостаточно средств! Стоимость улучшения %1 RC",getNumber(_config >> "costUpgrade")]);
			[
				DISPLAY,
				{
					CONFIGSTORE(SELECTEDSTORE);
					["upgrade",SELECTEDSTORE,[player,getNumber(_config >> "costUpgrade")]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
				},[],
				"Улучшить магазин?",
				format ["Вы уверены что хотите улучшить магазин %2? Это добавит 5 слотов в автомат! Стоимость улучшения составит %1 RC", getNumber(_config >> "costUpgrade"), _store getVariable ["ltdName","UNDEFINED"]]
			] call RRPClient_util_prompt;
		};
		case "setDiscount":
		{
			_discountList = _pageStore controlsGroupCtrl 2204;
			_discountDayList = _pageStore controlsGroupCtrl 2205;
			
			_display setVariable ["dTemp",[
				lbValue[2204,lbCurSel 2204],
				lbValue[2205,lbCurSel 2205]
			]];
			if !((_store getVariable ["ltdDiscount",0]) isEqualTo 0) throw "Нельзя установить новую скидку, пока действует предыдущая";
			[
				DISPLAY,
				{
					["setDiscount",SELECTEDSTORE,DISPLAY getVariable ["dTemp",[]]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
				},[],
				"Установить скидку?",
				format ["Срок и значение скидки невозможно отменить/изменить до их окончания действия! Товары которые продаются сейчас будут продаваться без скидки."]
			] call RRPClient_util_prompt;
		};
		case "rename":
		{
			private ["_nameCtrl","_nameEdit","_name","_check"];
			_nameCtrl = _display displayCtrl 2216;
			_nameEdit = ctrlText _nameCtrl;
			_name = _store getVariable ["ltdName","UNDEFINED"];
			if (_nameEdit isEqualTo "") throw "Вы ничего не ввели!";
			if (_nameEdit isEqualTo _name) throw "Название должно отличаться!";
			_check = [_nameEdit,getText(missionConfigFile >> "LifeCfgSettings" >> "allowAlphabet")] call RRPClient_util_containsForbiddenCharacter;
			if !(_check isEqualTo -1) throw format ["Нельзя использовать символ '%1'",_check];
			["rename",SELECTEDSTORE,[_nameEdit]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
		};
		case "tax":
		{
			_display setVariable ["dTemp",[lbValue[2210,lbCurSel 2210]]];
			[
				DISPLAY,
				{
					["tax",SELECTEDSTORE,DISPLAY getVariable ["dTemp",[]]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
				},[],
				"Установить новую комиссию?",
				format ["Устанавливая новую комиссию, товары продаваемые сейчас будут продаваться по старой комиссией. Не забывайте, чем больше комиссия, тем менее привлекателен ваш магазин для других поставщиков!"]
			] call RRPClient_util_prompt;
		};
		case "lockUnlock": 
		{
			_input = param [1,[],[[]]];
			_cb = PAGESTOREIDC(2219);
			_cb ctrlEnable false;
			["lockUnlock", SELECTEDSTORE,[_input#1]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
		};
		case "mode": 
		{
			_input = param [1,[],[[]]];
			_cb = PAGESTOREIDC(2207);
			_cb ctrlEnable false;

			["mode", SELECTEDSTORE,[_input#1]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
		};
		case "remove": 
		{
			[
				DISPLAY,
				{
					["remove",SELECTEDSTORE,[player]] remoteExecCall ["RRPServer_ltds_stores_actions",2];
				},[],
				"Удалить магазин?",
				format ["Вы точно хотите удалить магазин %1? Вы потеряете к нему доступ и все товары, улучшения, срок оплаты сейчас будут утрачены! Это действие нельзя отменить!", getNumber(_config >> "costUpgrade"), _store getVariable ["ltdName","UNDEFINED"]]
			] call RRPClient_util_prompt;
		};
		default {};
	};
}catch{
	["ErrorTitleAndText",["Управление бизнесом",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
