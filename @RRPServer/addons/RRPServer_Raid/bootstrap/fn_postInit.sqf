/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (true) exitWith {};

private _toolBoxesAmount = 16;
private _multiBoxesAmount = 12;
private _cashBoxesAmount = 3;
private _chestsAmount = 4;
private _smboxes = 12;

lab_building setVariable ["bis_disabled_door_1", 1, true];
lab_building setVariable ["bis_disabled_door_3", 1, true];
lab_building setVariable ["bis_disabled_door_5", 1, true];
lab_building setVariable ["bis_disabled_door_7", 1, true];
lab_building setVariable ["bis_disabled_door_9", 1, true];
lab_building setVariable ["bis_disabled_door_11", 1, true];
lab_building setVariable ["pincode", str (round (random [1000, 5555, 9999])), true];

[lab_notebook, ["Взломать ноутбук", {[_this # 3] spawn RRPClient_raid_hackNotebook}, nil, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId lab_notebook];	
[lab_ladder, ["Вылезти на крышу", {[_this # 0] spawn RRPClient_raid_goRoof}, 4, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId lab_ladder];	

for "_i" from 1 to _multiBoxesAmount do {
	_object = missionNamespace getVariable [format["lab_multibox_%1", _i], objNull];

	if (_object isNotEqualTo objNull) then {
		[_object, true] remoteExecCall ["lockInventory", -2, (netId _object) + "_lock"];
		[_object, ["Взломать ящик", {[_this select 0, _this select 3] spawn RRPClient_raid_unlockBox}, selectRandom ["calibration", "cardSwipe", "pattern"], 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _object];	
	};
};

for "_i" from 1 to _toolBoxesAmount do {
	_object = missionNamespace getVariable [format["lab_toolbox_%1", _i], objNull];

	if (_object isNotEqualTo objNull) then {
		[_object, true] remoteExecCall ["lockInventory", -2, (netId _object) + "_lock"];
		[_object, ["Взломать ящик", {[_this select 0, "lockpick"] spawn RRPClient_raid_unlockBox}, nil, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _object];	
	};
};

for "_i" from 1 to _chestsAmount do {
	_object = missionNamespace getVariable [format["lab_chest_%1", _i], objNull];

	if (_object isNotEqualTo objNull) then {
		[_object, true] remoteExecCall ["lockInventory", -2, (netId _object) + "_lock"];
		[_object, ["Взломать ящик", {[_this select 0, "lockpick"] spawn RRPClient_raid_unlockBox}, nil, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _object];	
	};
};

for "_i" from 1 to _smboxes do {
	_object = missionNamespace getVariable [format["lab_smbox_%1", _i], objNull];

	if (_object isNotEqualTo objNull) then {
		[_object, true] remoteExecCall ["lockInventory", -2, (netId _object) + "_lock"];
		[_object, ["Взломать ящик", {[_this select 0, _this select 3] spawn RRPClient_raid_unlockBox}, selectRandom ["calibration", "cardSwipe", "pattern"], 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _object];	
	};
};

for "_i" from 1 to _cashBoxesAmount do {
	_object = missionNamespace getVariable [format["lab_cash_%1", _i], objNull];

	if (_object isNotEqualTo objNull) then {
		[_object, ["Забрать деньги", {[_this select 0] spawn RRPClient_raid_getCashBox}, nil, 3, true, true, "", "true", 5]] remoteExecCall ["addAction", -2, netId _object];	
	};
};

true