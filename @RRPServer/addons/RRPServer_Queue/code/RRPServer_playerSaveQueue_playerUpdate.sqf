/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_time","_unit","_inJail","_name","_gicBackpack","_gicUniform","_gicVest","_data"];
private _time = diag_tickTime;
_unit = param [0,objNull,[objNull]];
_uid = param [1,getPlayerUID _unit,[""]];
if (_unit getVariable ["RRPVariablePartyMeatActive",false]) exitWith {};
if (isNull _unit) exitWith {
	format ["Player undefined ??? %1 #1001",str _unit] call RRPServer_util_debugConsole;
};
private _name = _unit call getNickName;
if (_unit getVariable ["inJail", false]) exitWith {format ["Player In Jail (dnt save) - N:%1 U:%2 #0111",name _unit,getPlayerUID _unit] call RRPServer_util_debugConsole;false};

private _radioParent =
{
	private _item = param [0,"",[""]];
	if (_item isEqualTo "") exitWith {""};

	private _return = _item;

	if (getText (configFile >> "CfgWeapons" >> _item >> "simulation") isEqualTo "ItemRadio") then
	{
		if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then
		{
			private _radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
			if !(_radio isEqualTo "") then {_return = _radio};
		};
	};
	_return
};

private _assigned = [];
{
	_assigned pushBack ([_x] call _radioParent);
} forEach (assignedItems _unit);

_gicBackpack = (getItemCargo backpackContainer _unit) call RRPClient_util_getMap;
_gicUniform = (getItemCargo uniformContainer _unit) call RRPClient_util_getMap;
_gicVest = (getItemCargo vestContainer _unit) call RRPClient_util_getMap;

private _bckCont =	(backpackContainer _unit) call RRPClient_util_getMagazineMap;
private _bckWeapC =	(getWeaponCargo backpackContainer _unit) call RRPClient_util_getMap;
private _loadedMags = _unit call RRPClient_util_getLoadedMagazinesMap;
private _unfCont =	(uniformContainer _unit) call RRPClient_util_getMagazineMap;
private _unfWeap =	(getWeaponCargo uniformContainer _unit) call RRPClient_util_getMap;
private _vestCont =	(vestContainer _unit) call RRPClient_util_getMagazineMap;
private _vestWeap =	(getWeaponCargo vestContainer _unit) call RRPClient_util_getMap;

_data =
[
	_assigned,
	backpack _unit,
	_gicBackpack,
	_bckCont,
	_bckWeapC,
	((currentWeapon _unit) call RRPClient_util_isSaveItem),
	((goggles _unit) call RRPClient_util_isSaveItem),
	((handgunItems _unit) call RRPClient_util_isSaveItem),
	((handgunWeapon _unit) call RRPClient_util_isSaveItem),
	((headgear _unit) call RRPClient_util_isSaveItem),
	((binocular _unit) call RRPClient_util_isSaveItem),
	_loadedMags,
	((primaryWeapon _unit) call RRPClient_util_isSaveItem),
	((primaryWeaponItems _unit) call RRPClient_util_isSaveItem),
	((secondaryWeapon _unit) call RRPClient_util_isSaveItem),
	((secondaryWeaponItems _unit) call RRPClient_util_isSaveItem),
	((uniform _unit) call RRPClient_util_isSaveItem),
	_gicUniform,
	_unfCont,
	_unfWeap,
	((vest _unit) call RRPClient_util_isSaveItem),
	_gicVest,
	_vestCont,
	_vestWeap,
	_unit getVariable ["plrTrunk",[]],
	getPosATL _unit,
	_uid
];

private _message = ["updatePlayer", _data] call RRPServer_DB_createMessage;
_message call RRPServer_DB_fireAndForget;

format ["Player %1(%3) saved - time %2s #0111",name _unit,diag_tickTime - _time,_uid] call RRPServer_util_debugConsole;
true
