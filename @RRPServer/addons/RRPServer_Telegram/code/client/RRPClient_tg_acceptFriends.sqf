
#include "..\..\script_macros.hpp"
params [
	["_playerName","",[""]],
	["_playerUID","",[""]]
];
try
{
	if (_playerUID isEqualTo "" OR {_playerName isEqualTo ""}) exitWith {false};
	["SuccessTitleAndText",["Телефон",format["Теперь %1 у вас в друзьях",_playerName] ]] call SmartClient_gui_toaster_addTemplateToast;
	if (_playerUID isEqualTo "") throw "Не определен ID";

	{
		if ((_x select 0) isEqualTo _playerUID) exitWith {
			_messageData = (_x select 2);
			{
				if ((_x select 1) isEqualTo "[Удалил вас из друзей...]") then 
				{
					_messageData deleteAt _forEachIndex;
				};
			} foreach _messageData;
			_x set [2,_messageData];
		};
	} forEach RRPClientTGConversations;

	[_playerUID,_playerName,_playerName,"[Теперь у вас в друзьях...]"] call RRPClient_tg_saveConversation;

	RRPClientTGFriends pushBack [_playerName,_playerUID];
	["add",RRPClientTGFriends] call RRPClient_ini_friendList;
	
	if (count RRPClientTGFriends >= 100) throw "Вы достигли максимального количество друзей (мах 100)";
}catch{
	["ErroTitleAndText",["Телефон", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};

