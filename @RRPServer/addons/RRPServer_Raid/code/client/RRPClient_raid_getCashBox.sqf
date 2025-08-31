/*

	Filename: 	RRPClient_raid_getCashBox.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
params [
	["_object", objNull, [objNull]]
];

private _price = getNumber(missionConfigFile >> "CfgRaid" >> "CashBox" >> "award");
if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
["Чемодан с деньгами", format ["Вы забрали $%1 грязных денег", _price]] call toastSuccess;
[player,"dcash","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

deleteVehicle _object;
remoteExecCall ["", -2, netId _object];
[_object] remoteExecCall ["removeAllActions", -2];
