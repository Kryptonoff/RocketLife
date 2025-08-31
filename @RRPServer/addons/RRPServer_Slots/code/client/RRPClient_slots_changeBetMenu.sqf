//RRPClient_slots_changeBetMenu
createDialog "RRPDialogChangeBet";
private _display = findDisplay 7200;;
private _bet_edit = _display displayCtrl 7201;
diag_log _bet_edit;
_bet_edit ctrlSetText (str (profilenamespace getvariable ["RRP_SlotsBet", 10000]));