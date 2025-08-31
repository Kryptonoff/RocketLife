/*

	Filename: 	RRPClient_dlv_price.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
params [
	["_from","",[""]],
	["_to","",[""]],
	["_vehicle",objNull,[objNull]]
];

if (_from isEqualTo "" OR _to isEqualTo "" OR _vehicle isEqualTo objNull) exitWith {0};

private _distance = _vehicle distance (getMarkerPos _to);
private _factor = (("dlv" call RRPClient_economy_getResInfo) select 2) * 0.01;
private _price = round(_factor * _distance);

if ((call life_donator) > 0) then {_price = ["priceUp", _price] call RRPClient_system_VIP};

round _price