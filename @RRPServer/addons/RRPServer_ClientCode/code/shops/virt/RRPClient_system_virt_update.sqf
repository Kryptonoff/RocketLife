/*
	Filename: 	RRPClient_system_virt_update.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\..\script_macros.hpp"
disableSerialization;

private _gear_list = CONTROL(2400,2402);
lbClear _gear_list;

ctrlSetText [2401,format["%1", (M_CONFIG(getText,"VirtualShops",life_shop_type,"displayName"))]];

{
	if (ITEM_VALUE(_x) > 0) then {
		_gear_list lbAdd format["%1x %2",ITEM_VALUE(_x),ITEM_NAME(_x)];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,ITEM_ICON(_x)];
	};
} foreach (M_CONFIG(getArray,"VirtualShops",life_shop_type,"items"));

if (EQUAL((lbSize _gear_list),0)) then {
	_gear_list lbAdd "Нет предметов для продажи";
};
