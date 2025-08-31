/*
	Filename: 	RRPClient_system_buyHouse.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _house = curTarget;
	if (RRPClientWaitingMyCashResponse) exitWith {
		["ErrorTitleAndText",["Мой дом","Прудыдущая транзакция еще не завершена!"]] call toast;
	};
	disableSerialization;
	_dialog = uiNamespace getVariable ["RRPDialogHouseBuy",displayNull];
	_nameCtrl = _dialog displayCtrl 9106;
	_name = ctrlText _nameCtrl;
	if(count _name isEqualTo 0) throw "Вы должны назвать свой дом!";
	_alph = getText(missionConfigFile >> "LifeCfgSettings" >> "allowAlphabet");
	_chars = [_name,_alph] call RRPClient_util_containsForbiddenCharacter;
	if !(_chars isEqualTo -1) throw format ["Символ '%1' нельзя использовать!",_chars];

	if (isNull _house) exitWith {};
	if !(_house isKindOf "House_F") exitWith {};
	if (_house GVAR["house_owned",false]) throw "Этим домом уже владеют!";
	if (!isNil {_house GVAR "house_sold"}) throw "Этот дом был недавно продан и все еще обрабатывается базой данных.";

	if !(license_home) throw "У вас нет лицензии!";

	private _housesLimit = LIFE_SETTINGS(getNumber,"life_houseLimit");
	_housesLimit = ["houseLimit",_housesLimit] call RRPClient_system_VIP;
	if (["LandLord"] call perk) then {_housesLimit = _housesLimit + 1};

	if (life_houses_count >= _housesLimit) throw format["Максимальное количество домов: %1",_housesLimit];

	closeDialog 0;

	if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) throw "Здание не продается";
	private _conditions = M_CONFIG2(getText,"LifeCfgHousing",worldName,typeOf _house,"conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw "Этот дом нельзя купить";

	private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
	private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");

	private _action = [
		format["Этот дом стоит %1. Количество контейнеров для хранения: %2",[_price] call RRPClient_util_numberText,_numberCrates],
		"Покупка дома","Купить","Отменить"
	] call BIS_fnc_guiMessage;

	if (_action) then
	{
		if (BANK < _price) throw "Вам не хватает денег!";
		[_house,getPosATL _house,_name] call RRPClient_system_buyHouseDone;
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
