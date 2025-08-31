
try {
	private _display = uiNamespace getVariable ["RRPDialogRouletteJoin",displayNull];
	if (isNull _display) throw "Что то пошло не так...";
	private _bet = _display getVariable ["bet",0];
	if (_bet isEqualTo 0) throw "Вы не выбрали ставку!";
	[SessionId, _bet] remoteExecCall ["RRPServer_russianRoulette_joinRussianRouletteRequest",2];
	closeDialog 0;

}catch{
	["Русская рулетка",_exception] call toastError;
};
