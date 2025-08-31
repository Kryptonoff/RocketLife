/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_vehicles","_tot","_control","_vehicleInfo","_index","_tmp","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];
waitUntil {!isNull (findDisplay 2800)};
if(count _vehicles == 0) exitWith {ctrlSetText[2811,"Гараж пуст."]};
_tot = 0;
_control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;
{
	_x params ["_id","_classname","_color","_spname","_tuning_data","_insure","_baseprice","_material","_fuel","_servermap","_parking","_plate","_distance","_damage"];
	_vehicleInfo = [_classname] call RRPClient_util_fetchVehInfo;
	_index = _control lbAdd (_vehicleInfo select 3);
	_tmp = [_classname,_color,_spname,_tuning_data,_insure,_baseprice,_material,_fuel,_servermap,_parking,_plate,_distance,_damage];
	_control lbSetData [_index,str(_tmp)];
	_control lbSetValue [_index,_id];
	_tot = _baseprice + _tot;
} forEach _vehicles;

private _keyCombo = (findDisplay 2800) displayCtrl 2815;

{
	_x params ["_name","_value",["_condition",{true}]];
	if (call _condition) then 
	{
		_index = _keyCombo lbAdd _name;
		_keyCombo lbSetValue [_index,_value];
	};
}forEach [
	["Только себе",0, {true}],
	["Всем в тусовке",1, {(count (units (group player)) > 1)}],
	["Всем в организации",2, {player getVariable ["GroupId",-1] isNotEqualTo -1}],
	["Всем в тусовке и организации",3, {player getVariable ["GroupId",-1] isNotEqualTo -1 and { (count (units (group player)) > 1)}}]
];
_keyCombo lbSetCurSel 0;

switch (true) do {
	case (_tot > 10000000): {["capital_2",1] call RRPClient_ach_gateway};
	case (_tot > 5000000): {["capital_1",1] call RRPClient_ach_gateway};
};

ctrlShow[2810,false];
ctrlShow[2811,false];
