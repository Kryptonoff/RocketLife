params [
	"_mode",
	"_player",
	["_object",objNull],
	["_member",objNull,["",objNull]]
];

format ["%1",_this] call RRPServer_util_debugConsole;

try
{
	if (isNull _object) throw "Объект не определен";
	switch (_mode) do 
	{
		case "addMember": 
		{
			if ( _member isEqualType "" ) throw "Игрок не определен";
			if ( _member isEqualTo objNull ) throw "Игрок не определен";
			private _cost = getNumber(getMissionConfig "ptw" >> "costInviteToBox");
			if (_player getVariable ["RRPPoint",0] < _cost) throw "Недостаточно средств";

			private _members = _object getVariable ["members",[]]; 
			private _uid = getPlayerUID _member;
			if (count _members >= 2) throw "Достигнут лимит";
			 
			_members pushBackUnique _uid;
			_object setVariable ["members",_members,true];

			format ["updateContainerMember:%1:%2",_members,vehicleVarName _object] call RRPServer_DB_fireAndForget;
			[_player,"point","take",_cost] call RRPServer_system_moneyChange;
			
			format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"addMemberContainer",_cost,
				format ["%1 добавлен в ящик %2",_uid, vehicleVarName _object]
			] call RRPServer_DB_lk_fireAndForget;

			["SuccessTitleAndText",["Личный контейнер","Выбранный игрок добавлен в личный контейнер!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
			["response",objNull,true] remoteExecCall ["RRPClient_containers_gang_manage",_player];
		};
		case "removeMember": 
		{
			
			if (_member isEqualType objNull) throw "Игрок не определен";
			if ( _member isEqualTo "" ) throw "Игрок не определен";
			
			private _members = _object getVariable ["members",[]]; 
			_members deleteAt (_members find _member);
			_object setVariable ["members",_members,true];

			format ["updateContainerMember:%1:%2",_members,vehicleVarName _object] call RRPServer_DB_fireAndForget;
			["SuccessTitleAndText",["Личный контейнер","Выбранный игрок удален из личного контейнера!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
			["response",objNull,true] remoteExecCall ["RRPClient_containers_gang_manage",_player];
		};
		default {throw "ЧЕГО ЧЕГО ЧЕГО???"};
	};
} catch {
	["ErrorTitleAndText",["Личный контейнер",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	["response",objNull,false] remoteExecCall ["RRPClient_containers_gang_manage",_player];
};

true
