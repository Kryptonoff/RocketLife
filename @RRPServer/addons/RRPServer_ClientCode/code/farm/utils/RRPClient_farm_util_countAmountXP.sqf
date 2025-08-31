params [
    ['_amountAddXP', -1, [0]],
    ['_curLvl',-1,[0]],
    ['_prof', "",[""]]
];

private ["_amountAddXP"];
private _amountAddXP = if (_curLvl <= 1) then {_amountAddXP} else {(_curLvl * _amountAddXP) * 1.45};
round(_amountAddXP)
