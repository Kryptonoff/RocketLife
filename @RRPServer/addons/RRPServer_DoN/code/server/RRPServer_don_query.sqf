
try 
{
	if !(params [
		["_machine", objNull, [objNull]],
		["_player", objNull, [objNull]]
	]) throw "Invalid params";

	if ((count (playableUnits select {
		(getPlayerUID _x) isEqualTo (_machine getVariable ["don_user", ""])
	}) <= 0)) then 
	{
		_machine setVariable ["don_user", "", true];
	}; 

	if 
	(
		!(_machine getVariable ["don_user", ""] isEqualTo "") && 
		!(_machine getVariable ["don_user", ""] isEqualTo (getPlayerUID _player))
	) throw "that machine is in use by someone else.";

	_machine setVariable ["don_user", (getPlayerUID _player), true];
	[_machine] remoteExecCall ["RRPClient_don_init", remoteExecutedOwner];
} catch 
{
	["Все или ничего!",format ["We couldn't claim the machine for you, because %1, your money has been returned", _exception]] remoteExecCall ["toastError",remoteExecutedOwner];
	[_player, "cash", "add", (getNumber (missionConfigFile >> "cfgDon" >> "betAmount"))] call RRPServer_system_moneyChange;
};
true
