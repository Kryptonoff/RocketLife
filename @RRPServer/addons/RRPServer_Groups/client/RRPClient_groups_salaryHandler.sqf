if !(call RRPClient_groups_inGroup) exitWith {};
if !(call RRPClient_groups_isPrem) exitWith {};
private _rank = RRPClientGroupLevel;
private _salarys = RRPClientGroupInfo get "salary";
private _rankSalary = _salarys getOrDefault [_rank, []];
if (_rankSalary isEqualTo []) exitWith {};
_rankSalary params ["_time","_money","_enabled"];
if !(_enabled) exitWith {};

RRPClientLastPaymentTime = diag_tickTime;
salaryLoop = {
    params ["_", "_money"];
	private _bank = RRPClientGroupInfo get "bank";
	if (_bank < _money) exitWith {
        ["Ошибка!", "В банке организации недостаточно средств для выплаты зарплаты! Обратитесь к руководству!"] call toastError;
    };

	[player getVariable ["GroupID",-1],"take",_money] remoteExecCall ["RRPServer_groups_moneyChange",2];
	[player, "atm", "add", _money] remoteExecCall ["RRPServer_system_moneyChange",2];
    ["Зарплата!", format["Вам начислена зарплата $%1, следующая выплата будет через %2 минут", [_money] call RRPClient_util_numberText, _time]] call toastSuccess;
};

RRPClientSalaryHandler = [{
	private _rank = RRPClientGroupLevel;
	private _salarys = RRPClientGroupInfo get "salary";
	private _rankSalary = _salarys getOrDefault [_rank, []];

	if !(_rankSalary isEqualTo []) then {
		_rankSalary params ["_time","_money","_enabled"];
		if ((diag_tickTime - RRPClientLastPaymentTime) > _time * 60) then {
			RRPClientLastPaymentTime = diag_tickTime;
			if (_enabled) then {
				[_time, _money] call salaryLoop;
			} else {
				[RRPClientSalaryHandler] call CBA_fnc_removePerFrameHandler;
			};
        };
    };

}, 1] call CBA_fnc_addPerFrameHandler;
