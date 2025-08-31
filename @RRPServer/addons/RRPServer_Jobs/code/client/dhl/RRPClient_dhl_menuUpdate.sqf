/*

	Filename: 	RRPClient_dhl_menuUpdate.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
disableSerialization;

private _startPoint = lbData[5802, lbCurSel 5802];
private _finishPoint = lbData[5803, lbCurSel 5803];

if (_startPoint isEqualTo "" OR _finishPoint isEqualTo "") exitWith {};

private _total = 0;
if !(_startPoint isEqualTo _finishPoint) then {
	_startPoint = call compile format["%1",_startPoint];
	_finishPoint = call compile format["%1",_finishPoint];
	if (isNil "_startPoint" OR isNil "_finishPoint") exitWith {};
	_factor = (("dhl" call RRPClient_economy_getResInfo) select 2) * 0.01;
	_total = round((_startPoint distance2D _finishPoint) * _factor);
	if ((call life_donator) > 0) then {_total = ["priceUp", _total] call RRPClient_system_VIP};
};

private _price = (findDisplay 5800) displayCtrl 5804;
_price ctrlSetStructuredText parseText format ["<t size='1.1' valign='middle' align='right' color='#3f6b00'>$%1</t>",[_total] call RRPClient_util_numberText];