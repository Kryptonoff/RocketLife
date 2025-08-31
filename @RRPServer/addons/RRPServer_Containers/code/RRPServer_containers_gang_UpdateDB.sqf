/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_container","_varDB","_trunkData","_invData","_conditions","_transporters","_query"];
params
[
	["_container","1:-1",[""]],
	["_trunk", false]
];

str _this call RRPServer_util_debugConsole;

try
{
	if (_container isEqualTo "1:-1") throw "NetId отсутствует";
	_container = objectFromNetId _container;
	if (isNull _container) throw "Объекта не существует";
	_varDB = _container getVariable ["VarDB",""];
	if (_varDB isEqualTo "") throw "Переменная объекта не определена";

	if (_trunk) then 
	{
		_trunkData = _container getVariable ["Trunk",[[],0]];
		format ["updateGangTrunks:%1:%2",_trunkData,_varDB] call RRPServer_DB_fireAndForget;
	}else{
		_invData = 	_container getVariable ["inventory",[[],0]];
		format ["updateGangInventory:%1:%2",_invData,_varDB] call RRPServer_DB_fireAndForget;
	};

}catch{
	format ["SaveGangBox Error: %1 #1001",_exception] call RRPServer_util_debugConsole;
};
true
