/*

	Filename: 	RRPClient_terror_bombPlant.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
try
{
	if (life_action_inUse) throw "Вы заняты";
	params ["_target", "_caller", "_actionId"];
	if (random(100) >= 50) then {
		["Темки", "Вас заметили жители, о вашей деятельности сообщено в полицию"] call toastWarning;
		[[1,2],format["!!! Террорист (координаты: %1) орудует у церкви в городе %2 !!!",mapGridPosition player, text (nearestLocation[getPos player,"NameCity"])],false,[]] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];
		[getPlayerUID player,"240"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	};

	["Устанавливаем бомбу",100,"","",true] call RRPClient_system_progressBarCustom;
	if (call RRPClient_system_isInterrupted) then {life_interrupted = false; throw "Ваше действие было прекращено"};
	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	if (life_interrupted) then {life_interrupted = false; throw "Действие отменено"};
	_target removeAction _actionId;

	["Темки", "Бомба установлена, взрыв будет через 10 сек"] call toastWarning;
	_target allowDamage false;
	["Ждем взрыв...",10] call RRPClient_system_progressBarSimple;
	"Bo_GBU12_LGB_MI10" createVehicle [getPosATL _target select 0, getPosATL _target select 1, (getPosATL _target select 2)+0.5];

	life_terror_job setTaskState "SUCCEEDED"; 

	_price = ("terror" call RRPClient_economy_getResInfo) select 2;
	if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};
	["Темки", format ["Вы успешно выполнили работу, получите вознаграждение в $%1 грязными деньгами",_price]] call toastSuccess;

	[player,"dcash","add", _price] remoteExecCall ["RRPServer_system_moneyChange",2];
	life_terror_job setTaskState "SUCCEEDED"; 
	player removeSimpleTask life_terror_job;
	life_job_inProgress = false;
	RRP_job_waypoints deleteAt "terror_point";

	["addSelled", "terror", 1] remoteExecCall ["RRPServer_economy_updateStatus",2];

	[400,"выполненную работу"] call addXP;
	// [["earning", getPlayerUID player, (player getVariable ["realname",""]), "terror", time - life_job_startTime, _price],"customLog"] call серверныйЛогНахуй;
} catch {
	["Темки", _exception] call toastError;
};
