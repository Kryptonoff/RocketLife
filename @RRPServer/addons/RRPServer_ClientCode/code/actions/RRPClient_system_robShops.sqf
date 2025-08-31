/*
	Filename: 	RRPClient_system_robShops.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _shop = cursorObject;
	if (isnull _shop) throw "Не определил торговца, попробуйте еще раз";
	if !(call RRPClient_system_checkMask) exitWith {};
	if (life_action_inUse) exitWith {};
	if (call RRPClient_system_isInterrupted) exitWith {};
	if !(NOTINVEH(player)) exitWith {};
	if !(player call getSide in ["civ","reb"]) exitWith {};
	if (["cop"] call RRPClient_system_playerCount < LIFE_SETTINGS(getNumber,"life_cop_min_illegal")) throw format ["Должно быть минимум %1 полицейских на острове, чтобы продолжить.",LIFE_SETTINGS(getNumber,"life_cop_min_illegal")];
	if (player distance _shop > 5) throw format ["Вы должны быть не далее чем в %1 метрах от цели!",5];
	if (_shop GVAR ["robinprogress",false]) throw "Магазин уже в процессе ограбления";
	if (_shop GVAR ["shopRobbed",false]) throw "Магазин уже в процессе ограбления";
	if (EQUAL(CURWEAPON,"") OR EQUAL(CURWEAPON,"Binocular") OR (["Extremo_Sign",CURWEAPON] call RRPClient_util_xString) OR (CURWEAPON in ["Extremo_Tool_PickAxe","Extremo_Tool_Hoe","Extremo_Tool_Shovel","Extremo_Tool_Axe"])) throw "И чего я должен испугаться?! Вали отсюда!";

	private _kassa = 2000 + round(random 2000);

	[_shop,"robinprogress",true] call CBA_fnc_setVarNet;
	call RRPClient_actions_inUse;
	private _chance = random(100);

	private _shopcoordX = format ["%1",round (((getpos _shop) select 0) / 100)];
	private _shopcoordY = format ["%1",round (((getpos _shop) select 1) / 100)];
	private _shopcoord = format["%1",_shopcoordX + "-" + _shopcoordY];

	if (_chance >= 50) then {
		["Сработала сигнализация и полиция оповещена об ограблении!"] call hints;
		[1,format["!!! Магазин (координаты: %1) обносится криминальными элементами !!!", _shopcoord]] remoteExecCall ["RRPClient_system_broadcast",west];
	};

	private _mrkstring = format ["wrgMarker%1", random(1000)];
	private _marker = createMarker [_mrkstring, position player];
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "!!! Идет ограбление !!!";
	_marker setMarkerType "mil_warning";

	disableSerialization;
	titleText["Идет ограбление, стойте в радиусе 5 метров","PLAIN"];
	private _cP = 0;
	while{true} do {
		uiSleep 1;
		_cP = _cP + 0.01;
		[_cP,"criminal"] call RRPClient_system_progressBar;
		if (_cP >= 1 OR (player distance _shop > 5.1) OR (call RRPClient_system_isInterrupted)) exitWith {};
	};

	["life_progress"] call RRPClient_gui_DestroyRscLayer;
	life_action_inUse = false;

	deleteMarker _marker;

	[_shop,"robinprogress"] call RRPClient_system_clearGlobalVar;

	if (call RRPClient_system_isInterrupted) exitWith {titleText["Действие отменено","PLAIN"]};

	if (player distance _shop > 5.1) exitWith {
		throw "Вы отошли слишком далеко и попали в розыск!";
		//[steamid,"A211"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	};

	titleText[format["Вы украли $%1! Самое время убраться отсюда, ведь полиция уже в пути!",[_kassa] call RRPClient_util_numberText],"PLAIN"];

	[[player,"cash","add",_kassa,[format["RobShop: Plr %1 (%2), cash add (%3) POS: %4",name player,steamid,_kassa,mapGridPosition player],"OtherMoneyLog"]],"system_moneyChange"] call RRPClient_system_hcExec;
	[steamid,"A211"] remoteExecCall ["RRPServer_ws_wantedAdd",2];
	[_shop,"shopRobbed",true] call CBA_fnc_setVarNet;
	['grabezh',1] call RRPClient_ach_gateway;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};