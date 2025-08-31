/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    //[0.35,0.78,0.3,0.06]
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {["object is null!"] call hints};

if !(createDialog 'RRPDialogEmpty') exitWith {};
private _display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
true call RRPClient_gui_util_blur;
_display displayAddEventHandler ["unload","uiNamespace setVariable ['RRPDialogEmpty', displayNull]; false call RRPClient_gui_util_blur;"];
private _str = _display ctrlCreate ["RRP_RscStructuredText", 1001];
private _frame = _display ctrlCreate ["RscFrame", 1003];
{
  _x ctrlSetBackgroundColor [0.16, 0.16, 0.19,1];
  _x ctrlSetPosition [0.275001,0.18,0.450001,0.7];
  _x ctrlEnable false;
  _x ctrlCommit 0;
} forEach [_str,_frame];

  private _btn = _display ctrlCreate ["RRP_btn_yellow", 1004];
  _btn ctrlSetPosition [0.35,0.78,0.3,0.06];
  _btn ctrlCommit 0;
  _btn ctrlEnable true;
  _btn ctrlSetText (_vehicle getVariable ["dbInfo",[]] select 1) + " (click to copy)";
  _btn ctrlAddEventHandler ['ButtonClick',format ['"%1" call RRPClient_util_copyToClipboard;["SuccessTitleOnly",["Номер скопирован!"]] call SmartClient_gui_toaster_addTemplateToast; closeDialog 0',(_vehicle getVariable ["dbInfo",[]] select 1)]];

private ["_class","_price","_chance","_sellEnabled","_chopEnabled","_ownerArr","_owner","_vehInfo","_displayname","_maxSpeed","_hoursePower","_passSeats","_lockLVL","_renewalEnabled"];
_class = typeOf _vehicle;
_ownerArr = _vehicle getVariable ["vehicle_info_owners",[]] select 0;
_owner = if (_ownerArr isEqualTo []) then {"Взята в аренду!"} else {_ownerArr select 1};

_price = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _class >> "price");
_chance = getNumber(missionConfigFile >> "LifeCfgVehicles" >> _class >> "breakingChance");

_sellEnabled = ["Заблокировано","Доступно"] select ([getText(missionConfigFile >> "LifeCfgVehicles" >> _class >> "sellEnabled")] call RRPClient_util_conditionsCheck);
_chopEnabled = ["Заблокировано","Доступно"] select (([getText(missionConfigFile >> "LifeCfgVehicles" >> _class >> "chopEnabled")] call RRPClient_util_conditionsCheck) AND {(isNil {_vehicle getVariable "adacAntiBreaking"})});
_renewalEnabled = ["Заблокировано","Доступно"] select ([getText(missionConfigFile >> "LifeCfgVehicles" >> _class >> "conditions")] call RRPClient_util_conditionsCheck);
_lockLVL = if (_chance < 0) then {7} else {[_vehicle] call RRPClient_vehicle_countChanceBreakingLock select 2};

_vehInfo = [_class] call RRPClient_util_fetchVehInfo;
_displayname = _vehInfo # 3;
_maxSpeed = _vehInfo # 8;
_hoursePower = _vehInfo # 11;
_passSeats = _vehInfo # 10;

_str ctrlSetStructuredText parseText format ["
<br/>
<t align = 'center' font = 'RobotoCondensedBold' size = '1.5'>%1</t><br/><br/>
<t font='RobotoCondensedLight' >
Базовая стоимость: %3$<br/>
Защита от взлома: %4-й уровень<br/>
Перебивка: %5<br/>
Утилизация: %6<br/>
Переоформление: %7<br/>
Максимальная скорость: %8 км/ч<br/>
Лошадиных сил: %9<br/>
Пасс. мест: %10 шт<br/>
Пробег: %11 км<br/>
</t>",_displayname,_owner,_price,_lockLVL,_chopEnabled,_sellEnabled,_renewalEnabled,_maxSpeed,_hoursePower,_passSeats,_vehicle getVariable ["AllDistance",0]];
