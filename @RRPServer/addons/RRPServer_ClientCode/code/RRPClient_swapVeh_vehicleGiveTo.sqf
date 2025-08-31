#include "..\script_macros.hpp"

private ["_dialog","_list","_plist","_sel","_vehicle","_unit","_uid","_vid","_pid","_alph","_index"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
if ((_list lbData _sel) isEqualTo "") exitWith {["Вы не быбрали технику!"] call hints;};
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if !((_dbInfo select 0) isEqualTo (getPlayerUID player)) exitWith {
	["То что у вас есть ключи, еще не значит что имеете права ее передавать!"] call hints;
};

if ((lbCurSel 2702) isEqualTo -1) exitWith {["Игрок не выбран!"] call hints};
_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format ["%1", _unit];
if (isNull _unit || isNil "_unit") exitWith {};

private _price = ctrlText 2704;
private _alph = getText(missionConfigFile >> "LifeCfgSettings" >> "allowNumber");
private _index = [_price,_alph] call RRPClient_util_containsForbiddenCharacter;
if !(_index isEqualTo -1) exitWith {[(format ["Нельзя использовать '%1'!",_index])] call hints};
private _price = parseNumber(_price);

private _uid = getPlayerUID _unit;
private _name = _unit call getNickName;
private _vid = lbValue [2701,(lbCurSel 2701)]; 
if (_vid == 0) exitWith {["Извините, эта техника не может быть пока что передана, попробуйте позже"] call hints};

closeDialog 0;

[format ["Отправляем информацию о транзакции %1...",_name]] call hints;
[player,_vehicle,_price,_vid,(call life_donator),([getText(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "conditions")] call RRPClient_util_conditionsCheck)] remoteExec ["RRPClient_swapVeh_receiveVeh",_unit];
