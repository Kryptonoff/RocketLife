/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

params [
	["_pointX",0,[0]],
	["_pointY",0,[0]],
	["_radius",0,[0]],
	["_pointName","",[""]],
	["_unit",objNull,[objNull]]
];

if (count RRPServerWarZones > getNumber(getMissionConfig "CfgWarZone" >> "maxZones")) exitWith {
	["ErrorTitleAndText",["Зона боевых действий","Нельзя поставить больше 3-х военных положений!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner]
};
if ([_pointX,_pointY] call RRPClient_util_isInStratis) exitWith {
	["ErrorTitleAndText",["Зона боевых действий","Не может быть установлена в данном месте!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner]
};

//Stop bad data being passed.
if (_pointX isEqualTo 0 || {_pointY isEqualTo 0} || {_radius isEqualTo 0} || {_pointName isEqualTo ""} || {_unit isEqualTo objNull}) exitWith {};

private _unitName = _unit call getNickName;

private _pointID = round(random(1000));
RRPServerWarZones pushBack [_pointID,_radius,_pointName,_unitName];
publicVariable "RRPServerWarZones";

private _warn = createMarker [format ["war_zone_%1",_pointID],[_pointX,_pointY]];
_warn setMarkerShape "ELLIPSE";
_warn setMarkerSize [_radius,_radius];
_warn setMarkerColor "ColorEAST";
_warn setMarkerBrush "Solid";
_warn setMarkerAlpha 0.5;

private _marker = createMarker [format ["war_marker_%1",_pointID],[_pointX,_pointY]];
_marker setMarkerColor "ColorWhite";
_marker setMarkerTypeLocal "KIA";
_marker setMarkerText "Не входить! Ведётся военное положение!";

["Военное положение",format["%1 объявил военное положение %2",_unitName,_pointName],10] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];

private _uid = getPlayerUID _unit;
[
	"Warzone","","","",false,
	[
		[
			"Steam профиль",
			[
				"**"+_unitName+" Установил ВП на позиции**: "+ str [_pointX,_pointY],
				"**Рядом с локацией:** " + str ([[_pointX,_pointY,0]] call mav_taxi_fnc_nearestLocation),
				"**Название:** "+ _pointName
			] joinString "\n",
			"https://steamcommunity.com/profiles/" + _uid,
			"009fdd",false,"","",[],[]
		]
	]
] call DiscordEmbedBuilder_fnc_buildSqf;