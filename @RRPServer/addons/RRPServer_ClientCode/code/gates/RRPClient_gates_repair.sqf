/*
	author: Arrra
	steamID: 76561198090549826
	discord: arrra#9745
	cc by-nc-nd
*/
try
{
	private ["_gen","_complete","_breakingObject","_curGate"];
	_gen = (vehicleVarName curTarget);
	_breakingObject = getArray(missionConfigFile >> "cfg_genaratos" >> _gen >> "breakingObject");
	if ((_gen isEqualTo "gen_fed") AND life_inwarzone) throw "Генератор нельзя починить пока вы находитесь в военном положении";

	{
		_curGate = missionNamespace getVariable [_x,objNull];
		if (isNull _curGate) throw 'Ворота не определены!';
		if !(_curGate getVariable ["isBreaking",false]) throw "Ворота исправны!";
	} forEach _breakingObject;

	_complete = [
		"Восстановление...",
		{ ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player) and ((player distance (missionNamespace getVariable [_gen, objNull])) < 4)},
		true,
		(if ((call life_adminlevel) > 0) then {10} else {150}),
		false,
		true,
		{}
	] call RRPClient_system_newProgressBar;
	if (isNil "_complete") throw "Действие прервано";
	if !(_complete) throw "Действие прервано!";

	{
		_curGate = missionNamespace getVariable [_x,objNull];
		if !(isNull _curGate) then {
			_curGate setVariable ["isBreaking",nil,true];
			_curGate animate ["barier", 0];
			_curGate animate ["Gate", 0];
			_curGate animate ["window", 0];
			_curGate animate ["door", 0];
		};
	} forEach _breakingObject;
	[25,"ремонт генератора"] call addXP;
} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};