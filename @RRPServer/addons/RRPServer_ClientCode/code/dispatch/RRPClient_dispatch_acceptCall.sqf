/*
	Project: Rimas Role Play
	Authors: Arrra & FairyTale5571
	License: CC BY-ND
*/

try{
    disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 19000;

    private _requestList = _slide controlsGroupCtrl 6943;
    private _assigned = _slide controlsGroupCtrl 6950;
    private _curSelection = lbCurSel _requestList;
    disableSerialization;
    if (_curSelection isEqualTo -1) throw "Вы должны выбрать вызов...";
    if ((_requestList lbData _curSelection) isEqualTo "NULL") exitWith {};
    if ((lbCurSel 6956) isEqualTo -1) throw "Необходимо выбрать игрока для назначения этого вызова.";
    _player = player;
    if (isNull _player) exitWith {};

    _var = [];
    if (player call getSide isEqualTo "cop") then {_var = RRPClient_waiting_cop_calls;};
    if (player call getSide isEqualTo "med") then {_var = RRPClient_waiting_med_calls;};
    if (((count _var)-1) < _curSelection) throw "Что-то не так, откройте меня заново";
    _assignedData = _var select _curSelection;
    _nameAssigned = _assignedData select 4;
    if (_nameAssigned isEqualTo (_player call getFullName)) throw "Этот вызов уже был принят!";
    _action = true;
    if !(_nameAssigned isEqualTo "") then 
    {
        _action = [
            format ["Этот вызов уже закреплен за %1. Вы все равно хотите его взять?",_nameAssigned],
            "Управление вызовами",
            "Да",
            "Нет"
        ] call BIS_fnc_guiMessage;
    };
    if !(_action) exitWith {};
    _assignedData set [4,(_player call getFullName)];
    switch (true) do {
        case (player call getSide isEqualTo "cop"):
        {
            RRPClient_waiting_cop_calls set [_curSelection,_assignedData];
            publicVariable "RRPClient_waiting_cop_calls";
        };
        case (player call getSide isEqualTo "med"):
        {
            RRPClient_waiting_med_calls set [_curSelection,_assignedData];
            publicVariable "RRPClient_waiting_med_calls";
        };
    };

    _assigned ctrlSetText (_player call getFullName);
    _requestList lbSetPicture [_curSelection,"\rimas_dispatch\icons\assigned.paa"];
}catch{
    ["ErrorTitleAndText",[_exception]] call toast;
};
