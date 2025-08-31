
private ["_str","_frame","_display"];

if !(createDialog 'RRPDialogEmpty') exitWith {};
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
true call RRPClient_gui_util_blur;
_display displayAddEventHandler ["unload","uiNamespace setVariable ['RRPDialogEmpty', displayNull]; false call RRPClient_gui_util_blur;"];
_str = _display ctrlCreate ["RRP_RscStructuredText", 1001];
_str ctrlSetBackgroundColor [0.26, 0.24, 0.31,0.85];
_str ctrlSetPosition [0,0,1,1];
_str ctrlEnable false;
_frame = _display ctrlCreate ["RscFrame", 1002];
_frame ctrlSetPosition [0,0,1,1];

private  _ctrlEditDefaultTime = _display ctrlCreate ["RRP_RscEdit", 1003];
_ctrlEditDefaultTime ctrlSetPosition [0.1625,0.08,0.1625,0.04];
_ctrlEditDefaultTime ctrlSetText "default time";

private _ctrlEditCurrentLvl = _display ctrlCreate ["RRP_RscEdit", 1004];
_ctrlEditCurrentLvl ctrlSetPosition [0.1625,0.14,0.1625,0.04];
_ctrlEditCurrentLvl ctrlSetText "Текущий лвл";

private _ctrlEditMaxLvl = _display ctrlCreate ["RRP_RscEdit", 1005];
_ctrlEditMaxLvl ctrlSetPosition [0.425,0.08,0.1625,0.04];
_ctrlEditMaxLvl ctrlSetText "Максимальный лвл";

private _ctrlEditCurrentAmounItems = _display ctrlCreate ["RRP_RscEdit", 1006];
_ctrlEditCurrentAmounItems ctrlSetPosition [0.425,0.14,0.1625,0.04];
_ctrlEditCurrentAmounItems ctrlSetText "Текущее кол-в айтемов";

private _ctrlEditVip = _display ctrlCreate ["RRP_RscEdit", 1007];
_ctrlEditVip ctrlSetPosition [0.7,0.08,0.15,0.04];
_ctrlEditCurrentAmounItems ctrlSetText "ВИП";


private _ctrlEditSlots = _display ctrlCreate ["RRP_RscEdit", 1008];
_ctrlEditSlots ctrlSetPosition [0.7,0.14,0.15,0.04];
_ctrlEditCurrentAmounItems ctrlSetText "Расчетный размер техики";
