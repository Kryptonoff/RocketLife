/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745

    arguments: Массив аналогичный systemTime
    Return
    future: true
    past: false
*/


private _return = true;
{
  if (_x > (_this select _forEachIndex)) exitWith {_return = false};
  if (_x < (_this select _forEachIndex)) exitWith {_return = true};
  if ((count _this) isEqualTo (_forEachIndex + 1)) exitWith {};
} forEach systemTime;

 _return
