/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
disableSerialization;
try
{
	if (isNull (findDisplay 7100)) throw "";
	if (life_action_inUse) throw "";
	private _ltdName = ctrlText (CONTROL(7100,7102));
	if (EQUAL(_ltdName,"")) throw "Имя не задано";
	private _length = count (toArray(_ltdName));
	private _ltdNameArray = toArray (_ltdName);
	private _allowedArray = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnm ");
	private _space = (toArray " ") select 0;

	if (BANK < 1000) throw "У вас недостаточно денег на счету. Должно быть больше $1000";
	if (_length < 5) throw "Название должно содержать как минимум 5 символов";
	if (_length > 20) throw "Название должно содержать не более 20 символов";
	if (EQUAL(_ltdNameArray select 0,_space)) throw "Пробел в начале названия недопустим";
	if (EQUAL(_ltdNameArray select (_length-1),_space)) throw "Пробел в конце названия недопустим";

	private _badChar = false;
	{
		if !(_x in _allowedArray) exitWith {_badChar = true};
	} forEach _ltdNameArray;
	if (_badChar) throw "Все сиволы в названии должны быть в верхнем регистре и содержать только латинские символы от A до Z";

	{
		if (EQUAL(_x,_space) && (EQUAL((_ltdNameArray select (_forEachIndex + 1)),_space))) exitWith {_badChar = true};
	} forEach _ltdNameArray;
	if (_badChar) throw "Два пробела подряд запрещены";

	life_action_inUse = true;
	(CONTROL(7100,7103)) ctrlEnable false;
	[steamid,_ltdName,player] remoteExec ["RRPServer_ltd_regAction",RSERV];
	["ErrorTitleOnly", ["Отправка запроса на сервер..."]] call SmartClient_gui_toaster_addTemplateToast;
	
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true