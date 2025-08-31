/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

try {
    if (backpack player isEqualTo "RRP_UWW_100") throw "Ваш акваланг полностью заправлен!";
    if !(["RRP_UWW_", backpack player] call RRPClient_util_xString) throw "У Вас нет акваланга";

    private ["_currentCapacity","_price"];
    _currentCapacity = (call compile ((backpack player regexFind ["[0-9]+"]) # 0 # 0 # 0));
    _price = (100 - _currentCapacity) * getNumber(missionConfigFile >> "cfgDiving" >> "oxygenCost");

    [
        (findDisplay 46),
        {
            removeBackpack player;
            player addBackpack "RRP_UWW_100";
            ["InfoTitleAndText", ["Акваланг заправлен!", ""]] call SmartClient_gui_toaster_addTemplateToast;
        },
        [],
        "Заправить акваланг?",
        format["Это обойдеться вам в %2%1",[_price] call RRPClient_util_numberText,"$"]
    ] call RRPClient_util_prompt;

} catch {
    ["WarningTitleAndText", ["Дайвинг", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
