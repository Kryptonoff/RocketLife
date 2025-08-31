/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (isRemoteExecuted and {!(remoteExecutedOwner isEqualTo 2)}) exitWith {
	[] remoteExecCall ["report",remoteExecutedOwner];
};

private _time = diag_tickTime;
private _playerObject = player;
"Идет загрузка инвентаря...!" call chat;

_this params
[
	["_id",-1],
	"_assigned_items",
	"_backpack",
	"_backpack_items",
	"_backpack_magazines",
	"_backpack_weapons",
	"_current_weapon",
	"_goggles",
	"_handgun_items",
	"_handgun_weapon",
	"_headgear",
	"_binocular",
	"_loaded_magazines",
	"_primary_weapon",
	"_primary_weapon_items",
	"_secondary_weapon",
	"_secondary_weapon_items",
	"_uniform",
	"_uniform_items",
	"_uniform_magazines",
	"_uniform_weapons",
	"_vest",
	"_vest_items",
	"_vest_magazines",
	"_vest_weapons",
	"_trunk",
	["_position",[],[[]]],
	["_hunger",100],
	["_thirst",100],
	["_drugLight",false],
	["_drugHard",0],
	["_sick",false],
	["_diarhea",false]
];
if (_id isEqualTo -1) exitWith {};
[] call RRPClient_util_stripDownPlayer;
life_logout_position = _position;
RRPClientHunger = _hunger;
RRPClientThirst = _thirst;
life_drug_light = _drugLight; // deprecated
RRPClientNarcomania = _drugHard;
life_sickness = _sick;
life_diarrhea = _diarhea;

_playerObject setVariable ["plrTrunk",_trunk,true];
if !(_headgear isEqualTo "") then {_playerObject addHeadgear _headgear;};
if !(_goggles isEqualTo "") then {_playerObject addGoggles _goggles;};
if !(_binocular isEqualTo "") then {_playerObject addWeapon _binocular;};
if !(_primary_weapon isEqualTo "") then
{
	_playerObject addWeapon _primary_weapon;
	{
		if !(_x isEqualTo "") then
		{
			_playerObject addPrimaryWeaponItem _x;
		};
	}forEach _primary_weapon_items;
};
if !(_handgun_weapon isEqualTo "") then
{
	_playerObject addWeapon _handgun_weapon;
	{
		if !(_x isEqualTo "") then
		{
			_playerObject addHandgunItem _x;
		};
	}forEach _handgun_items;
};
if (_secondary_weapon != "") then
{
	_playerObject addWeapon _secondary_weapon;
	{
		if (_x != "") then
		{
			_playerObject addSecondaryWeaponItem _x;
		};
	}
	forEach _secondary_weapon_items;
};
if !(_current_weapon isEqualTo "") then
{
	_playerObject selectWeapon _current_weapon;
};
{
	_playerObject addWeaponItem [_x select 0,[_x select 1,_x select 2,_x select 3]];
}forEach _loaded_magazines;

if !(_uniform isEqualTo "") then {_playerObject forceAddUniform _uniform;};
if !(_vest isEqualTo "") then {_playerObject addVest _vest;};
if !(_backpack isEqualTo "") then {_playerObject addBackpack _backpack;};

if (_backpack isEqualto "" AND ([_uniform_weapons, _uniform_magazines, _uniform_items, _vest_weapons, _vest_magazines, _vest_items] isNotEqualTo [[], [], [], [], [], []])) then 
{
	_playerObject addBackpack "B_mas_m_Bergen_acr_c";
};

_uniformContainer = uniformContainer _playerObject;
if !(isNil "_uniformContainer") then
{
	{
		_uniformContainer addWeaponCargoGlobal _x;
	}
	forEach _uniform_weapons;
	{
		_uniformContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
	}
	forEach _uniform_magazines;
	{
		_uniformContainer addItemCargoGlobal _x;
	}
	forEach _uniform_items;
};
_vestContainer = vestContainer _playerObject;
if !(isNil "_vestContainer") then
{
	{
		_vestContainer addWeaponCargoGlobal _x;
	}
	forEach _vest_weapons;
	{
		_vestContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
	}
	forEach _vest_magazines;
	{
		_vestContainer addItemCargoGlobal _x;
	}
	forEach _vest_items;
};
_backpackContainer = backpackContainer _playerObject;
if !(isNil "_backpackContainer") then
{
	{
		_backpackContainer addWeaponCargoGlobal _x;
	}
	forEach _backpack_weapons;
	{
		_backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
	}
	forEach _backpack_magazines;
	{
		_backpackContainer addItemCargoGlobal _x;
	}
	forEach _backpack_items;
};
if !(_assigned_items isEqualTo []) then
{
	{
		_playerObject linkItem ([_x] call RRPClient_system_tfRadioParent);
	}
	forEach _assigned_items;
};
_playerObject addEventHandler ["WeaponAssembled", {(_this select 1) disableTIEquipment true;}];
format ["loadPlayerLoot - %1s",diag_tickTime - _time] call RRPClient_system_log;

life_maxWeight = 100;
{
	[true,_x select 0,_x select 1] call RRPClient_system_handleInv;
} forEach _trunk;
life_maxWeight = 24;

private _keys = ["extItem_prisonKey"] call RRPClient_util_itemCount;
if !(_keys isEqualTo 0) then
{
	for "_i" from 1 to _keys do
	{
		["extItem_prisonKey"] call RRPClient_system_removeItem;
	};
};
"Инвентарь загружен" call chat;

currentbackpack = _backpack;
true
