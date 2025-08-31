private _backpack = backpack player;
if (["RRP_UWW_", _backpack] call RRPClient_util_xString) then {
    RRPOxygenRemaining = call compile ((_backpack regexFind ["[0-9]+"]) # 0 # 0 # 0)/100
} else {
    RRPOxygenRemaining = 0;
}
