/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd

    Syntax:
    [maxLVL,currentLVL,defaultTime] call RRPClient_util_countSavingTime;

*/
params [
['_maxLVL', -1, [0]],
['_curlvl', -1, [0]],
['_DefaultTime', -1, [0]]
];

private ['_timepersent','_dividerForOneLVL','_time'];
if !(_curlvl isEqualto 0) then {
  if ((_maxLVL isEqualto -1) or {(_curlvl isEqualto -1)} or {(_DefaultTime isEqualto -1)}) exitWith
  {
    ['Ошибка в расчете времени, Если вы это видите, сообщите админу!!!',"error"] call hints;
  };
  _timepersent      = _DefaultTime/100;
  _dividerForOneLVL = 80/_maxLVL;
  _time             = _DefaultTime - ((_timepersent * _dividerForOneLVL)) * _curlvl;
} else {_time = _DefaultTime};
_time = _time * 1;

_time
