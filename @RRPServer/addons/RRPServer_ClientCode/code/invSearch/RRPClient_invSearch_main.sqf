
params [
	["_target",objNull]
];

try {
	private _exit = [_target] call RRPClient_invSearch_condition;
	if (_exit isNotEqualTo "") throw _exit;

	[player] remoteExec ["RRPClient_invSearch_query",_target];
}catch{
	["Обыск",_exception] call toastError;
};
