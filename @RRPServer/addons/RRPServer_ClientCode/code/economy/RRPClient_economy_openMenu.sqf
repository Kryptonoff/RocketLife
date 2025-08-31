
createDialog "RRPDialogMarket";
private _display = uiNamespace getVariable ["RRPDialogMarket",displayNull];
_display displayAddEventHandler ["Unload",{_this call RRPClient_economy_unLoad}];
private _filter = _display displayCtrl 250011;

private _list = _display displayCtrl 25002;
_list ctrlAddEventHandler ["LbSelChanged","_this call RRPClient_economy_lnbSelChanged"];

[_filter,_list] call BIS_fnc_initListNBoxSorting;
private _table = [0,0.35,0.5,0.75];
_filter lnbSetColumnsPos _table;
_list lnbSetColumnsPos _table;
_filter lbsetcursel -1;

private _tabDescription = _display displayCtrl 25100;
_tabDescription ctrlShow true;

private _settingsBtn = _display displayCtrl 25003;
_settingsBtn ctrlAddEventHandler ["ButtonClick","_this call RRPClient_economy_switchTab"];

(_display displayCtrl 25005) cbSetChecked true;

if !((call life_adminlevel) > 2) then {
	{
		_ctrl = _display displayCtrl _x;	
		_ctrl ctrlEnable false;
		_ctrl ctrlShow false;

	}forEach [25003,25004];
};
call RRPClient_economy_refresh;

private _updateTimer = {
	private ["_ctrlTimer","_dif","_ctrlTimer","_text"];
	_display = uiNamespace getVariable ["RRPDialogMarket",displayNull];
	_progressTimer = _display displayCtrl 25001;
	
	_dif = (900 - ((serverTime - RRPPublicEconomyLastUpdate)));

	_text = switch (true) do {
		case (_dif > 0) : {[([_dif/60, "HH:MM"] call BIS_fnc_timeToString),"До обновления экономики:","#ffffff"]};
		case (_dif <=0) : {["00:00","Обновление...","#cb0043"]};
	};
	if (_dif <=0) then {call RRPClient_economy_refresh};
	_progressTimer ctrlSetStructuredText parseText format ["<t align='left' size='1.2' font='RobotoCondensedBold'>%2 </t><t align='left' color='%3' size='1' font='RobotoCondensedLight' >%1 </t>",(_text#0),(_text#1),(_text#2)];

};
private _handler = [
	_updateTimer, 
	1,
[]] call CBA_fnc_addPerFrameHandler;
_display setVariable ["timer_handler",_handler];

