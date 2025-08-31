/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (isNull (uiNamespace getVariable ["RRPDialogWarZone",displayNull])) exitWith {};
private _zone = param [0,"",[""]];
disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogWarZone",displayNull];
private _group = _display displayCtrl 25010;
private _groupText = _group controlsGroupCtrl 25013;
_groupText ctrlSetStructuredText parseText "";
private _messages = "<t align='center' color='#777777' font='RobotoCondensedLight' shadow='0' size='0.9' >Начало чата</t><br/>";
_msgs = (missionNamespace getVariable [format["RRPPublicWarZoneChat_%1",_zone],[]]);
{
	_x params ["_senderName","_message","_time"];
	if ((player call getNickName) isEqualTo _senderName) then
	{
   		_messages = _messages + format["<t align='left' color='#2ECC71' font='RobotoCondensedBold' shadow='0' size='0.8' >%1</t>",_senderName];
		_t = [round(serverTime - _time), "MM:SS",true] call BIS_fnc_secondsToString;
		_messages = _messages + format["<t align='left' color='#777777' font='RobotoCondensedLight' shadow='0' size='0.6' >  %2 мин %1 сек. назад</t><br/>",_t#1,_t#0];
		_messages = _messages + format["<t align='left' color='#FDFEFE' font='RobotoCondensed' shadow='0' size='0.9' >%1</t><br/>",_message];
	} else {
		_messages = _messages + format["<t align='right' color='#C0392B' font='RobotoCondensedBold' shadow='0' size='0.8' >%1</t>",_senderName];
		_t = [round(serverTime - _time), "MM:SS",true] call BIS_fnc_secondsToString;
		_messages = _messages + format["<t align='right' color='#777777' font='RobotoCondensedLight' shadow='0' size='0.6' >  %2 мин %1 сек. назад </t><br/>",_t#1,_t#0];
		_messages = _messages + format["<t align='right' color='#FDFEFE' font='RobotoCondensed' shadow='0' size='0.9' >%1</t><br/>",_message];
	};
}forEach _msgs;
_textPosition = ctrlPosition _groupText;
_groupText ctrlSetStructuredText parseText _messages;
_textPosition set [3,((ctrlTextHeight _groupText) + 0.005)];
_groupText ctrlSetPosition _textPosition;
_groupText ctrlCommit 0;
