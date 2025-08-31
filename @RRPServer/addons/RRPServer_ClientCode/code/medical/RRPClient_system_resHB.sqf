/*
	Filename: 	RRPClient_system_resHB.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"

private _bed = param [0,objNull,[objNull]];
private _unit = (crew _bed) select 0;

try{
	if (isNil "_unit") exitWith {};
	if (isNull _unit) exitWith {};
	if (life_inwarzone) throw "Вы в зоне боевых действий, реанимация недоступна";

	if !(LSINCAP(_unit)) exitWith {};
	if (!isNil {_unit GVAR "draggedBy"}) exitWith {};
	if (_unit GVAR ["reviving",ObjNull] == player) throw "Кто-то уже реанимирует этого человека";
	_unit SVAR ["reviving",player,TRUE];

	private _cP = 0;
	private _error = false;
	private _title = format["Вы реанимируете %1",GVAR_RNAME(_unit)];

	player say3D "defib";
	titleText[_title,"PLAIN"];

	[player] remoteExec ["RRPClient_system_resHBClient",_unit];

	while {true} do {
		uiSleep 0.15;
		_cP = _cP + 0.01;
		[_cP,"medic"] call RRPClient_system_progressBar;
		if (_cP >= 1) then {break};
		if (player distance _unit > 4 OR {(LSDEAD(_unit))} OR {(call RRPClient_system_isInterrupted)}) throw "Реанимация прервана!";	
		if (_unit GVAR ["reviving",ObjNull] != player) throw "Реанимация прервана!";
	};

	["life_progress"] call RRPClient_gui_DestroyRscLayer;

}catch{
	["life_progress"] call RRPClient_gui_DestroyRscLayer;
	["ErrorTitleAndText",["Реанимация", _exception]] call toast;
};
