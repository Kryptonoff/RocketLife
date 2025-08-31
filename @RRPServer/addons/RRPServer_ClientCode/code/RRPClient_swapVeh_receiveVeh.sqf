private _from = param [0,objNull,[objNull]];
private _vehicle = param [1,objNull,[objNull]];
private _price = param [2,0,[0]];
private _vid = param [3,0,[0]];
private _vip = param [4,0,[0]];
private _check = param [5];

try{
    if (_price > RRPClientAtmMoney) throw "У него нет такой суммы";
    private _config = getText(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "condition");
    if !(_check) throw "Принимающая сторона не соответствует требованиям транспорта!";
    if !(_vip <= (call life_donator)) throw "Принимающая сторона должна иметь равный или выше, статус VIP карты!";
    if ((call RRPClient_garage_limitMultiplier) <= player getVariable ["CountVehicles",0]) throw "У принимающей стороны достигнут лимит гаража";

    _action = [
        format ["%1 хочет передать вам %2 в обмен на %3$. Принимаете обмен?", _from call getNickName, getText(configFile >> "CfgVehicles" >> typeof _vehicle >> "displayName"), [_price] call RRPClient_util_numberText],
        "Vehicle exchange", 
        "Да", 
        "Нет"
    ] call BIS_fnc_guiMessage;

    if (_action) then {
        [player,_vehicle,_price,_vid] remoteExecCall ["RRPClient_swapVeh_infoBack",_from];
        [format ["%1 была передана вам в собственность от %2 за %3",getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName"),_from call getNickName,_price]] call hints;
        [[player,"atm","take",_price],"system_moneyChange"] call RRPClient_system_hcExec;

        if !(_vehicle in life_vehicles) then 
        {
            life_vehicles pushBack _vehicle;
            [[getPlayerUID player,_vehicle,1],"system_keyManagement"] call RRPClient_system_hcExec;
        };
    } else {
        throw format ["%1 не принял предложение обмена.",player call getNickName];
    };

}catch{
    [1,_exception] remoteExecCall ["RRPClient_system_broadcast",_from];
};  
