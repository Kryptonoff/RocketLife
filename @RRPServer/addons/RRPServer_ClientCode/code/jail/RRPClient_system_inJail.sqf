/*

*/
private ["_spawnPoint","_mode","_positionList"];

_mode = if (life_jail_time > 15) then {"spawnPosToJail"} else {"spawnPosToKPZ"};
_positionList = getArray(missionConfigFile >> "LifeCfgSettings" >> _mode);

{
	if (count(nearestObjects[_x,["CAManBase"],2]) == 0) exitWith {_spawnPoint = _x};
} foreach _positionList;
if (isNil "_spawnPoint") then {_spawnPoint = selectRandom _positionList};

["WarningTitleAndText", format["За ваши нарушения, Вас отправили в %1",if (life_jail_time <= 15) then {"Тюрьму"} else {"КПЗ"} ]] call SmartClient_gui_toaster_addTemplateToast;
player setPosATL _spawnPoint;
cutText ["Привет, арестант!","BLACK IN",5];
