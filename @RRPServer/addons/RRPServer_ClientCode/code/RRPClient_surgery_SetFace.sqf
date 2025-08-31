/*
	
	Filename: 	RRPClient_surgery_SetFace.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if ((call life_donator isEqualTo 0) and {!license_isGirl}) exitWith {
	["Пластическая хирургия", "Пластическая хирургия доступна только для пользователей со статусом VIP"] call toastError;
};
disableSerialization;
life_myIdentity = CONTROL_DATA(5402);
_cost = getNumber(getMissionConfig "CfgSurgery" >> if (license_isGirl) then {"Women"}else{"Man"} >> "cost");
if !(EQUAL(face player,life_myIdentity)) then {
	if (CASH < _cost) exitWith {
		["Пластическая хирургия","У вас недостаточно наличности"] call toastSuccess;
	};
	[player,life_myIdentity] remoteExec ["setFace",RANY,netId player];
	[["life_myIdentity",life_myIdentity,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;

	[[player,"cash","take",_cost],"system_moneyChange"] call RRPClient_system_hcExec;
	["Пластическая хирургия","Вы изменили свою внешность"] call toastSuccess;
	closeDialog 0;
};
