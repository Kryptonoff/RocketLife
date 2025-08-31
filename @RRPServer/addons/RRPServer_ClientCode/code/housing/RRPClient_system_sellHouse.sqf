/*
	Filename: 	RRPClient_system_sellHouse.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _house = RRPClientSelectedHouse;
try{
	if(RRPClientWaitHouseSellResponse) exitWith {};
	if (isNull _house) exitWith {};
	if !(_house isKindOf "House_F") exitWith {};
	RRPClientWaitHouseSellResponse = true;
	if (isNil {_house GVAR "house_owner"}) throw "There is no owner for this house.";
	if !((_house getVariable ["house_owner",[]] select 0) isEqualTo getPlayerUID player) throw "Вы не можете продать этот дом!";
	if (_house getVariable ["buyed_in_session",false]) throw "Не могу дозвонится риелтору, попробуйте после бури!";

	closeDialog 0;

	if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {};
	private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
	_sellPrice = (_price * 0.15);

	private _action = [
		format["Вы уверены, что хотите продать свой дом? Он будет продан за %1 ",[_sellPrice] call RRPClient_util_numberText,_price],
		"Продать дом",
		"Продать",
		"Отменить"
	] call BIS_fnc_guiMessage;

	if (_action) then 
	{
		[_house,_sellPrice,player,steamid] remoteExec ["RRPServer_house_sellHouse",2];
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
true
