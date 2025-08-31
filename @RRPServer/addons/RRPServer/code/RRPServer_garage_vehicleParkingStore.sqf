/*
    File: fn_vehicleParkingStore.sqf
    Description:Отправляем технику на штрафстоянку
    Ставит на технике spname штрафстоянки, снимает с игрока деньги
*/
params [
	["_vehicle",ObjNull,[ObjNull]],
	["_parkingCost",0,[0]],
	["_parkingMessage","",[""]],
	["_unit",ObjNull,[ObjNull]]
];
[_unit,"atm","take",STR(_price)] call RRPServer_system_moneyChange;

private _dbInfo = _vehicle getvariable ["dbInfo",[]];
private _pid = _dbInfo select 0;
private _plate = _dbInfo select 1;
//удалить
_array = [_parkingCost,_parkingMessage];
_id = _vehicle getVariable ["RRPDatabaseID",-1];
format ["vehicleParkingStore:%1:%2",_array,_id] call RRPServer_DB_fireAndForget;
life_impound_inuse = false;
(owner _unit) publicVariableClient "life_impound_inuse";
if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

[] remoteExecCall ["RRPClient_parking_ImpoundActionDone",(owner _unit)];
