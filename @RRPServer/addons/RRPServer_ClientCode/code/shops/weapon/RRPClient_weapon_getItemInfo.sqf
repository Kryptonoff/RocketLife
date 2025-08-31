private _ret = [];
if (isClass(missionConfigFile >> "LifeCfgItems" >> _this)) then {
    _ret = [
        getText(missionConfigFile >> "LifeCfgItems" >> _this >> "conditions_buy"),
        getText(missionConfigFile >> "LifeCfgItems" >> _this >> "conditions_buy_message"),
        getText(missionConfigFile >> "LifeCfgItems" >> _this >> "condition_use"),
        getText(missionConfigFile >> "LifeCfgItems" >> _this >> "condition_use_message"),
        getNumber(missionConfigFile >> "LifeCfgItems" >> _this >> "fix_sell_price"),
        getText(missionConfigFile >> "LifeCfgItems" >> _this >> "condition_sell"),
        getNumber(missionConfigFile >> "LifeCfgItems" >> _this >> "price")
    ];
};

_ret
