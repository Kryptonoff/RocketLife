/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_player","_vehicle","_plate","_id","_side"];
params [
	["_sessionID","",[""]],
	["_parameters",[],[[]]]
];

_parameters params [
	["_mode","",[""]],
	["_netIdVehicle","",[""]],
	["_price",-1,[0]]
];

try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Игрок не определен";
	_vehicle = objectFromNetId _netIdVehicle;
	if (isNull _vehicle) throw "Транспорт не определен";
	if (_vehicle getVariable ["Mute",false]) throw "С этой техникой уже кто-то взаимодействует...";
	_vehicle setVariable ["Mute",true];
	switch (_mode) do
	{
		case "sell":{
			_price = ["ScrapDealer", _price] call RRPClient_perks_activatePerk;
			
			if (_player getVariable ["GroupID",-1] isNotEqualTo -1) then {
				_group = missionNamespace getVariable [format ["ServerGroupsInfo_%1",_player getVariable ["GroupID",-1]],createHashMap];
				_tax = (RRPClientGroupInfo get "taxes") get "chopVehicle";
				if (_tax > 0) then {
					_tax = _price * (_tax / 100);
					_price = _price - _tax;
					[_player getVariable ["GroupId",-1],"add",_tax] remoteExecCall ["RRPServer_groups_moneyChange",2];
				};
			};


			[_player,"dcash","add",_price] call RRPServer_system_moneyChange;
			_id = _vehicle getVariable ["RRPDatabaseID",-1];
			_oldOwner = (_vehicle getVariable ["dbInfo",[]]) select 0;
			_plate = (_vehicle getVariable ["dbInfo",[]]) select 1;
			if !(_id isEqualTo -1) then
			{
				format ["markDeleteVehicle:%1:%2",format ["Продана на перебивке %1 (%2) за %3",name _player,getPlayerUID _player,[_price] call RRPClient_util_numberText],_id] call RRPServer_DB_fireAndForget;
			};
			_vehicle call RRPServer_vehicleSaveQueue_removeVehicle;
			deleteVehicle _vehicle;
			["response",format ["Вы успешно продали транспортное средство за $%1, не забудьте отмыть деньги...",[_price] call RRPClient_util_numberText] ] remoteExecCall ["RRPClient_chopShop_action",owner _player];
			private _discord = format ["%1 (%2) продал авто %3 (%4 ID:%5, %6) за %7 Старый владелец: %8",
					(name _player),
					(getPlayerUID _player),
					(getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")),
					typeOf _vehicle,
					_id,
					_plate,
					([_price] call RRPClient_util_numberText),
					_oldOwner];
			['Продал!','ChopBot','FDF212',_discord] call RRPServer_discord_sendMessage;
			['gta',1] remoteExecCall ["RRPClient_ach_gateway",_player];
			[75,"продажу техники"] remoteExecCall ["addXP",_player];
		};
		case "own": {
			_id = _vehicle getVariable ["RRPDatabaseID",-1];
			if (_id isEqualTo -1) throw "ID техники не определенно, действие невозможно";
			_oldOwner = (_vehicle getVariable ["dbInfo",[]]) select 0;
			_plate = (_vehicle getVariable ["dbInfo",[]]) select 1;
			_vehicle setVariable ["dbInfo",[getPlayerUID _player,_plate],true];
			_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID _player,name _player]],true];

			[_player,"cash","take",_price] call RRPServer_system_moneyChange;
			format ["chopShopOwn:%1:%2",getPlayerUID _player,_id] call RRPServer_DB_fireAndForget;
			["response",format ["Вы успешно перебили транспортное средство за $%1",[_price] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_chopShop_action",owner _player];	
			private _discord = format ["%1 (%2) перебил авто %3 (%4 ID:%5, %6) за %7 Старый владелец: %8",
					(name _player),
					(getPlayerUID _player),
					(getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")),
					typeOf _vehicle,
					_id,
					_plate,
					([_price] call RRPClient_util_numberText),
					_oldOwner];
			['Перебил!','ChopBot','9912FD',_discord] call RRPServer_discord_sendMessage;
			[100,"перебивку"] remoteExecCall ["addXP",_player];
			['itNowMy',1] remoteExecCall ["RRPClient_ach_gateway",_player];
			[_player] call RRPServer_garage_refreshCountGarage;
		};
		default {throw "Не понял нах?"};
	};
}catch{
	["WarningTitleOnly",[_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
	diag_log "ChopShop Error: " + _exception;
};
if !(isNull _vehicle) then {_vehicle setVariable ["Mute",nil]};
true
