/*
    File: fn_vehicleParkingPay.sqf
    Description:Платим за оштрафованную технику
    Ставит на технике spname штрафстоянки, снимает с игрока деньги
*/

params [
	["_vid",0,[0]],
	["_price",0,[0]],
	["_nid","",[""]]
];
[objectFromNetId _nid,"atm","take",_price] call RRPServer_system_moneyChange;
format ["vehicleParkingPay:%1",_vid] call RRPServer_DB_fireAndForget;
["Вы заплатили за эвакуацию техники, заберите ее на штрафстоянке","done"] remoteExecCall ["RRPClient_system_hint",remoteExecutedOwner];

["iro4ka",1] remoteExecCall ["RRPClient_ach_gateway",remoteExecutedOwner];
["stopham",1] remoteExecCall ["RRPClient_ach_gateway",remoteExecutedOwner];
