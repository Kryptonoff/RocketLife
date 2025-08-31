/*
	Filename: 	RRPClient_admin_info.sqf
	Project: 	Rimas Altis Life RPG
*/
disableSerialization;
params ["_atmMoney","_cashMoney","_donatorLvl","_licenses","_unit"];
private _pvpText = if (_unit getVariable ["pvp",false]) then {"Да"} else {"Нет"};
private _playerLicenses = ((findDisplay 2900) displayCtrl 2904);
private _playerInfo = ((findDisplay 2900) displayCtrl 2903);

_playerInfo ctrlSetStructuredText parseText format["
Имя профиля: %1<br/>
ФИ: %8<br/>
Псевдоним: %9<br/>
Банк: %2<br/>
Наличность: %3<br/>
Уровень доната: %4<br/>
PVP режим: %5<br/>
UID: %6<br/>
Отдача: %7<br/>",
	name _unit,
	[_atmMoney] call RRPClient_util_numberText,
	[_cashMoney] call RRPClient_util_numberText,
	_donatorLvl,
	_pvpText,
	getPlayerUID _unit,
	unitRecoilCoefficient _unit,
	_unit call getFullName,
	_unit call getNickName
];

lbClear _playerLicenses;
{
	if (missionNamespace getVariable ["license_" + (getText(missionConfigFile >> "LifeCfgLicenses" >> _x >> "variable")),false]) then {
			_playerLicenses lbAdd ((getText(missionConfigFile >> "LifeCfgLicenses" >> _x >> "displayName")));
	}
} foreach _licenses;
