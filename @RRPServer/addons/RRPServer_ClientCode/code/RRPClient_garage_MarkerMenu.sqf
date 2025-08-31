/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

#include "..\script_macros.hpp"
private _spawnPos = param [0,"",[""]];
private _type = param [1,"",[""]];


if (life_jail_coin  > 0) exitWith {["WarningTitleAndText", ["Внимание!", "У Вас есть долг перед государством, ваш счет временно заморожен в банке до окончания исправительных работ!"]] call SmartClient_gui_toaster_addTemplateToast;};
if ((time - life_garage_timer) < 10) exitWith {["InfoTitleOnly",["Гараж закрыт на обед. Зайдите еще раз через 10 секунд."]] call toast};

life_garage_timer = time;
life_garage_sp = _spawnPos;
life_garage_sp_name = _spawnPos;
life_garage_type = _type;
life_garage_isHouse = false;

[steamid,_type,player] remoteExec ["RRPServer_garage_getVehicles",2];

createDialog "UnionDialogImpound";
disableSerialization;
waitUntil {!isNull (findDisplay 2800)};
ctrlSetText[2802,("Поиск автомобилей...")];
ctrlShow[2803,false];
ctrlShow[2812,false];
ctrlShow[2813,false];
ctrlShow[2814,false];
ctrlShow[2815,false];
ctrlShow[2816,false];