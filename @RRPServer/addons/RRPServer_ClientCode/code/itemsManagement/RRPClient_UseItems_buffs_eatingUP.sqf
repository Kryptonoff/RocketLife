/*
    Arrra (original)
    Discord: arrra#9745
    License:
    cc by-nc-nd
*/
private ['_foodType','_indicator','_icons'];
_foodType  = _this select 0;
_indicator = _this select 1;

_indicator = if (RRPClientDiarrhea) then {round(_indicator / 2)} else {_indicator};

switch (_foodType) do {
  case 'food'  : {
      RRPClientHunger = if (RRPClientHunger + _indicator > 100) then {100} else {RRPClientHunger + _indicator};
      _icons = 'food';

  };
  case 'drink' : {
      RRPClientThirst = if (RRPClientThirst + _indicator > 100) then {100} else {RRPClientThirst + _indicator};
      _icons = 'drink';
  };
  default {};
};

[_icons,'',(format [' %1%2',_indicator,'%']),true] spawn RRPClient_UseItems_buffs_instantCreateUI;
