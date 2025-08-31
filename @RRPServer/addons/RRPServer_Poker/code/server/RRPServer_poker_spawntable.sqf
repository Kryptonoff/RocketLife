/*

	Filename: 	RRPServer_poker_spawntable.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params [
	["_table_id","",[""]],
	["_table_bet",100,[100]],
	["_position",[],[[]]],
	["_tableClass","",[""]],
	["_tableDir",0,[0]],
	["_chairClass","",[""]],
	["_chairX",0,[0]],
	["_chairY",0,[0]],
	["_sideChairY",0,[0]]
];

private _table_obj = createVehicle [_tableClass,_position,[],0,"CAN_COLLIDE"];
_table_obj enableSimulationGlobal false;
_table_obj setDir _tableDir;
_position params ["_pos_x","_pos_y","_pos_z"];

private _chair_1 = createVehicle [_chairClass,[_pos_x,_pos_y + _sideChairY,_pos_z],[],0,"CAN_COLLIDE"];
_chair_1 enableSimulationGlobal false;
[_chair_1, ["Сесть за покерный стол", RRPClient_poker_joinTable, [_table_obj, _table_id, 1], 1.5, true, true, "", "isNull objectParent _this && animationState _this != 'crew' && isNull (_target getVariable ['occupied',objNull])", 5]] remoteExecCall ["addAction",-2,_chair_1];

private _chair_2 = createVehicle [_chairClass,[_pos_x + _chairX,_pos_y + _chairY,_pos_z],[],0,"CAN_COLLIDE"];
_chair_2 enableSimulationGlobal false;
_chair_2 setDir 90;
[_chair_2, ["Сесть за покерный стол", RRPClient_poker_joinTable, [_table_obj, _table_id, 2], 1.5, true, true, "", "isNull objectParent _this && animationState _this != 'crew' && isNull (_target getVariable ['occupied',objNull])", 5]] remoteExecCall ["addAction",-2,_chair_2];

private _chair_3 = createVehicle [_chairClass,[_pos_x + _chairX,_pos_y - _chairY,_pos_z],[],0,"CAN_COLLIDE"];
_chair_3 enableSimulationGlobal false;
_chair_3 setDir 90;
[_chair_3, ["Сесть за покерный стол", RRPClient_poker_joinTable, [_table_obj, _table_id, 3], 1.5, true, true, "", "isNull objectParent _this && animationState _this != 'crew' && isNull (_target getVariable ['occupied',objNull])", 5]] remoteExecCall ["addAction",-2,_chair_3];

private _chair_4 = createVehicle [_chairClass,[_pos_x,_pos_y - _sideChairY,_pos_z],[],0,"CAN_COLLIDE"];
_chair_4 enableSimulationGlobal false;
_chair_4 setDir 180;
[_chair_4, ["Сесть за покерный стол", RRPClient_poker_joinTable, [_table_obj, _table_id, 4], 1.5, true, true, "", "isNull objectParent _this && animationState _this != 'crew' && isNull (_target getVariable ['occupied',objNull])", 5]] remoteExecCall ["addAction",-2,_chair_4];

private _chair_5 = createVehicle [_chairClass,[_pos_x - _chairX,_pos_y - _chairY,_pos_z],[],0,"CAN_COLLIDE"];
_chair_5 enableSimulationGlobal false;
_chair_5 setDir 270;
[_chair_5, ["Сесть за покерный стол", RRPClient_poker_joinTable, [_table_obj, _table_id, 5], 1.5, true, true, "", "isNull objectParent _this && animationState _this != 'crew' && isNull (_target getVariable ['occupied',objNull])", 5]] remoteExecCall ["addAction",-2,_chair_5];

private _chair_6 = createVehicle [_chairClass,[_pos_x - _chairX,_pos_y + _chairY,_pos_z],[],0,"CAN_COLLIDE"];
_chair_6 enableSimulationGlobal false;
_chair_6 setDir 270;
[_chair_6, ["Сесть за покерный стол", RRPClient_poker_joinTable, [_table_obj, _table_id, 6], 1.5, true, true, "", "isNull objectParent _this && animationState _this != 'crew' && isNull (_target getVariable ['occupied',objNull])", 5]] remoteExecCall ["addAction",-2,_chair_6];

_table_obj setVariable ["poker_bet",_table_bet,true];

[_table_id, _table_obj, _table_bet] spawn RRPServer_poker_main;