/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
params [
    ["_mode", "", [""]],
    ["_unit", objNull, [objNull]]
];

private ["_currentDeposit","_rewardKill","_penalty","_currentLvl","_lvlChange"];
_currentDeposit = player getVariable ["RRPVariablePartyMeatDeposit",0];
_rewardKill = getNumber(missionConfigFile >> "party_meat" >> "rewardKill");
_penalty = getNumber(missionConfigFile >> "party_meat" >> "penalty");
_lvlChange = getNumber(missionConfigFile >> "party_meat" >> "lvlChange");

if (_currentDeposit < _penalty) then {
    [] spawn {
        uiSleep 3;
        call RRPClient_partymeat_endGame
    };
};
_currentLvl = player getVariable ["RRPVariablePartyMeatLvl",0];
switch (_mode) do {
    case ("death"): {
        PartyMeatDeathCombo = PartyMeatDeathCombo + 1;
        if (PartyMeatDeathCombo >= _lvlChange AND _currentLvl > 0) then {
            PartyMeatDeathCombo = 0;
            _currentLvl = _currentLvl - 1;
            player setVariable ["RRPVariablePartyMeatLvl",_currentLvl,true];
            ["ErrorTitleOnly", "Уровень -1"] call SmartClient_gui_toaster_addTemplateToast;
        };
        private _currentDeaths = player getVariable ["RRPVariablePartyMeatDeaths",0];
        _currentDeaths = _currentDeaths + 1;
        player setVariable ["RRPVariablePartyMeatDeaths",_currentDeaths];

        _currentDeposit = _currentDeposit - _penalty;
        player setVariable ["RRPVariablePartyMeatDeposit",_currentDeposit];

        [player getVariable ["RRPVariablePartyMeatKills",0],_currentDeaths,_currentDeposit,_currentLvl, getPlayerUID player] remoteExecCall ["RRPServer_partyMeat_updateStats",2];
        player setVariable ["RRPVariablePartyMeatRespawn",true,true];
    };

    case ("kill"): {

        PartyMeatKillCombo = PartyMeatKillCombo + 1;
        if (PartyMeatKillCombo >= round(_lvlChange/2)) then {
            PartyMeatKillCombo = 0;
            if (
                (_unit getVariable ["RRPVariablePartyMeatLvl",0] > 0)  OR
                    (
                        (_unit getVariable ["RRPVariablePartyMeatLvl",0] == 0) AND
                        (player getVariable ["RRPVariablePartyMeatLvl",0] == 0)
                    )
            ) then {
                _currentLvl = _currentLvl + 1;
                player setVariable ["RRPVariablePartyMeatLvl",_currentLvl,true];
                ["SuccessTitleOnly", "Уровень +1"] call SmartClient_gui_toaster_addTemplateToast;
            };
        };

        private _currentKills = player getVariable ["RRPVariablePartyMeatKills",0];
        _currentKills = _currentKills + 1;
        player setVariable ["RRPVariablePartyMeatKills",_currentKills];

        _currentDeposit = _currentDeposit + _rewardKill;
        player setVariable ["RRPVariablePartyMeatDeposit",_currentDeposit];

        [_currentKills,player getVariable ["RRPVariablePartyMeatDeaths",0],_currentDeposit,_currentLvl,getPlayerUID player] remoteExecCall ["RRPServer_partyMeat_updateStats",2];

    };
};
true call RRPClient_partyMeat_hudUpdate;
