/*

	Filename: 	RRPClient_jobs_clothSpawn.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try 
{
	if !([getText(missionConfigFile >> "CfgJobs" >> _this >> "conditions")] call RRPClient_util_conditionsCheck) throw (getText(missionConfigFile >> "CfgJobs" >> _this >> "conditionsMessage"));
	if (_this call RRPClient_jobs_clothCheck) throw "Вы уже одеты в рабочую одежду!";

	private _price = getNumber(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_price");
	private _action = [format ["Для работы вам необходима рабочая одежда, стоимость покупки составляет $%1",[_price] call RRPClient_util_numberText],"Покупка рабочей одежды",localize "STR_Global_Yes",localize "STR_Global_No"] call BIS_fnc_guiMessage;

	if (_action) then {
		[player,"atm","take", _price] remoteExecCall ["RRPServer_system_moneyChange",2];

		_uniform = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_uniform");
		if (_uniform isNotEqualTo "") then {[_uniform] call RRPClient_system_addItem};

		_headgear = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_headgear");
		if (_headgear isNotEqualTo "") then {[_headgear] call RRPClient_system_addItem};

		_instrument = getText(missionConfigFile >> "CfgJobs" >> _this >> "life_cloth_instrument");
		if (_instrument isNotEqualTo "") then {[_instrument] call RRPClient_system_addItem};

		["Работа", "Вы купили рабочую одежду"] call toastSuccess;
	} else {
		["Работа", "Вы отказались от покупки одежды"] call toastInfo;
	};
} catch {
	["Работа", _exception] call toastError;
};
