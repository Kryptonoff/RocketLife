#include "..\..\macros.hpp"
disableSerialization;
params [
	["_docList",controlNull,[controlNull]],
	["_select",-1,[0]]
];

if (isNull _docList OR EQUAL(_select,-1)) exitWith {closeDialog 0;}; //Bad data

private _type = _docList lbData _select;
private _typefilter = "";

if (isClass (missionConfigFile >> "LifeCfgDocumentsType" >> _type)) then {
    _typefilter = format["getText(_x >> 'type') isEqualTo '%1'",_type];
};

if (_filter isEqualTo "") then {
	_docInfo ctrlSetStructuredText parseText "<t size='1.1' font='RobotoCondensed'><br /><br />Нет какой-либо информации<br /><br /></t>";
	_docBuyButton ctrlEnable false;
} else {
	_docData params ["_docClass","_conditions","_message","_show"];
	private _countDay = M_CONFIG(getText,"LifeCfgDocuments",_docClass,"expires");
	private _description = M_CONFIG(getText,"LifeCfgDocuments",_docClass,"description");
	private _price = M_CONFIG(getNumber,"LifeCfgDocuments",_docClass,"price");
    if (_price > 0) then {_price = ["priceSell",_price] call RRPClient_system_VIP};

	_docInfo ctrlSetStructuredText parseText format ["
	<t size='1' font='RobotoCondensed'>
	<t size='1.2'>Цена: <t color='#3f6b00'>%1</t></t><br />
	<t size='1.2'>Срок выдачи: <t color='#3f6b00'>%2д</t></t><br />
	<t size='1.2'>Описание:</t><br />%3<br />
	</t>",_price,_countDay,_description];

	_docBuyButton ctrlEnable ([_conditions] call RRPClient_util_conditionsCheck && !(_docClass in life_documents));


	if ([_conditions] call RRPClient_util_conditionsCheck && !(_docClass in life_documents)) then {
		_docBuyButton ctrlEnable true;
        //_docBuyButton buttonSetAction format["%1 spawn Client_documents_buyReq",_docData];
    } else {
        _docBuyButton ctrlEnable false;
    };
};
