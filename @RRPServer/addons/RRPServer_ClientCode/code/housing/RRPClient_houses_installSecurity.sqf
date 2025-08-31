/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

private _house = RRPClientSelectedHouse;
private _cost = getNumber(missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "securityCost");

private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 22000;
private _secBtn = _slide controlsGroupCtrl 22011;
private _numberCrates = (getNumber (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "numberCrates"));
private _canGarage = (getNumber (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house >> "canGarage") isEqualTo 1);
try
{
	if (isNull _house) throw "Дом не выбран!";
	if (_cost isEqualTo 0) throw "Этот дом не поддерживает охранные системы!";
	if (_numberCrates isEqualTo 0 OR {_canGarage}) throw "Этот дом не поддерживает охранные системы!";
	if !(_house getVariable ["security",false]) then
	{
		private _action = [
			format["Вы уверены что хотите приобрести охранную систему? Установка обойдется вам за $%1, также за обслуживание $%2 (Будет включено в квартплату)",[_cost] call RRPClient_util_numberText,round (_cost / 4)],
			"Покупка дома","Купить","Отменить"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			if (RRPClientAtmMoney < _cost) throw "Недостаточно средств!";
			[player,"atm","take",STR(_cost)] remoteExecCall ["RRPServer_system_moneyChange",2];

			[netID _house,0] remoteExecCall ["RRPServer_house_securityHouseRequest",2];
			["SuccessTitleAndText",["Мой дом","Охранная система установлена!"]] call toast;
			_secBtn ctrlSetText "УБРАТЬ ОХРАНУ";			
		};
	}else{
		private _action = [
			format["Вы уверены что хотите убрать охранную систему? Средства затраченные при установке не вернутся на счет!"],
			"Покупка дома","Убрать","Отменить"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			[netID _house,1] remoteExecCall ["RRPServer_house_securityHouseRequest",2];
			["SuccessTitleAndText",["Мой дом","Охранная система убрана!"]] call toast;
			_secBtn ctrlSetText "УСТАНОВИТЬ ОХРАНУ";			
		};
	};
}catch{
	["ErrorTitleAndText",["Мой дом",_exception]] call toast;
};
true
