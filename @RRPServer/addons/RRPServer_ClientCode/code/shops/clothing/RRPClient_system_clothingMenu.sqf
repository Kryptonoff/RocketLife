/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
try{
	private ["_shop","_conditions","_display"];
	_shop = param [0,"",[""]];
	if !(isClass(missionConfigFile >> "LifeCfgClothShops" >> _shop)) throw format ["Магазин ""%1"" не определен",_shop];
	if (server_restartSoon) throw "Надвигается буря. Все магазины закрыты.";

	_conditions = getText(missionConfigFile >> "LifeCfgClothShops" >> _shop >> "conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw (getText(missionConfigFile >> "LifeCfgClothShops" >> _shop >> "conditionsMessage"));


	if !(createDialog "RRPDialogClothingShop") throw "Ошибка при создании диалога";
	_display = uiNamespace getVariable ["RRPDialogClothingShop",displayNull];

	ctrlSetText [3103,getText(missionConfigFile >> "LifeCfgClothShops" >> _shop >> "displayName")];
	ctrlSetText [601,format["Наличность: $%1 / RCredits: %2      ",[RRPClientCashMoney] call RRPClient_util_numberText,[RRPClientCredits] call RRPClient_util_numberText]];

	currentShop = _shop;
	RRPClientClothingCat = [];
	RRPClientClothingTotal = 0;
	RRPClientClothingTemplates = false;
	RRPClientClothingBackPackCount = false;
	backpackADddet = false;

	life_oldClothes = uniform player;
	life_olduniformItems = uniformItems player;
	life_oldBackpack = backpack player;
	life_oldBackpackItems = backpackItems player;
	life_oldVest = vest player;
	life_oldVestItems = vestItems player;
	life_oldGlasses = goggles player;
	life_oldHat = headGear player;

	call RRPClient_system_shopBoxClothesCreate;
	(findDisplay 3100) displayAddEventHandler ["MouseButtonDown","if ((_this select 1) == 1) then {life_rbm = true}"];
	(findDisplay 3100) displayAddEventHandler ["MouseButtonUp","if ((_this select 1) == 1) then {life_rbm = false}"];
	(findDisplay 3100) displayAddEventHandler ["MouseMoving", "_this call RRPClient_system_shopBoxCameraRotate"];
	(findDisplay 3100) displayAddEventHandler ["MouseZChanged", "_this call RRPClient_system_shopBoxCameraZoom"];

	private ["_filter","_moneySwitch"];
	_filter = _display displayCtrl 3105;
	_moneySwitch = _display displayCtrl 31011;

	lbClear _filter;
	_filter lbAdd "Одежда";
	_filter lbAdd "Шляпы";
	_filter lbAdd "Очки";
	_filter lbAdd "Жилеты";
	_filter lbAdd "Рюкзак";
	_filter lbSetCurSel 0;

	lbClear _moneySwitch;
	{
		_x params ["_class","_text","_img"];
		private _index = _moneySwitch lbAdd _text;
		_moneySwitch lbSetData [_index, _class];
		_moneySwitch lbSetPictureRight [_index, _img];
	} forEach getArray(missionConfigFile >> "shopSettings" >> "currencyList");
	_moneySwitch lbSetCurSel 0;
	currencyType = _moneySwitch lbData 0;


	call RRPClient_system_renderAssortmentList;
	call RRPClient_shops_renderListTemplates;
	RRPClothingBasket = [];
}catch {
	[_exception] call toastError;
};
