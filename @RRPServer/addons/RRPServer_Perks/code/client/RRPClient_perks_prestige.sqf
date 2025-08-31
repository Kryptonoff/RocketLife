/*
** Author: Jack "Scarso" Farhall
** Description: 
*/

if !(canSuspend) exitWith {_this spawn RRPClient_perks_prestige};

params [
	"_button"
];



if (isNull _button) exitWith {};
private _display = ctrlParent _button;

private _action = [
	format["Вы точно хотите сбросить уровень прогресса и добавить уровень престижа?<br/>
	Это действие приведет к <t underline='1'>потере доступа ко всем открытым уже перкам</t>, но каждый уровень престижа добавит вам 1 слот для перка, 
	но не более %1 слотов.
<br/><br/>Вы уверены что хотите продолжить? <t color='#FF0000'>Это действие необратимо!</t>", getNumber (missionConfigFile >> "CfgPerks" >> "maxLimit")],
	"Престиж?",
	"Да",
	"Нет",
	_display
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

if !([] call RRPClient_perks_canPrestige) exitWith {};
_button ctrlShow false;

VRP_Perks = createHashMap;
VRP_Level = 1;
VRP_XP = 0;
VRP_Prestige = VRP_Prestige + 1;

call RRPClient_perks_update;
call RRPClient_tablet_app_perksUp_onOpen;
playSound "News_Jingle";