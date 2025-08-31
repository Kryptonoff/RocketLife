/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
while {true} do {
    uiSleep (60 * 15);

    if (
        !(player getVariable ["lifeState",""] isEqualTo "HEALTHY") OR
        {(player getVariable ["RRPVariablePartyMeatActive", false])} OR
        {player inArea "stratis_zone"} OR
        {RRPClientIsPlayingRussianRoulette} OR
        {!(player getVariable ["pok_player_status",""] isEqualTo "")}
    ) then {continue};

	private _res = switch(true) do {
		case (!alive player): {0};
		case ([getText(missionConfigFile >> "LifeCfgSettings" >> "life_paycheckCondition")] call RRPClient_util_conditionsCheck): {
			[getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_paycheckGov"),'Вы получили зарплату в размере']
		};
		case (license_gov_unemployment_three OR license_gov_unemployment_five OR license_gov_unemployment_seven): {
			[getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_paycheck"),'Вы получили пособие по безработице в размере']
		};
        default {continue};
	};
    _res params ["_amount","_text"];

    if !(server_bank > _amount) exitWith {
        ["WarningTitleAndText", ["Выплаты!", "Сожалеем, в казне денег нет, но вы держитесь..."]] call SmartClient_gui_toaster_addTemplateToast;
    };

    if (_amount isEqualTo 0) exitWith {
        ["WarningTitleAndText", ["Выплаты!", "Вам пришел пустой платеж... Какая досада"]] call SmartClient_gui_toaster_addTemplateToast;
    };

    ["SuccessTitleAndText", ["Выплата", format ["%1 %2$",_text,_amount]]] call SmartClient_gui_toaster_addTemplateToast;
    [[player,"atm","add",_amount],"system_moneyChange"] call RRPClient_system_hcExec;
    [[player,"serverbank","take",_amount],"system_moneyChange"] call RRPClient_system_hcExec;

};
