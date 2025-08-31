disableSerialization;
params [
	["_docList", controlNull, [controlNull]],
	["_index", -1, [0]]
];

if (isNull _docList OR _index isEqualTo -1) exitWith {};

private _docInfo = ((findDisplay 55200) displayCtrl 55202);
private _docBuyButton = ((findDisplay 55200) displayCtrl 55203);

private _tvData = _docList lbData _index;
private _docData = parseSimpleArray _tvData;


if (_docData isEqualTo []) then {
	_docInfo ctrlSetStructuredText parseText format["<t size='1' font='RobotoCondensed'>Нет какой-либо информации<br /><br /></t>"];
	_docBuyButton ctrlEnable false;
} else {
	_docData params ["_docClass","_conditions","_message","_show"];

	private ["_countDay","_description","_price","_type"];
	_countDay = getNumber(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "expires");
	_description = getText(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "description");
	_price = getNumber(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "price");
	if (_price > 0) then {
		_price = ["priceSell",_price] call RRPClient_system_VIP;
	};

	_type = getText(missionConfigFile >> "LifeCfgDocuments" >> _docClass >> "type");
	_type = getText(missionConfigFile >> "LifeCfgDocumentsType" >> _type >> "name");

	_docInfo ctrlSetStructuredText parseText format ["<t size='0.9' font='RobotoCondensed'>Цена: <t color='#3f6b00'>%1</t><br />Тип: %2<br />Срок выдачи: %3д<br /><br />Описание:<br />%4</t>",[_price] call RRPClient_util_numberText,_type,_countDay,_description];
	_docBuyButton ctrlEnable ([_conditions] call RRPClient_util_conditionsCheck && !(_docClass in life_documents));

	if ([_conditions] call RRPClient_util_conditionsCheck && !(_docClass in life_documents)) then {
		_docBuyButton ctrlEnable true;
	} else {
		_docBuyButton ctrlEnable false;
	};
};
