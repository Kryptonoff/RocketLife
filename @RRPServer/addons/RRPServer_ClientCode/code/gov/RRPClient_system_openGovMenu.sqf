/*
	Filename: 	RRPClient_system_openGovMenu.sqf
	Project: 	Rimas Altis Life RPG	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
if(isNull (findDisplay 3200)) then {
	if !(createDialog "UnionDialogGov") exitWith {};
};

ctrlSetText [3204, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

private _balance = CONTROL(3200,3202);
private _price_list = CONTROL(3200,3207);
private _bankButton = CONTROL(3200,3203);

if (!life_gov) then {_bankButton ctrlShow false};
private _legal = if (server_mar_legal) then {"<t color='#72ff00'>Легальна</t>"} else {"<t color='#ff3600'>Нелегальна</t>"};
private _slavery = if (server_slavery) then {"<t color='#72ff00'>Легальна</t>"} else {"<t color='#ff3600'>Нелегальна</t>"};

_balance ctrlSetStructuredText parseText format [
"<t size='1.5'>Казна: <t color='#fff000'>$%1</t></t><br/><br/>Губернатор: %2<br/>Налог: %3%4<br/>Статус марихуаны: %5<br/>Работорговля: %6<br/>Порог бедности: $%7<br/>Кредитная ставка: %8%9<br/><br/>Копов для нелегала: %10<br/>Медиков минимум: %11",
	[server_bank] call RRPClient_util_numberText,
	server_govinfo select 1,
	server_tax,
	"%",
	_legal,
	_slavery,
	[server_poor] call RRPClient_util_numberText,
	server_creditTax,
	"%",
	call RRPClient_system_copsForIllegal,
	LIFE_SETTINGS(getNumber,"life_med_min")
];


lbClear _price_list;
private _legal_array = [];
private _illegal_array = [];


{
	_price_list lbAdd format["%1 (Вес: %2)",_x select 0,_x select 2];
	_price_list lbSetTextRight [(lbSize _price_list)-1, format["  $%1", [_x select 1] call RRPClient_util_numberText]];
	_price_list lbSetColor [(lbSize _price_list)-1,[0.902,0.553,1,1]];	
} foreach _legal_array;

{
	_price_list lbAdd format["%1 (Вес: %2)",_x select 0,_x select 2];
	_price_list lbSetTextRight [(lbSize _price_list)-1, format["  $%1", [_x select 1] call RRPClient_util_numberText]];
	_price_list lbSetColor [(lbSize _price_list)-1,[0,1,0,1]];	
} foreach _illegal_array;