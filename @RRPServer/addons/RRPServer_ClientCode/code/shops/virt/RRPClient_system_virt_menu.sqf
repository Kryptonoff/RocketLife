/*

	Filename: 	RRPClient_system_virt_menu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\..\script_macros.hpp"
try{
	private _shop = param [0,"",[""]];
	if !(isClass(missionConfigFile >> "VirtualShops" >> _shop)) throw "Магазин не определен";

	life_shop_type = _shop;
	life_shop_npc = cursorObject;
	if (isNull life_shop_npc) throw "Торговец не определен, попробуйте еще раз";

	private _conditions = M_CONFIG(getText,"VirtualShops",_shop,"conditions");
	if !([_conditions] call RRPClient_util_conditionsCheck) throw "У вас нет доступа к этому магазину или он закрыт";

	private _legal = M_CONFIG(getNumber,"VirtualShops",_shop,"legal");

	if (EQUAL(_legal,0)) then {
		private _waitForOpen = life_shop_npc GVAR ["waitForOpen",0];
		if (time - _waitForOpen < 1200) throw format["Этот продавец еще не приехал на остров. Ожидается через %1 минут(ы)",round(((_waitForOpen + 1200) - time)/60)];
	};

	createDialog "UnionDialogVirtualItemShop";
	call RRPClient_system_virt_update;
}catch{
	[_exception] call toastError;
};
