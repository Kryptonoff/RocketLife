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
*/
private ["_isDublicate","_newTrunk","_weightCuritem","_vehItems","_deletedItems","_finalItem","_amountFinalItem","_delete","_newVehTrunk","_curItemForDelete","_amountForDelete","_curItemInCar","_amountInCar","_amount","_vehInvWeight"];
_vehItems         = _this select 0;
_deletedItems     = _this select 1;
_finalItem        = _this select 2;
_amountFinalItem  = _this select 3;

_isDublicate = false;

_newVehTrunk = [];
{
  _delete = false;
  _curItemInCar = _x select 0;
  _amountInCar  = _x select 1;

  {
    _curItemForDelete = _x select 0;
    _amountForDelete = _x select 1;
    if (_curItemInCar isEqualTo _curItemForDelete) exitWith {_delete = true};
  } forEach _deletedItems;

  if (_delete) then {
    _amount = _amountInCar - _amountForDelete;
    if (_amount > 0) then {
      _newVehTrunk pushBack [_curItemForDelete,_amount];
      };
  } else {
    _newVehTrunk pushBack [_curItemInCar,_amountInCar];
  };

} forEach _vehItems;

{
 if (_finalItem isEqualTo (_x select 0)) exitWith {
   _amountFinalItem = _amountFinalItem + (_x select 1);
   _newVehTrunk set [_forEachIndex,[_finalItem,_amountFinalItem]];
   _isDublicate = true;
 };
} forEach _newVehTrunk;

if !(_isDublicate) then {
  _newVehTrunk pushBack [_finalItem,_amountFinalItem];
};


_vehInvWeight = 0;
{
 _weightCuritem = ((_x select 1) * (getNumber(missionConfigFile >> 'VirtualItems' >> ( _x select 0) >> 'weight')));
 _vehInvWeight = _vehInvWeight + _weightCuritem;
} forEach _newVehTrunk;
_newTrunk = [_newVehTrunk,_vehInvWeight];

_newTrunk
