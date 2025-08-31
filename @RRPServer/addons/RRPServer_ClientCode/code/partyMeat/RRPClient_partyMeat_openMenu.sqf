/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

/* if  !((call (life_adminlevel) > 0) OR inviteToPartyMeat) exitWith {
    ["ErrorTitleAndText", ["20.07.2022", "Незабаром вiдкриття..."]] call SmartClient_gui_toaster_addTemplateToast;
}; */
if !(createDialog "partymeat") exitWith {};

private ["_display", "_ctrlStr"];
_display  = uiNamespace getVariable ["RRPDialogPartyMeat",displayNull];
_ctrlStr = _display displayCtrl 94650;

_ctrlStr ctrlSetStructuredText parseText format [
    "<t align = 'center' size = '1.5' font = 'overwatch' >Party meat</t><br/><br/>
    <t size = '1.2' align = 'center' >Правила</t><br/>
    <t size = '0.85' >1. Внесите депозит, при убийстве к нему будет прибавляться %4$, при смерти списываться - %5$<br/>
    2. После нажатия кнопки «На вечеринку» - игра вас перенесет на арену<br/>
    3. Основная цель - убить как можно больше участников и при этом не умирать<br/>
    4. Покинуть игру можно будучи в агонии. Для этого вам нужно нажать клавишу М на клавиатуре<br/>
    5. Если произойдет рестарт, ваш депозит переместится на ваш банковский счет<br/>
    6. Если депозита будет недостаточно, вы автоматически выкинет с игры. Остаток депозите перечислиться на счет банка</t><br/><br/>
    <t size = '0.79' >Максимальный размер депозита: %1$<br/>
     Комиссия за перевод: %2%3</t>",
    getNumber(missionConfigFile >> "party_meat" >> "maxDeposit"),
    getNumber(missionConfigFile >> "party_meat" >> "comission"),
    "%",
    getNumber(missionConfigFile >> "party_meat" >> "rewardKill"),
    getNumber(missionConfigFile >> "party_meat" >> "penalty")
];
