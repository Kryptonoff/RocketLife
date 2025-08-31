/*
	Filename: 	RRPClient_system_dragDeadBody.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	if (EQUAL(RIFLE,"")) then {player addWeapon "EXT_FakePrimaryWeapon"};
	player selectWeapon RIFLE;
	life_DraggedBody = param [0,ObjNull,[ObjNull]];

	if (!(life_DraggedBody isKindOf "Man")) throw "объект взаимодействия не является игроком";
	if (!(isPlayer life_DraggedBody)) throw "Игрок не определен неверно, попробуйте еще раз";
	if (life_DraggedBody isEqualTo player) throw "Вы не можете тащить самого себя";

	if (isNull life_DraggedBody) exitWith {};
	if (!(life_DraggedBody isKindOf "CAManBase") OR (player distance life_DraggedBody > 5) OR life_DraggedBody == player) exitWith {life_DraggedBody = ObjNull};
	_var = life_DraggedBody GVAR "draggedBy";
	if (!isNil "_var") exitWith {life_DraggedBody = ObjNull};
	[life_DraggedBody,"draggedBy",player] call CBA_fnc_setVarNet;

	life_DraggedBody setPosASL (getPosASL player vectorAdd (vectorDir player));
	life_DraggedBody setDir (getDir player + 180);
	[life_DraggedBody,"AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExecCall ["RRPClient_system_animSync",RCLIENT];
	["AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon"] call RRPClient_system_animDo;

	uiSleep 15;

	[life_DraggedBody,"AinjPfalMstpSnonWnonDf_carried_dead"] remoteExecCall ["RRPClient_system_animSync",RCLIENT];
	["AcinPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

	life_DraggedBody attachTo [player, [0.1,-0.1,-1.25], "LeftShoulder"];

	life_actions_drag = player addAction["<img image='\rimas_pack\icons\ui\s_icon_stop.paa' /> " + "Бросить тело",RRPClient_system_dropDeadBody,"",0,false,false];

	[] spawn {
		while{true} do {
			if (!(NOTINVEH(player)) OR !alive life_DraggedBody OR (call RRPClient_system_isInterrupted)) exitWith {call RRPClient_system_dropDeadBody};
			uiSleep 0.3;
		};
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
