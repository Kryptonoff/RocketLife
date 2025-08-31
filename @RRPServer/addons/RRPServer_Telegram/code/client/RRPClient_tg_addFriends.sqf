#include "..\..\script_macros.hpp"

if !(canSuspend) exitWith {_this spawn RRPClient_tg_addFriends};
params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};
try
{
	private _playerUID = getPlayerUID _unit;
	private _playerName = name _unit;

	_friends = [_playerUID] call RRPClient_tg_checkFriends;
	if (_friends) exitWith {
		[profileName,getPlayerUID player] remoteExecCall ["RRPClient_tg_acceptFriends",_unit];
	};

	private _action = [
		format["%1 хочет стать вашим другом. Хотите ли вы принять предложение на дружбу ?",_playerName],
		"Предложение на дружбу",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

	if (!isNil "_action" && {!_action}) then {
		["ErrorTitleAndText",["Телефон",format["%1 отклонил запрос на дружбу",player call getNickName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_unit];
		throw "Вы отклонили запрос";
	};

	if (count RRPClientTGFriends >= 100) then {
		["ErrorTitleAndText",["Телефон",format["У %1 переполнен список друзей (мах 100)!",player call getNickName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_unit];
		throw "У вас переполнен список друзей (мах 100)!";
	};

	//Fix тут добавление GVAR_RNAME 3 аргументом
	[profileName,getPlayerUID player] remoteExecCall ["RRPClient_tg_acceptFriends",_unit];

	{
		if ((_x select 0) isEqualTo _playerUID) exitWith {
			_messageData = (_x select 2);
			{
				if ((_x select 1) isEqualTo "[Удалил вас из друзей...]") then {
					_messageData deleteAt _forEachIndex;
				};
			} foreach _messageData;
			_x set [2,_messageData];
		};
	} forEach RRPClientTGConversations;

	//Fix тут с профильНейма на GVAR_RNAME
	[_playerUID,name _unit,name _unit,"[Теперь у вас в друзьях...]"] call RRPClient_tg_saveConversation;

	RRPClientTGFriends pushBack [_playerName,_playerUID];
	["add",RRPClientTGFriends] call RRPClient_ini_friendList;

	if (count RRPClientTGFriends >= 100) throw "Вы достигли максимального количество друзей";
}catch{
	["ErrorTitleAndText",["Телефон",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
