private _ret = [];
if (isClass(missionConfigFile >> "clothing_settings" >> _this)) then {
    _ret = [
        getText(missionConfigFile >> "clothing_settings" >> _this >> "custom_name"),
        getText(missionConfigFile >> "clothing_settings" >> _this >> "condition_sell"),
        getText(missionConfigFile >> "clothing_settings" >> _this >> "condition_sell_message"),
        getText(missionConfigFile >> "clothing_settings" >> _this >> "condition_use"),
        getText(missionConfigFile >> "clothing_settings" >> _this >> "condition_use_message"),
        getNumber(missionConfigFile >> "clothing_settings" >> _this >> "price")
    ];
};

_ret
