

params [
	["_unit",Objnull,[Objnull]],
	["_source",Objnull,[Objnull]]
];

if (isNull _unit OR {isNull _source}) exitWith {};
if (life_hit_by_car) exitWith {};

if (!isNull life_DraggedBody) then {call RRPClient_system_dropDeadBody};

private _driver = (driver _source);

private _uid = "Нет данных";
private _target = objNull;
private _crew = (crew _source);
if (isNull _driver) then {
	_uid = "";
	{
		_uid = _uid + format [" %1 ",getPlayerUid _x];
	} forEach _crew;
	if (count _crew > 0) then {
		_target = _crew select 0;
	};
} else {
	_uid = getPlayerUID (driver _source);
	_target = (driver _source);
};

if (!life_hit_by_car && {alive player}) then 
{
	life_hit_by_car = true;
	_message = format ["[%1] пытался вас задавить! Сделайте скриншот, если считаете это намеренным наездом!",_uid];
	titleText [_message,"PLAIN"];
	_message call chat;

	[
		"VRDM","","","",false,
		[
			[
				"Steam профиль",
				[
					"**Игрока "+name player+" пытаются задавить**:",
					"**Авто с номерами "+ str (_source getVariable ["dbInfo",[]]) +"**",
					"**Водитель с UID: " + _uid + "**",
					"**Рядом с локацией:** " + str ([getPosWorld player] call mav_taxi_fnc_nearestLocation),
					"**Точная позиция:** " + str(getPosWorld player)
				] joinString "\n",
				"https://steamcommunity.com/profiles/" + getPlayerUID player,
				"fde910",false,"","",[],[]
			]
		]
	] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];

	uiSleep 3;	
	// [player,"stand"] remoteExecCall ["RRPClient_system_animSync",0];
	life_hit_by_car = false;
};