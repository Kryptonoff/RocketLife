/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND

	Parameter(s):
	_this select 0 <BOOLEAN> - show or not
*/

if (isNull (uiNamespace getVariable ["RRPDialogWarZone",displayNull])) exitWith {};

params[
	["_show",false,[false]],
	["_wp",false,[false]]
];
private _display = uiNamespace getVariable ["RRPDialogWarZone",displayNull];
private _nameBox = _display displayCtrl 25003;
private _radBox = _display displayCtrl 25004;
private _placeBtn = _display displayCtrl 25006;
private _removBtn = _display displayCtrl 25007;
private _inform = _display displayCtrl 25008;
private _impulse = _display displayCtrl 25009;
private _sendMsg = _display displayCtrl 25011;
private _group = _display displayCtrl 25010;
private _groupText = _group controlsGroupCtrl 25013;

comment "RRPServerWarZones [_pointID,_radius,_pointName,_unitName]";

if (_show) then
{
	if (_wp) then
	{
		_placeBtn ctrlEnable false;
		_removBtn ctrlEnable true;
		_impulse ctrlEnable true;
		_sendMsg ctrlEnable true;
		_nameBox ctrlEnable false;
		_nameBox ctrlSetText ((RRPServerWarZones select RRPClientMarkerIndexLocal) select 2);
		_radBox ctrlSetText str ((RRPServerWarZones select RRPClientMarkerIndexLocal) select 1);
		_inform ctrlSetStructuredText parseText format [
			"Название: %1<br/>" + 
			"Радиус: %2<br/>" + 
			"Установил: %3<br/>",
			 ((RRPServerWarZones select RRPClientMarkerIndexLocal) select 2),
			 ((RRPServerWarZones select RRPClientMarkerIndexLocal) select 1),
			 ((RRPServerWarZones select RRPClientMarkerIndexLocal) select 3)
		];
		[format["war_zone_%1",((RRPServerWarZones select RRPClientMarkerIndexLocal) select 0)]] call RRPClient_WarZone_fillChat;
	}
	else
	{
		_placeBtn ctrlEnable true;
		_removBtn ctrlEnable false;
		_impulse ctrlEnable false;
		_sendMsg ctrlEnable false;
		_nameBox ctrlEnable true;
		_groupText ctrlSetStructuredText parseText "";
		_nameBox ctrlSetText (RRPClientWarZones select 1);
		_radBox ctrlSetText str (RRPClientWarZones select 2);
		_inform ctrlSetStructuredText parseText "Название ВП должно быть коротким, но информативным. Обязательно должны указываться стороны конфликта, все не указанные стороны будут считаться нарушителями. Переписки с помощью ВП - запрещены";
	};
}else{
	_groupText ctrlSetStructuredText parseText "";
	_sendMsg ctrlEnable false;
};
