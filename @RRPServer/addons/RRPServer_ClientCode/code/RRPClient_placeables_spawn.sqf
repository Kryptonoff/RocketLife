/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

#include "..\script_macros.hpp"
try {
	disableSerialization;
	if (count life_bar_placey >= life_bar_limit) throw "Вы больше не можете ставить объекты.";
	if (player getVariable ["isDragging",false]) throw "Можно ставить только 1 объект за раз!";

	if (EQUAL((lbCurSel 20001),-1)) throw "Вы ничего не выбрали";
	private _className = CONTROL_DATA(20001);

	closeDialog 0;
	life_barrier_active = true;
	_object = _className createVehicle (position player);
	_object setVariable ["owner", getPlayerUID player, true];
	_object setVariable ["notCheat",true,true];
	life_barrier_activeObj = _object;
	_object enableSimulationGlobal false;
	_object setDir 180;
	life_bar_placey pushBack _object;
	[player,_object] spawn RRPClient_dragging_start;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};