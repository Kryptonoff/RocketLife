/*

	Filename: 	RRPClient_admin_Menu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private["_title","_playersList","_playerInfo","_playerLicenses","_playerLloot","_getLootButton","_spectateButton","_freezeButton","_teleportToMeButton","_teleportToHimButton","_banButton","_kickButton","_housesList","_getHousesButton","_vehiclesList","_getVehiclesButton","_cmdExecuteButton","_cmdWindow","_lockButton","_unLockButton","_compensateButton","_markersButton","_godButton","_teleportButton","_color","_invisButton","_name"];
if(FETCH_CONST(life_adminlevel) < 2) exitWith {};

disableSerialization;
if(isNull (findDisplay 2900)) then {
	if !(createDialog "RRPDialogAdmin") exitWith {};
};

_display = uiNamespace getVariable ["RRPDialogAdmin",displayNull];
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0};

_title = CONTROL(2900,2901);
_playersList = CONTROL(2900,2902);
_playerInfo = CONTROL(2900,2903);
_playerLicenses = CONTROL(2900,2904);
_playerLloot = CONTROL(2900,2905);

_getLootButton = CONTROL(2900,2906);
_spectateButton = CONTROL(2900,2907);
_freezeButton = CONTROL(2900,2908);
_teleportToMeButton = CONTROL(2900,2909);
_teleportToHimButton = CONTROL(2900,2910);
_banButton = CONTROL(2900,2912);
_kickButton = CONTROL(2900,2911);

_housesList = CONTROL(2900,2913);
_getHousesButton = CONTROL(2900,2914);

_vehiclesList = CONTROL(2900,2915);
_getVehiclesButton = CONTROL(2900,2916);

_cmdExecuteButton = CONTROL(2900,2917);
_cmdWindow = CONTROL(2900,2918);
_lockButton = CONTROL(2900,2919);
_unLockButton = CONTROL(2900,2920);

_compensateButton = CONTROL(2900,2921);
_markersButton = CONTROL(2900,2922);
_godButton = CONTROL(2900,2923);
_teleportButton = CONTROL(2900,2924);
_invisButton = CONTROL(2900,2925);
_cmdWindow ctrlShow false;
_cmdExecuteButton ctrlShow false;
if(FETCH_CONST(life_adminlevel) == 5) then {
_cmdWindow ctrlShow true;
_cmdExecuteButton ctrlShow true;
};

_title ctrlsettext format["Rocket Life %6                 Игроков: %5                 Полиция: %1 | МЧС: %2 | Бандиты: %3 | Гражданские: %4", ["cop"] call RRPClient_system_playerCount, ["med"] call RRPClient_system_playerCount,["reb"] call RRPClient_system_playerCount, ["civ"] call RRPClient_system_playerCount, count allPlayers, briefingName];

lbClear _playersList;

{
	_color = [_x] call RRPClient_util_sides_getColor;

	if (GVAR_RNAME(_x) == "") then {
		_name = format ["%1",name _x];
		_color = [0.624,0.624,0.624,1];
	} else {_name = GVAR_RNAME(_x)};

	_playersList lbAdd format["%1 (%2)", _name,(_x getVariable ["tsNickName",name player])];
	_playersList lbSetColor [(lbSize _playersList)-1,_color];
	_playersList lbSetdata [(lbSize _playersList)-1,str(_x)];
} foreach allPlayers;

lbSort [_playersList,"ASC"];

_banReasonList = _display displayCtrl 2927;
lbClear _banReasonList;

_index = 0;
{
	_banReasonList lbAdd format["%1",_x];
	_banReasonList lbSetData [(_index + 1),_x];
} forEach getArray(missionConfigFile >> "LifeCfgSettings" >> "LifeCfgBanReasons");

if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
