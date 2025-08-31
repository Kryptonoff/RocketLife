/*
	Filename: 	RRPClient_system_lockHouse.sqf
	Project: 	Rimas Altis Life RPG
*/

#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
try{
	if (isNull _house OR {!(_house isKindOf "House_F")}) exitWith {};
	if (isNil {_house GVAR "house_owner"}) exitWith {};

	if !(_house in life_vehicles OR _house in life_tempHouses) throw "У вас нет ключей от дома";

	private _house_box = _house GVAR ["house_box",objNull];

	if (!isNull _house_box && {[_house_box] call RRPClient_system_isTrunkInUse}) throw "Хранилище используется";

	if (_house GVAR ["locked",false]) then {
		// private _uid = (_house GVAR "house_owner") select 0;
		// if !([_uid] call RRPClient_system_isUIDActive) throw "Владелец дома не в сети!";
		if (server_restartSoon) throw "Надвигается буря. Доступ к контейнеру закрыт.";

		[_house,player,false] remoteExec ["RRPServer_house_unlockHouseContainer",2];

		titleText ["Отправка запроса на сервер...","PLAIN"];
	} else {
		if (!isNull _house_box) then {deleteVehicle _house_box;};	
		[_house,"house_box"] call RRPClient_system_clearGlobalVar;
		_house SVAR ["locked",true,true];
		(format ["setStatusContainer:0:%1",_house getVariable ["house_id",-1]]) remoteExecCall ["RRPServer_DB_fireAndForget",2];
		titleText["Хранилище дома заблокировано.","PLAIN"];
	};
}catch{
	["ErrorTitleAndText",[_exception]]call toast;
};