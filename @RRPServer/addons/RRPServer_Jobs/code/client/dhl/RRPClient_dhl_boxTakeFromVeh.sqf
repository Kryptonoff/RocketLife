/*

	Filename: 	RRPClient_dhl_boxTakeFromVeh.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !("dhl" call RRPClient_jobs_clothCheck) throw "Вы должны быть одеты в комплект формы компании DHL. А так же никакого оружия в руках или на виду";
	if !(isNull life_dhl_box) throw "У вас уже есть коробка";

	life_dhl_vehicle removeAction AID_TFW;

	[player] call RRPClient_dhl_boxSpawn;
	[] spawn RRPClient_dhl_boxPickUp;
} catch {
	["Работа", _exception] call toastError;
};
