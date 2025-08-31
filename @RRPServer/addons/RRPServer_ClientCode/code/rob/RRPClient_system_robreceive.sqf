/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
params [
	["_cash",0,[0]],
	["_dcash",0,[0]]
];

if((_cash isEqualTo 0) and (_dcash isEqualTo 0)) exitWith {
	["ErrorTitleAndText", ["Внимание!", "В карманах пусто..."]] call SmartClient_gui_toaster_addTemplateToast;
};

[player,"cash","add",STR(_cash)] remoteExecCall ["RRPServer_system_moneyChange",2];
[player,"dcash","add",STR(_dcash)] remoteExecCall ["RRPServer_system_moneyChange",2];
["ErrorTitleAndText", ["Вы ограбили", format["+%1$ <br/>+$%2 грязных денег",(_cash call BIS_fnc_numberText),(_dcash call BIS_fnc_numberText)]]] call SmartClient_gui_toaster_addTemplateToast;
["thief",1] call RRPClient_ach_gateway;
[] spawn {
	if (!(life_use_atm)) exitWith {};
	life_use_atm = false;
	["InfoTitleAndText", ["Info", "Вы ограбили человека и не сможете 15 минут пользоваться банкоматом"]] call SmartClient_gui_toaster_addTemplateToast;
	uiSleep 900;
	life_use_atm = true;
	["InfoTitleAndText", ["Info", "Вы снова можете пользоваться банкоматом"]] call SmartClient_gui_toaster_addTemplateToast;
};
