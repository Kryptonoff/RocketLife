/*

	Filename: 	RRPClient_inventory_itemAction.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_item", "", [""]],
	["_target", objNull, [objNull]]
];

if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
private _disablePlrActArray = ["unconsciousoutprone", "flyfrommutant_backward", "flyfrommutant_forward", "krovosos_catch_end_suck_victim", "krovosos_catch_end_victim", "krovosos_catch_loop_victim", "krovosos_catch_start_victim", "plagued_armed_melee_noweapon_catch_victim", "plagued_armed_melee_noweapon_catch_victim_behind", "controller_human_unnarmed_anim_in", "controller_human_unnarmed_anim_loop", "controller_human_unnarmed_anim_out"];
if ((animationState player) in _disablePlrActArray OR !(isNil {player getVariable "IsControlledBy"})) exitWith {};

[_item, _target] call RRPClient_inventory_itemActionDo;