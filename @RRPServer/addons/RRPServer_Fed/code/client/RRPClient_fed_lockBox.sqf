/*

	Filename:	RRPClient_fed_lockBox.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com
	
*/
params [
	["_object", objNull, [objNull]]
];

try {
	[_object] remoteExecCall ["removeAllActions", -2];
	remoteExecCall ["", -2, netId _object];
	_object setVariable ["Unlocked", false, true];

	["Закрытие контейнера", "Контейнер закрыт"] call toastSuccess;
	[50,"закрытие хранилища"] call addXP;

} catch {
	["Закрытие контейнера", _exception] call toastError;
};