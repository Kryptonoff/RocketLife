disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 32000;

private _filter = _slide controlsGroupCtrl 32015;

private _list = _slide controlsGroupCtrl 32002;
_list ctrlAddEventHandler ["LbSelChanged","_this call RRPClient_economy_lnbSelChanged"];

[_filter,_list] call BIS_fnc_initListNBoxSorting;
private _table = [0,0.35,0.5,0.75];
_filter lnbSetColumnsPos _table;
_list lnbSetColumnsPos _table;
_filter lbsetcursel -1;

(_slide controlsGroupCtrl 32003) cbSetChecked true;

call RRPClient_economy_refresh;

private _updateTimer = {
	private ["_ctrlTimer","_dif","_ctrlTimer","_text"];
	_display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 32000;
	_progressTimer = _display displayCtrl 32001;
	
	_dif = (900 - ((serverTime - RRPPublicEconomyLastUpdate)));

	_text = switch (true) do {
		case (_dif > 0) : {[([_dif/60, "HH:MM"] call BIS_fnc_timeToString),"До обновления экономики:","#ffffff"]};
		case (_dif <=0) : {["00:00","Обновление...","#cb0043"]};
	};
	if (_dif <=0) then {call RRPClient_economy_refresh};
	_progressTimer ctrlSetStructuredText parseText format ["<t align='left' size='1.2' font='SFCompactText'>%2 </t><t align='left' color='%3' size='1' font='SFCompactTextItalic' >%1 </t>",(_text#0),(_text#1),(_text#2)];

};

RRPClientTabletThreadEconomyTimer = [1, _updateTimer, [], true] call RRPClient_system_thread_addtask;
