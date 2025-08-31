private _items = getArray(missionConfigFile >> "LifeCfgFishing" >> "fish");
private _profName = getText(missionConfigFile >> "LifeCfgFishing" >> "prof");
private _dataProf = missionNamespace getVariable (_profName);
private _curlvl = _dataProf select 0;
_items = _items select {_curLvl >= (_x select 2)};

private _chance = random(100);
private _rewardsSel = _items findIf {_chance <= (_x select 1)};
if (_rewardsSel isEqualTo -1) exitWith {["Рыбалка", "Черт, сорвалась..."] call toastError};

private _reward = selectRandom ((_items select _rewardsSel) select 0);

if !([_reward] call RRPClient_inventory_addItemToInventory) exitWith {
	["Рыбалка", "Ваш инвентарь полон!"] call toastError
};

private _xpAmount = getNumber(missionConfigFile >> "LifeCfgFishing" >> "xpAmount");
[_profName, _xpAmount] call RRPClient_skills_addXP;
[10, "пойманную рыбу"] call addXP;
["Рыбалка", format["Вы поймали %1", _reward call RRPClient_inventory_getItemName]] call toastSuccess;