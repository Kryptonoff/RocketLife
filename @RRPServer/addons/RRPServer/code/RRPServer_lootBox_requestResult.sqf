/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_player","_nID","_check","_selectColor","_selectType","_selectitem","_plate"];
params [["_nID","",[""]]];
try
{
	_player = objectFromNetId _nID;
	if (isNull _player) throw "Something wrong";
	_check = format ["checkGift:%1",getPlayerUID _player] call RRPServer_DB_selectSingleField;
	if (_check) then 
	{
		[false] remoteExecCall ["RRPClient_lootBox_response",remoteExecutedOwner];
		throw "Вы его уже получили!";
	};
	_selectColor = [getArray(missionConfigFile >> "CfgLootBox" >> "chances")] call RRPClient_util_selectRandom;
	_selectType = selectRandom ["money","vehicles"];
	_selectitem = selectRandom getArray(missionConfigFile >> "CfgLootBox" >> _selectColor >> _selectType);
	switch (_selectType) do
	{
		case "money": 
		{
			[_player,"atm","add",(_selectitem # 0),[format["%1 (%2) выиграл деньги в размере %3",name _player,getPlayerUID _player,_selectitem # 0],"RewardsLog"]] call RRPServer_system_moneyChange;
			format ["insertGiftHistory:%1:%2:%3",getPlayerUID _player,"money",(_selectitem # 0)] call RRPServer_DB_fireAndForget;
		};
		case "item": 
		{
			format ["insertGiftHistory:%1:%2:%3",getPlayerUID _player,"item",(_selectitem # 0)] call RRPServer_DB_fireAndForget;
			[format ["%1 (%2) выиграл предмет %3",name _player,getPlayerUID _player,_selectitem # 0],"RewardsLog"] call RRPServer_system_logIt;
		};
		case "vehicles": 
		{
			_plate = call RRPClient_vehicle_setPlateNumber;
			_data = 
			[
				(_selectitem # 0),
				"Car",
				getPlayerUID _player,
				"default",
				_plate,
				10000,
				"default", 
				getNumber(getMissionConfig "LifeCfgVehicles" >> _selectitem # 0 >> "vItemSpace")
			];
			_message = ["insertGiftVehicle",_data] call RRPServer_DB_createMessage;
			_message call RRPServer_DB_insertSingle;
			[format ["%1 (%2) выиграл транспорт %3 (%4)",name _player,getPlayerUID _player,_selectitem # 0,_plate],"RewardsLog"] call RRPServer_system_logIt;
			format ["insertGiftHistory:%1:%2:%3",getPlayerUID _player,"vehicle",[(([(_selectitem # 0)] call RRPClient_util_itemDetails) select 1)] call RRPClient_util_stripChars ] call RRPServer_DB_fireAndForget;
		};
		default {throw "Что-то пошло точно не так...";};
	};
	format ["insertGift:%1:%2",getPlayerUID _player,name _player] call RRPServer_DB_insertSingle;
	[true,_selectColor,_selectType,_selectitem] remoteExecCall ["RRPClient_lootBox_response",remoteExecutedOwner];
}catch{
	["InfoTitleOnly",[_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
};
