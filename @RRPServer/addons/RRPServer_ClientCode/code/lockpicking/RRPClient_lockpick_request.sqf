params [["_lockpick_target", objNull]];

_picked = false;
try{
	if (_lockpick_target in life_vehicles) throw "У вас есть ключи";
    if (isNull _lockpick_target) throw "Че Че че???";
    if !([_lockpick_target] call RRPClient_system_isVehicleKind) throw "Это вообще не взламывается";
    if !(alive _lockpick_target) throw "Тут уже нечего взламывать!";
    if (_lockpick_target getVariable ["vehicle_limits", ""] isNotEqualTo "") throw "Ее не взломать...";
	if !(call RRPClient_system_checkMask) throw "Нужна маска, а то вдруг меня заметят";
	if !([_lockpick_target] call RRPClient_system_isVehicleKind) throw "Это вообще не взламывается";
	if (([_lockpick_target] call RRPClient_system_isSafeZone) # 0) throw "Техника находится в защищенной зоне";
	if !("extItem_lockpick" in (magazines player)) throw "У вас нет отмычек!";
	
	private _distance = (((boundingBox _lockpick_target) select 1) select 0) + 2;
	if (player distance _lockpick_target > _distance) throw "Нужно подойти ближе";

	private _chance = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _lockpick_target >> "breakingChance");
	private _lockLVL = if (_chance < 0) then {7} else {[_lockpick_target] call RRPClient_vehicle_countChanceBreakingLock select 2};

	private _picked = [_lockLVL] call RRPClient_lockpick_hud_lockpick;
	if !(_picked) then {
		["play", _lockpick_target] remoteExecCall ["BIS_fnc_carAlarm",-2];
		['badcracker',1] call RRPClient_ach_gateway;
		["extItem_lockpick"] call RRPClient_system_removeItemFromInventory;
		throw "Отмычка сломалась...";
	};
	
	["Техника взломана!","Теперь у вас есть ключи от этой техники."] call toastSuccess;
	[getPlayerUID player,"487"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
    life_vehicles pushBack _lockpick_target;
	private _db = _lockpick_target getVariable ["dbInfo",[]];
	[20 * _lockLVL, "взлом техники"] call addXP;
	[
		"hotwire","","","",false,
		[
			[
				"Steam профиль",
				[
					"**Игрок "+name player+" взломал технику**:",
					format ["**Авто:** %1 (%2) ",getText(configOf _lockpick_target >> "displayName"),typeOf _lockpick_target],
					"**Уровень авто:** "+ str _lockLVL +"",
					"**Номер авто:** "+ (_db select 1) +"",
					"**UID владельца:** " + (_db select 0) + "x",
					"**Рядом с локацией:** " + str ([getPosWorld player] call mav_taxi_fnc_nearestLocation),
					"**Точная позиция:** " + str(getPosWorld player)
				] joinString "\n",
				"https://steamcommunity.com/profiles/" + getPlayerUID player,
				"fde910",false,"","",[],[]
			]
		]
	] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
}catch{
	["Взлом",_exception] call toastError;
	_picked = _exception;	
};
_picked;
