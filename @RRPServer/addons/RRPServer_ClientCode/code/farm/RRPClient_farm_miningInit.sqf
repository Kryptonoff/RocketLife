/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
minerActive = [];
params [
    ["_target",objNull,[objNull]],
    ["_mod","",[""]]
];

try {

    private ["_resourceCfg","_zone", "_enabledFarmInVeh","_skill","_item","_enabledFarmMiner"];
    _resourceCfg = missionConfigFile >> "CfgFarm" >> "Resources";
	_zone = "";
    for "_i" from 0 to count(_resourceCfg)-1 do
	{
        private ["_curConfig","_resourceZones","_zoneSize"];
	    _curConfig = _resourceCfg select _i;
		_resourceZones = getArray(_curConfig >> "zones");
	    _zoneSize = getNumber(_curConfig >> "zoneSize");
        _enabledFarmInVeh =  getNumber(_curConfig >> "enabledFarmInVeh");
        _enabledFarmMiner = getNumber(_curConfig >> "enabledFarmMiner");
        _skill = getText(_curConfig >> "profName");
        _item = getText(_curConfig >> "mined");

	    {if ((player distance (getMarkerPos _x)) < _zoneSize) then {_zone = _x;}} forEach _resourceZones;
        if !(_zone isEqualTo "") exitWith {};

	};

    if (_zone isEqualTo "") exitWith {};
    (_skill call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl","_skillDisplayName"];

    systemChat format ["farm miner: | %1 %2 %3",_curLvl,_enabledFarmMiner,_skill];
    if ((_mod isEqualTo "miner") AND _curLvl < _enabledFarmMiner) throw format["Для того чтобы добывать автодобытчиком, Вам нужно достичь %1 уровень в умении «%2»",_enabledFarmMiner, _skillDisplayName];
    systemChat format ["farm vehicle: | %1 %2 %3",_curLvl,_enabledFarmInVeh,_skill];
    if ((_mod isEqualTo "vehicle") AND _curLvl < _enabledFarmInVeh) throw format["Для того чтобы добывать в инвентарь техники, Вам нужно достичь %1 уровень в умении «%2»",_enabledFarmInVeh, _skillDisplayName];

    switch (_mod) do {
        case ("hand"): {
            [_target,false] spawn RRPClient_farm_gather;
        };
        case ("miner"): {
            [_target,_skill,_item] spawn RRPClient_farm_minerAction;
        };
        case ("vehicle"): {
            [_target,true] spawn RRPClient_farm_gather;
        };
    };
} catch {
    ["WarningTitleAndText", ["Фарм!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
