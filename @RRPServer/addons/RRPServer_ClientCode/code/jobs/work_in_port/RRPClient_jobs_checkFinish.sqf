#include "..\..\..\script_macros.hpp"

private _FinishPos = _this select 0;
private _type = _this select 1;

if (_FinishPos isEqualto []) exitWith {
	["Финишная позиция не определена"] call hints;
};

private _money = getNumber(missionConfigFile >> "SmartJobs" >> "portwork" >> "price");

private _donat = switch (FETCH_CONST(life_donator)) do {
	case 1: {round(_money * 0.2)};
	case 2: {round(_money * 0.3)};
	case 3: {round(_money * 0.4)};
	case 4: {round(_money * 0.6)};
	case 5: {round(_money * 0.7)};
	default {0};
};
private _money = _money + _donat;

while {box_work_port_active} do 
{
	if ((player distance2D _FinishPos) <= 3) then 
	{
		call RRPClient_system_stopEscortingAction;
		deleteVehicle port_box;
		["SuccessTitleAndText", ["Успех!", format["Вы доставили ящик и заработали $%1",_money]]] call SmartClient_gui_toaster_addTemplateToast;
		[player,"cash","add",STR(_money)] remoteExecCall ["RRPServer_system_moneyChange",2];
		["port",1] call RRPClient_ach_gateway;
		[_type] call BIS_fnc_deleteTask;
		box_work_port_active = false;
		life_action_inUse = false;
	};
	uiSleep 0.6;
};



