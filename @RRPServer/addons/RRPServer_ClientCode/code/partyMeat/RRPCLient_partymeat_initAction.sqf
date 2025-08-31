/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
try {
    private ["_deposit","_display","_minDeposit","_maxDeposit","_ctrlBtnStart","_ctrlInput","_ctrlStr"];
    _display = uiNamespace getVariable ["RRPDialogPartyMeat",displayNull];
    if (isNull _display) throw "Ошибка при создании диалога!";

    _ctrlBtnStart = _display displayCtrl 94652;
    _ctrlInput = _display displayCtrl 94651;
    _ctrlStr = _display displayCtrl 94650;

    _deposit = ctrlText _ctrlInput;
    if (!([_deposit] call RRPClient_system_isnumber)) throw "Вы ввели некорректную сумму!";
    _deposit = parseNumber _deposit;

    _minDeposit = getNumber(missionConfigFile >> "party_meat" >> "minDeposit");
    _maxDeposit = getNumber(missionConfigFile >> "party_meat" >> "maxDeposit");
    if (_deposit < _minDeposit) throw format ["Депозит не может быть менее %1$",_minDeposit];
    if (_deposit > _maxDeposit) throw format ["Ваш депозит не может быть более %1$",_maxDeposit];
    if (RRPClientAtmMoney < _deposit) throw "У Вас недостаточно денег!";
    [[player,"atm","take",_deposit],"system_moneyChange"] call RRPClient_system_hcExec;

    {
      [_display, _x, ctrlPosition _x, 1, 0.2] call RRPClient_gui_util_animateAllCtrl;
      _x ctrlEnable false;
    } forEach [_ctrlBtnStart,_ctrlInput];

    [0, "Black", 4, 1] spawn BIS_fnc_fadeEffect;
    [] spawn RRPCLient_partymeat_waitingProgress;
    playMusic "EventTrack02_F_Orange";
    uiSleep 4;
    [(netId player), _deposit] remoteExecCall ["RRPServer_partyMeat_registrationPlayer", 2];
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
