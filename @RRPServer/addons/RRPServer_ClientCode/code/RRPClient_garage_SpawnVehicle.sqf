/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPClient_garage_SpawnVehicle};
params [
	["_vid",-1,[0]],
	["_data",[],[[]]],
	["_dir",0,[0]],
	["_spname",[],[[],""]],
	["_keyMode",0]
];
try
{
	if (_data isEqualTo []) throw "Ошибка #501";
	if (isWeaponDeployed player) then
	{
		[
					"SpyGlass","","","",false,
					[
						[
							"Steam профиль",
							[
								format ["**Имя:** %1",profileName],
								"**Попытался на сошках достать машину**",
								format ["**TeamSpeak ID:** %1",(player getVariable ["tsNickName",name player])]
							] joinString "\n",
							"https://steamcommunity.com/profiles/" + getPlayerUID player,
							"FF0000",false,"","",[],[]
						]
					]
				] remoteExecCall ["DiscordEmbedBuilder_fnc_buildSqf",2];
		throw "Информация о попытке использования бага передана администрации!";
	};
	diag_log ("_data" + (str _data));
	private _classname = _data param [0,"",[""]];
	private _pid = _data param [2,"",[""]];
	private _insure = _data param [5,0,[-1]];
	private _plate = _data param [6,"OYWEY",[""]];
	private _color = _data param [7,"default",[""]];
	private _material = _data param [8,"default",[""]];
	private _inventory = _data param [9,[[],0],[[]]],
	private _gear = _data param [10,[],[[]]],
	private _fuel = _data param [11,1,[-1]],
	private _damage = _data param [12,0,[-1]];
	private _hitpoints = _data param [13,[],[[]]];
	private _tuning_data = _data param [14,[],[[]]];
	private _baseprice = parseNumber (_data param [16,"",[""]]);
	private _distance = _data param [18,0,[-1]];
	diag_log str _data;

	if !(_pid isEqualTo (getPlayerUID player)) throw "Что за нипонятки то такие???";
	if (_spname isEqualTo "") throw "Не определена точка выдачи техники";
	if (life_garage_sp isEqualType "") then
	{
		if (isClass (missionConfigFile >> "LifeCfgGarages" >> toLower worldName >> life_garage_sp)) then
		{
			_check = getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> life_garage_sp >> "position");
			if !(_check isEqualTo []) then
			{
				_spname = getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> life_garage_sp >> "position") select 0;
				_dir = getArray(missionConfigFile >> "LifeCfgGarages" >> (toLower worldName) >> life_garage_sp >> "position") select 1;
			};
		};
	};
	private _vehicle = [_className,_spname,_dir,true] call RRPClient_system_createSafetyVehicle;
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	waitUntil {(local _vehicle)};

	[_vehicle,_fuel] remoteExecCall ["RRPClient_system_setFuel",_vehicle];
	[_vehicle,_plate] remoteExecCall ["RRPClient_system_setPlateNumber",_vehicle];
	if !((_inventory select 0) isEqualTo []) then {[_vehicle,"Trunk",_inventory] call CBA_fnc_setVarNet};
	_vehicle setVariable ["RRPDatabaseID",_vid,true];
	[_vehicle,"vehicle_info_vid",round(random(999999))] call CBA_fnc_setVarNet;
	[_vehicle,"dbInfo",[getPlayerUID player,_plate]] call CBA_fnc_setVarNet;
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,player call getFullName]]] call CBA_fnc_setVarNet;
	[_vehicle,"insPrice",_baseprice] call CBA_fnc_setVarNet;
	[_vehicle,"allDistance",_distance] call CBA_fnc_setVarNet;

	if (_insure isEqualTo 1) then {_vehicle setVariable ["isInsured",true,true];};
	player reveal _vehicle;
	life_vehicles pushBack _vehicle;
	switch _keyMode do
	{
		case 0: {
			[[getPlayerUID player,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;
		};
		case 1: {
			{
				[[getPlayerUID _x,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;
				_vehicle remoteExecCall ["RRPClient_util_push_lifeVehicles",_x];
			}forEach units (group player);
		};
		case 2: {
			{
				[[getPlayerUID _x,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;
				_vehicle remoteExecCall ["RRPClient_util_push_lifeVehicles",_x];
			}forEach (RRPClientGroupInfo call RRPClient_groups_getMembers);
		};
		case 3: {

			{
				[[getPlayerUID _x,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;
				_vehicle remoteExecCall ["RRPClient_util_push_lifeVehicles",_x];
			}forEach units (group player);

			{
				[[getPlayerUID _x,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;
				_vehicle remoteExecCall ["RRPClient_util_push_lifeVehicles",_x];
			}forEach (RRPClientGroupInfo call RRPClient_groups_getMembers);
		};
	};
	if !(_color isEqualTo "") then {[_vehicle,_color] call RRPClient_system_colorVehicle};
	if !(_material isEqualTo "") then {[_vehicle,_material] call RRPClient_system_materialVehicle};

	_vehicle lock 2;
	_vehicle disableTIEquipment true;
	_vehicle enableRopeAttach (if (getNumber(missionConfigFile >> "LifeCfgVehicles" >> _classname >> "enableRopeAttach") isEqualTo 1) then {true} else {false});

	clearBackpackCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;

	[_vehicle] spawn RRPClient_system_vehicleAnimate;
	[_vehicle,_tuning_data] call RRPClient_adac_setup;
	[_vehicle] call RRPClient_system_vehSetupRadio;
	[_vehicle] call RRPClient_system_trunkCheck;
	[_vehicle] call RRPClient_system_clearVehicleAmmo;
	[_vehicle] call RRPClient_system_clearVehicleTrunk;
	[_vehicle] call RRPClient_system_clearVehicleSensors;
	private ["_weaponCount","_magazineCount","_itemCount","_backpackCount","_itemData"];
	if !(_gear isEqualTo []) then
	{
		{
			if !(_x isEqualTo []) exitWith {};
			_x params ["_weapons","_magazines","_items","_backpacks"];
			{
				_itemData = [_x] call RRPClient_util_itemDetails;
				if !(_itemData isEqualTo []) then
				{
					_weaponCount = (_weapons select 1) select _forEachIndex;
					_vehicle addWeaponCargoGlobal [_x,_weaponCount];
				};
			} foreach (_weapons select 0);

			{
				_itemData = [_x] call RRPClient_util_itemDetails;
				if !(_itemData isEqualTo []) then
				{
					_magazineCount = (_magazines select 1) select _forEachIndex;
					_vehicle addMagazineCargoGlobal [_x,_magazineCount];
				};
			} foreach (_magazines select 0);

			{
				_itemData = [_x] call RRPClient_util_itemDetails;
				if !(_itemData isEqualTo []) then
				{
					_itemCount = (_items select 1) select _forEachIndex;
					_vehicle addItemCargoGlobal [_x,_itemCount];
				};
			} foreach (_items select 0);

			{
				_itemData = [_x] call RRPClient_util_itemDetails;
				if !(_itemData isEqualTo []) then
				{
					_backpackCount = (_backpacks select 1) select _forEachIndex;
					_vehicle addBackpackCargoGlobal [_x,_backpackCount];
				};
			} foreach (_backpacks select 0);
		} foreach _gear;
	};

	[(netID _vehicle)] remoteExecCall ["RRPServer_event_vehicleMsnHandlers",2];
	waitUntil {!(local _vehicle)};

	if (_className isKindOf "Ship") then {
		_vehicle setPosASL _spname;
	} else {
		_vehicle setPosATL _spname;
	};
	player moveInDriver _vehicle;

	["SuccessTitleAndText",["Гараж","Ваша техника готова!"]] call SmartClient_gui_toaster_addTemplateToast;
}catch{

	["ErrorTitleAndText",["Гараж",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
