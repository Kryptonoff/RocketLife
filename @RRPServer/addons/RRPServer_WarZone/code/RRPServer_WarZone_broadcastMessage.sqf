/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	private _text = param [0,"",[""]];
	private _player = param [1,objNull,[objNull]];
	if (_text isEqualTo "") throw "Вы ничего не ввели";
	private _zone = _player call RRPClient_WarZone_util_getZoneInside;
	if (_zone isEqualTo []) throw "Нужно быть в зоне военных действий";
	private _getUnits = [_zone#0,_zone#1] call RRPClient_WarZone_util_getUnitsInside;
	if !(_getUnits isEqualTo []) then 
	{
		{
			if !(_x isEqualTo "1:1") then
			{
				["InfoTitleAndText",["Военное положение",format["Сообщение: %1",_text]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner (objectFromNetId _x)];
				[_zone#0] remoteExecCall ["RRPClient_WarZone_fillChat",owner(objectFromNetId _x)];
			};
		}forEach _getUnits; 
	};
	_chat = missionNamespace getVariable [format["RRPPublicWarZoneChat_%1",_zone#0],[]];
	_chat pushBack [_player call getNickName,_text,serverTime];
	missionNamespace setVariable [format["RRPPublicWarZoneChat_%1",_zone#0],_chat,true];
}catch{
	["ErrorTitleAndText",["Военное положение",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
