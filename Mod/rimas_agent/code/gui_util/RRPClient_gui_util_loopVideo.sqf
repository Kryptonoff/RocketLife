
params['_ctrl'];
if (isNull _ctrl) exitWith {};
private _group = _ctrl getVariable['group', controlNull];
private _position = _ctrl getVariable['position', []];
[_ctrl, _group, _position, ctrlText _ctrl] spawn 
{
	private _display = ctrlParent(_this select 0);
	ctrlDelete(_this select 0);
	private _video = [_this select 1, -1, _this select 2, "RscVideo"] call RRPClient_gui_util_makeCustom;
	_video ctrlSetText(_this select 3);
	_video setVariable['group', _this select 1];
	_video setVariable['position', _this select 2];
	_video ctrlAddEventHandler['VideoStopped', RRPClient_gui_util_loopVideo];
	_display setVariable['videoFrame', _video];
};
