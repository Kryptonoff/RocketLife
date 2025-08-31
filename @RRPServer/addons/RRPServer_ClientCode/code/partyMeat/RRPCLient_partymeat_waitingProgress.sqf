/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
private ["_display","_ctrlStr","_lineHeight","_linesTotal","_trailingSpace","_dots","_count"];
waitingProgressPartyMeat = true;
_display = uiNamespace getVariable ["RRPDialogPartyMeat",displayNull];
if (isNull _display) throw "Ошибка при создании диалога!";
_ctrlStr = _display displayCtrl 94650;

_lineHeight = getNumber (configFile >> "RscStructuredText" >> "size");
_linesTotal = (ctrlPosition _ctrlStr select 2) / _lineHeight;
_trailingSpace = "";
for "_i" from 1 to _linesTotal do { _trailingSpace = _trailingSpace + " " };

_dots = ["",".","..","..."];
_count = 0;
while {waitingProgressPartyMeat} do {
    _ctrlStr ctrlSetStructuredText parseText format ["<t size='%1'><t size='1' align='center' valign='middle'><t size = '5' ><img image='\rimas_agent\assets\pic\partyMeatLogo.paa'/></t><br/>%2%4%3</t> </t>", _linesTotal, "Подготовка", _trailingSpace,(_dots # _count)];
    uiSleep 0.25;
    _count = if (_count == 3) then {0} else {_count + 1};
};
