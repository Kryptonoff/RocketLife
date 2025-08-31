#include "..\..\script_macros.hpp"
params [
	["_msg","",[""]],
	["_unit",objNull,[objNull]],
	["_type",0,[0]]
];

if (_msg isEqualTo "" OR {isNull _unit}) exitWith {};

_playerUID = getPlayerUID _unit;
_position = getPosATL _unit;
_fromName = name _unit;

if (_msg isEqualTo "[Удалил переписку...]") exitWith 
{
	{
	    if ((_x select 0) isEqualTo _playerUID) exitWith 
		{
			RRPClientTGConversations deleteAt _forEachIndex;
		};
    } forEach RRPClientTGConversations;
	["add",RRPClientTGConversations] call RRPClient_ini_chatHistory;
};

private _gridPos = mapGridPosition _position; // Get map grid position based on given coordinates.
private _markerTimeout = 5 * 60; // Set automatic marker deletion delay.

switch (_type) do 
{
	case (0) : {
		//hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Новое сообщение<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>You<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_fromName,_msg];
		[_playerUID,_fromName,_fromName,_msg] call RRPClient_tg_saveConversation;
		//["TextMessage",[format["Вы получили сообщение от %1",_fromName]]] call bis_fnc_showNotification;
		player say3D "sms";
        [format["Новое сообщение от %1",_fromName]] spawn Client_hud_hint;
	};

	// To Admins.
	case (1) : {
		if (FETCH_CONST(life_adminlevel) < 1) exitWith {};
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Admins<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_fromName,_msg];

		["AdminDispatch",[format["%1 сделал запрос админу!",_fromName]]] call bis_fnc_showNotification;
		[_playerUID,_fromName,_fromName,_msg] call RRPClient_tg_saveConversation;
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ДЛЯ АДМИНА ОТ: %1",_fromName];
	};

	// From Admin to All Players.
	case (5) : {
		hint parseText format ["<t color='#8a00ff'><t size='2'><t align='center'>Сообщение от админа<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Админ<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["Вы получили сообщение от админа!"]] call bis_fnc_showNotification;
		if !(_unit isEqualTo player) then {
			["__ADMIN__","Администрация","Администрация",_msg] call RRPClient_tg_saveConversation;
        };

		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ АДМИНА: %1",_msg];

	};

	 // From Admin to Players.
	case (14) : {
		//hint parseText format ["<t color='#8a00ff'><t size='2'><t align='center'>Сообщение от админа<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Админ<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];
		[format ["<t color='#FFCC00'><t color='#33CC33'><t align='left'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2", "Admin", _msg],"Вы получили сообщение от админа!","R","",""] call client_system_hint;
		["AdminMessage",["Вы получили сообщение от админа!"]] call bis_fnc_showNotification;
		["__ADMIN__","Администрация","Администрация",_msg] call RRPClient_tg_saveConversation;
		player say3D "sms";
	};

	// To Police.
	case (2) : {
		if !(ISPSIDE("cop")) exitWith {};
		hint parseText format ["<t color='#d6aa07'><t size='2'><t align='center'>Новый вызов<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Полиция<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><t color='#33CC33'>Координаты: <t color='#ffffff'>%3<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_fromName,_msg,_gridPos];

		["PoliceDispatch",[format["Запрос в полицию от: %1",_fromName]]] call bis_fnc_showNotification;
		["__COP__",_fromName,_fromName,_msg] call RRPClient_tg_saveConversation;
		player say3D "sms";
		systemChat format["---ВЫЗОВ ПОЛИЦИИ ОТ %1: %2",_fromName,_msg];

        // Create marker and set it's properties.
        private _marker = format["police_request: %1", _fromName];
        createMarkerLocal [_marker, _position];
        _marker setMarkerPosLocal _position;
        _marker setMarkerTextLocal _fromName;
        _marker setMarkerTypeLocal "hd_warning";
        _marker setMarkerColorLocal "ColorRed";
        // Spawn a routine that will delete marker in n minutes.
        [_marker, _markerTimeout] spawn {
            _marker = _this select 0;
            _timeout = _this select 1;
            uiSleep _timeout;
            deleteMarker _marker;
        };

        // Create a log entry with the request.
        player createDiaryRecord ["comms", ["Вызовы", format["<font color='#00ff00'>%1</font> (<marker name='%3'>%2</marker>):<br/><br/>%4", _fromName, _gridPos, _marker, _msg]]];
	};

	// From Police to All Players.
	case (6) : {
		hint parseText format ["<t color='#0e83e6'><t size='2'><t align='center'>Полицейское сообщение<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>Полиция<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["PoliceDispatch",["Вы получили сообщение от полиции!"]] call bis_fnc_showNotification;
		if !(_unit isEqualTo player) then {
			["__COP__","Полиция","Полиция",_msg] spawn RRPClient_tg_saveConversation;
        };
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ ПОЛИЦИИ: %1",_msg];
		if (('cop' call RRPClient_groups_getSideLevel) > 0) then {systemChat format["Отправлено полицейским: %1", _fromName]};
	};

	// From Police to All Players.
	case (7), 
	case (8), 
	case (9), 
	case (10), 
	case (11) : 
	{
		hint parseText format ["<t color='#0e83e6'><t size='2'><t align='center'>Полицейское сообщение<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>Полиция<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["PoliceDispatch",["Вы получили сообщение от полиции!"]] call bis_fnc_showNotification;
		if !(_unit isEqualTo player) then {
			["__COP__","Полиция","Полиция",_msg] call RRPClient_tg_saveConversation;
        };
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ ПОЛИЦИИ: %1",_msg];
		if (('cop' call RRPClient_groups_getSideLevel) > 0) then {systemChat format["Отправлено полицейским: %1", _fromName]};
	};

	// To EMS.
	case (3): {
        if !(ISPSIDE("med")) exitWith {};
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>ВЫЗОВ ES<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Координаты: <t color='#ffffff'>%3<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_fromName,_msg,_gridPos];

		["TextMessage",[format["Вызов ES от %1",_fromName]]] call bis_fnc_showNotification;
		[_playerUID,_fromName,_fromName,_msg] call RRPClient_tg_saveConversation;
		player say3D "sms";
		systemChat format["!!!ВЫЗОВ ES: %1",_msg];

        // Create marker and set it's properties.
        private _marker = format["ems_request: %1", _fromName];
        createMarkerLocal [_marker, _position];
        _marker setMarkerPosLocal _position;
        _marker setMarkerTextLocal _fromName;
        _marker setMarkerTypeLocal "hd_warning";
        _marker setMarkerColorLocal "ColorRed";
        // Spawn a routine that will delete marker in n minutes.
        [_marker, _markerTimeout] spawn {
            _marker = _this select 0;
            _timeout = _this select 1;
            uiSleep _timeout;
            deleteMarker _marker;
        };

        // Create a log entry with the request.
        player createDiaryRecord ["comms", ["Вызовы", format["<font color='#00ff00'>%1</font> (<marker name='%3'>%2</marker>):<br/><br/>%4", _fromName, _gridPos, _marker, _msg]]];
	};

	// From EMS to All Players.
	case (12) : {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от EMS<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>ES<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["MedicMessage",["Вы получили сообщение от EMS!"]] call bis_fnc_showNotification;
		if !(_unit isEqualTo player) then {
			["__MED__","ES","ES",_msg] call RRPClient_tg_saveConversation;
        };
		player say3D "sms";
		format["!!!СООБЩЕНИЕ ОТ EMS: %1",_msg] call chat;
		if (('cop' call RRPClient_groups_getSideLevel) > 0) then {format["Отправлено сотрудником EMS: %1", _fromName] call chat};
	};

	// To Altory Media
	case (13): {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от 7 News<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Altory Media<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];
		if !(_unit isEqualTo player) then {
			["__PRESS__","7 News","7 News",_message] call RRPClient_tg_saveConversation;
        };
		player say3D "sms";
		format["СООБЩЕНИЕ ОТ 7 News: %1",_msg] call chat;
		if (('cop' call RRPClient_groups_getSideLevel) > 0) then {
			format["Отправлено сотрудником 7 News: %1", _fromName] call chat
		};
	};

	default {};
};
