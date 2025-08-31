/*

	Filename: 	RRPClient_rob_robGas.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try
{
	params ["_target", "_caller", "_actionId"];
	if (life_action_inUse) throw "Вы заняты";
	if (call RRPClient_system_isInterrupted) throw "Вы заняты";
	if !(isNull objectParent player) throw "Вам нужно выйти из машины";
	if ( count("cop" call RRPClient_util_getPlayersBySide) < getNumber(missionConfigFile >> "CfgJobs" >> "life_cop_min_illegal")) throw format ["Должно быть минимум %1 полицейских на острове чтобы продолжить",getNumber(missionConfigFile >> "CfgJobs" >> "life_cop_min_illegal")];
	if (_target getVariable ["robinprogress",false]) throw "Заправку уже кто-то грабит";
	if ((currentWeapon player isEqualTo "") OR (currentWeapon player isEqualTo "Binocular") OR (["Extremo_Sign",currentWeapon player] call RRPClient_util_xString) OR (["Extremo_Tool",currentWeapon player] call RRPClient_util_xString)) throw "И чего я должен испугаться?! Вали отсюда!";

	[_target,"robinprogress",true] call CBA_fnc_setVarNet;

	if (random(100) > 50) then {
		["Темки", "Сработала сигнализация и полиция оповещена об ограблении!"] call toastWarning;
		[1,format["!!! Магазин (координаты: %1) обносится криминальными элементами !!!", mapGridPosition _target]] remoteExecCall ["RRPClient_system_broadcast",("cop" call RRPClient_util_getPlayersBySide)];
		[getPlayerUID player,"211"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	};

	private _marker = createMarker [format ["wrgMarker_%1", random(1000)], getPos player];
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "!!! Идет ограбление !!!";
	_marker setMarkerType "mil_warning";

	["Грабим заправку",10,{player distance _target > 5}] call RRPClient_system_progressBarSimple;
	deleteMarker _marker;
	[_target,"robinprogress"] call RRPClient_system_clearGlobalVar;
	if (call RRPClient_system_isInterrupted) throw "Действие отменено";
	if (player distance _target > 5) throw "Вы слишком далеко отошли!";

	life_rob_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_rob_job;
	_target removeAction _actionId;

	RRP_job_waypoints deleteAt "rob_point";

	_price = ("rob" call RRPClient_economy_getResInfo) select 2;

	_price = round (_price + random _price);
	if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
	["Темки", format ["Вы успешно выполнили работу, вы получили $%1 грязными деньгами",[_price] call RRPClient_util_numberText]] call toastSuccess;
	// ["RobGasDone"] spawn добавитьОпытЕпта;
	[player,"dcash","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
	[getPlayerUID player,"211"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	life_job_inProgress = false;
	[100,"оргабление"] call addXP;

	["addSelled", "rob", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];

	// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "robGas", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
} catch {
	["Темки", _exception] call toastError;
};
