/*
	
	Filename: 	RRPClient_system_medicMenuRequest.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 39001)) then {
	if !(createDialog "UnionDialogMedStatus") exitWith {};
};

private _cPlayerList = CONTROL(39001,39002);
ctrlSetText [39010, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

lbClear _cPlayerList;
private "_statustext";
{	
	if ((GVAR_RNAME(_x) != "") && (alive _x) && (LSINCAP(_x)) && (((_x GVAR ["medicStatus",[]]) select 0) >= 0)) then {
		_statustext = switch ((_x GVAR ["medicStatus",[]]) select 0) do 
		{
			case 0: {"Ожидает"};
			case 1: {"Отказано"};
			case 2: {"Вызов принят"};			
			case 3: {"Ожидает. Идет бой"};
			case 4: {"Ожидает. Военное положение"};
			case 5: {"Отказано. Красная зона"};
			case 6: {"Отказано. Черный список"};
			case 7: {"Отказано. В розыске"};
		};	
		_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
		_cPlayerList lbSetTextRight [(lbSize _cPlayerList)-1, format["[ %1 %2]", _statustext,((_x GVAR ["medicStatus",[]]) select 1)]];	
		_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
	};
} forEach playableUnits;