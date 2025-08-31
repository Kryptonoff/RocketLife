/*

	Filename: 	RRPClient_system_dropItems.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
private _container = createVehicle ["Box_Wps_F", (getPosATL _unit), [], 0, "NONE"];
uiSleep (random 5);
waitUntil {!isNull _container};

private _containers = nearestObjects[getPosATL _unit, ["WeaponHolderSimulated"], 10];
private "_itemsArray";
{
	_itemsArray = weaponsItems _x;
	{
		if !(EQUAL((_x select 0),"")) then {_container addWeaponCargoGlobal [(_x select 0),1]};
		if !(EQUAL((_x select 1),"")) then {_container addItemCargoGlobal [(_x select 1),1]};
		if !(EQUAL((_x select 2),"")) then {_container addItemCargoGlobal [(_x select 2),1]};
		if !(EQUAL((_x select 3),"")) then {_container addItemCargoGlobal [(_x select 3),1]};
		if !(EQUAL((_x select 4),[])) then {_container addMagazineCargoGlobal [((_x select 4) select 0),1]};
		if !(EQUAL((_x select 5),"")) then {_container addItemCargoGlobal [(_x select 5),1]};
	} forEach _itemsArray;
	
	deleteVehicle _x;
} foreach _containers;

private _yItems = [];
private ["_value","_item","_itemName"];
{	
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	_itemName = ITEM_VARNAME(_item);
	if (_value > 0) then {
		_yItems pushBack [_item,_value];
		SVAR_MNS [_itemName,0];
	};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

if (CASH > 0) then {
	_yItems pushBack ["money_virt",CASH];
	[[player,"cash","drop",CASH],"system_moneyChange"] call RRPClient_system_hcExec;

	_log = format ["dropItems: cash (drop) %3 to NAME:%1 (%2)",name player,steamid,CASH];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
};

if (DCASH > 0) then {
	_yItems pushBack ["dmoney_virt",DCASH];
	[[player,"dcash","drop",DCASH],"system_moneyChange"] call RRPClient_system_hcExec;

	_log = format ["dropItems: dcash (drop) %3 to NAME:%1 (%2)",name player,steamid,CASH];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
};

private _uniformContainer = uniformContainer _unit;
private _vestContainer = vestContainer _unit;
private _backpackContainer = backpackContainer _unit;

if (!(EQUAL(uniform _unit,""))) then {
	if !((uniformItems _unit) isEqualTo []) then {
		{_container addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach (magazinesAmmoCargo _uniformContainer);
		{_container addItemCargoGlobal [_x, 1]} foreach (itemCargo _uniformContainer);
		{_container addBackpackCargoGlobal [_x, 1]} foreach (backpackCargo _uniformContainer);
		{_container addWeaponCargoGlobal [_x, 1]} foreach (weaponCargo _uniformContainer);
	};

	[uniform _unit,_container] call RRPClient_system_addItemToBox;	
};

if (!(EQUAL(vest _unit,""))) then {
	if !((vestItems _unit) isEqualTo []) then {
		{_container addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach (magazinesAmmoCargo _vestContainer);
		{_container addItemCargoGlobal [_x, 1]} foreach (itemCargo _vestContainer);
		{_container addBackpackCargoGlobal [_x, 1]} foreach (backpackCargo _vestContainer);
		{_container addWeaponCargoGlobal [_x, 1]} foreach (weaponCargo _vestContainer);
	};

	[vest _unit,_container] call RRPClient_system_addItemToBox;	
};

if (!(EQUAL(backpack _unit,""))) then {
	if !((backpackItems _unit) isEqualTo []) then {
		{_container addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach (magazinesAmmoCargo _backpackContainer);
		{_container addItemCargoGlobal [_x, 1]} foreach (itemCargo _backpackContainer);
		{_container addBackpackCargoGlobal [_x, 1]} foreach (backpackCargo _backpackContainer);
		{_container addWeaponCargoGlobal [_x, 1]} foreach (weaponCargo _backpackContainer);
	};

	[backpack _unit,_container] call RRPClient_system_addItemToBox;	
};

[goggles _unit,_container] call RRPClient_system_addItemToBox;	
[headgear _unit,_container] call RRPClient_system_addItemToBox;	

{
	if !(EQUAL(_x,"")) then {
		[_x,_container] call RRPClient_system_addItemToBox;	
	};
} forEach (assigneditems _unit);

if (!(EQUAL(primaryWeapon _unit,""))) then {
	if (count (primaryWeaponMagazine _unit) > 0) then {
		[((primaryWeaponMagazine _unit) select 0),_container] call RRPClient_system_addItemToBox;
	};
	if (count (primaryWeaponItems _unit) > 0) then {
    	{
    	    [_x,_container] call RRPClient_system_addItemToBox;
    	} forEach (primaryWeaponItems _unit);
	};
	[primaryWeapon _unit,_container] call RRPClient_system_addItemToBox;
};

if (!(EQUAL(handgunWeapon _unit,""))) then {
	if(count (handgunMagazine _unit) > 0 && LSALIVE(_unit)) then {		
		[((handgunMagazine _unit) select 0),_container] call RRPClient_system_addItemToBox;
	};

	if (count (handgunItems _unit) > 0) then {
	    {
	        [_x,_container] call RRPClient_system_addItemToBox;
	    } forEach (handgunItems _unit);	    
	};
	[handgunWeapon _unit,_container] call RRPClient_system_addItemToBox;
};

if (!(EQUAL(secondaryWeapon _unit,""))) then {	
	if (count (secondaryWeaponMagazine _unit) > 0 && LSALIVE(_unit)) then {		
		[((secondaryWeaponMagazine _unit) select 0),_container] call RRPClient_system_addItemToBox;
	};
	[secondaryWeapon _unit,_container] call RRPClient_system_addItemToBox;
};

_container SVAR ["Trunk",[_yItems, 0],true];

call RRPClient_system_saveGear;