/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_curItem','_CD','_difCD','_output'];

_curItem = _this select 0;
_CD      = _this select 1;
_output  = 0;

if ((count RRPClientBuffs_CD) > 0) then {
  {

    if ((_x select 0) isEqualto _curItem) Exitwith {
      _difCD = (time - (_x select 1));
      if (_difCD >= _CD) then {
        _output = -1;
        RRPClientBuffs_CD = RRPClientBuffs_CD - [[(_x select 0),(_x select 1)]];
      } else {
        _output = _difCD;
      };
    };
  } forEach RRPClientBuffs_CD;
};

if (_output isEqualto 0) then {
  RRPClientBuffs_CD pushBack  [_curItem,time];
};

_output
