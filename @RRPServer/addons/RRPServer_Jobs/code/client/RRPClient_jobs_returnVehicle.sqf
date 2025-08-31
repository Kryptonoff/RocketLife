/*

	Filename: 	RRPClient_jobs_returnVehicle.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if (time - life_check_timer < 3) throw "Возвращать технику можно не чаще одного раза в 3 секунды";
	private _vehicle = missionNamespace getVariable [format["life_%1_vehicle",_this],objNull];
	if (isNull _vehicle) throw "Техника потеряна или уничтожена";

	private _spawnPointPos = getMarkerPos (getText(missionConfigFile >> "CfgJobs" >> _this >> "life_office_spawn"));
	private _price = getNumber(missionConfigFile >> "CfgJobs" >> _this >> "life_vehicle_price");

	if (_vehicle distance _spawnPointPos > 50) throw "Техника должна находиться рядом";
	deleteVehicle _vehicle;
	[_this] call RRPClient_gui_DestroyRscLayer;

	[player,"atm","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
	["Работа", format["Вам вернули $%1 за возврат техники",_price]] call toastSuccess;
	life_check_timer = time;
} catch {
	["Работа", _exception] call toastError;
};
