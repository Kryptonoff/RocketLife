/*
	Project: Smart house system
	Author: FairyTale5571
	License: CC BY-ND
*/

_house = RRPClientSelectedHouse;
try
{
	if (isNull _house) throw "Нет такого дома";
	_houseNeigh = _house getVariable ["Neighs",[]];
	_houseOwner = _house getVariable ["house_owner",[]] select 0;
	if !(getPlayerUID player in _houseNeigh) throw "Вы не можете оплатить услуги!";
	if !(_house getVariable ["PayTimeDude",false]) throw "Оплата пока что не доступна";
	
	_cost = _house getVariable ["cost_house",0];
	if !(getPlayerUID player isEqualTo _houseOwner) then {_cost = _cost * 1.5;};
	private _action = [format["Оплатить дом за $%1",[_cost] call RRPClient_util_numberText],"Оплата","Оплатить","Позже"] call BIS_fnc_guiMessage;

	if (_action) then 
	{
		if (RRPClientAtmMoney < _cost) throw "Вам не хватает денег!";
		["SuccessTitleAndText",["Мой дом","Отправка запроса об оплате на сервер..."]] call toast;

		[player,"atm","take",STR(_cost)] remoteExecCall ["RRPServer_system_moneyChange",2];
		[netID _house,netID player] remoteExecCall ["RRPServer_houses_payForHouse",2]; 
	};

}catch{
	["ErrorTitleAndText",["Мой дом",_exception]] call toast;
};
