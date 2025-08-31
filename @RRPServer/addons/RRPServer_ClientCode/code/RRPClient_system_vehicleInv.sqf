/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd

    Description:
      [vehicle,item,amount,mod] call RRPClient_system_vehicleInv;

      Parameters:
      vehicle  : OBJ
      item     : STRING - any VItems
      amount   : SCALAR
      mod      : BOOL   - add(true) or delete(false)
*/

params [
  ["_vehicle",objNull,[objNull]],
  ["_item","",[""]],
  ["_amount",-1,[1]],
  ["_mod",false,[false]]
];

private ["_weight","_weightUsed","_weightMax","_vehicleTrunk","_itemWeight","_newVehicletrunk","_isDublicate","_itemInTrunk","_amountInTrunk","_diff","_allItemsWeight","_curitemsWeight","_result"];
try {
  _result = false;
  if (_vehicle isEqualTo objNull) throw "Техника не определена!";
  if (_item isEqualTo "") throw "Виртуальный предмет не опрделен!";
  if (_amount < 1) throw "Logic error, param «AMOUNT» < 1";

  _itemWeight = getNumber(missionConfigFile >> 'VirtualItems' >> _item >> 'weight');

  _weight = [_vehicle] call RRPClient_system_vehicleWeight;
  _weightUsed = _weight select 1;
  _weightMax  = _weight select 0;
  if (((_weightUsed + (_itemWeight * _amount)) > _weightMax) and _mod) throw format ["Недостаточно %1 слотов в инвентаре",(_weightUsed + (_itemWeight * _amount)) - _weightMax];

  _newVehicletrunk = [];
  _vehicleTrunk = (_vehicle getVariable ["Trunk",[[],0]] )select 0;
  _isDublicate = false;
  if (_mod) then {
    if !(_vehicleTrunk isEqualTo []) then {
      {
        _itemInTrunk = _x select 0;
        _amountInTrunk = _x select 1;
        if (_itemInTrunk isEqualTo _item) Exitwith {
          (_amountInTrunk + _amount);
          _vehicleTrunk set [_forEachIndex,[_item,(_amountInTrunk + _amount)]];
          _isDublicate = true;
          _result = true;
        };
      } forEach _vehicleTrunk;
      if !(_isDublicate) then {_vehicleTrunk pushBack [_item,_amount]; _result = true};
      } else {
        _vehicleTrunk = [[_item,_amount]];
        _result = true;
      };
    } else {
    if !(_vehicleTrunk isEqualTo []) then {
        {
          _itemInTrunk = _x select 0;
          _amountInTrunk = _x select 1;
          if (_itemInTrunk isEqualTo _item) Exitwith {
            if (_amountInTrunk >= _amount) then {
              _diff = _amountInTrunk - _amount;
              if (_diff > 0) then {
                _vehicleTrunk set [_forEachIndex,[_item,_diff]];
                _result = true;
              } else {
                _vehicleTrunk = _vehicleTrunk - [_x];
                _result = true;
              };
            };
          };
        } forEach _vehicleTrunk;
      };
    };

  if (_result) then  {
      _allItemsWeight = 0;
      {
          _curitemsWeight = (getNumber(missionConfigFile >> 'VirtualItems' >> _item >> 'weight') * (_x select 1));
          _allItemsWeight = _allItemsWeight + _curitemsWeight;
      } forEach _vehicleTrunk;

      _newVehicletrunk = [_vehicleTrunk,_allItemsWeight];
      [_vehicle,"Trunk",_newVehicletrunk] call CBA_fnc_setVarNet;
  };

} catch {
  ["ErrorTitleAndText", ["Действие прервано!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};

_result
