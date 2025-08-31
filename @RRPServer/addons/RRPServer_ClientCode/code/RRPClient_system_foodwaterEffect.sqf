/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd

  _RunRateThirst = 0.125; //у 3 раза быстрее, воды расходуется при спринте
  _RunRateHunger = 0.1; //у 2.4 раза быстрее, еды расходуется при спринте

  Client\Rimas.Altis\code\RRPClient_system_foodwaterEffect.sqf
*/
private ['_chance','_coef','_fnc_DrugEffect','_fnc_DiareaEffect','_RunRateThirst','_RunRateHunger','_hungerCoefDefault','_thirstCoefDefault','_fnc_FoodESubtract','_hungerCoef','_thirstCoef','_fnc_WaterAndFooDEffect','_speedCoef','_fnc_WaterSubtract'];
 _RunRateThirst = 0.125;
 _RunRateHunger = 0.1;
 _hungerCoefDefault = 0.08;
 _thirstCoefDefault = 0.08;

if (["ImprovedMetabolism"] call perk) then {
  _hungerCoefDefault = _hungerCoefDefault - (_hungerCoefDefault * 0.2);
};
if (["ImprovedGydration"] call perk) then {
  _thirstCoefDefault = _thirstCoefDefault - (_thirstCoefDefault * 0.2);
};

 _RunRateThirst = ["foodWaterEffect", _RunRateThirst] call RRPClient_system_VIP;
 _RunRateHunger = ["foodWaterEffect", _RunRateHunger] call RRPClient_system_VIP;

 _fnc_WaterAndFooDEffect = {
  _coef = if ((RRPClientHunger  < 40 and RRPClientHunger  > 30) or (RRPClientThirst  < 40 and RRPClientThirst  > 30)) then {RRPClientBuffs_SprintCoef * 0.95} else {RRPClientBuffs_SprintCoef};
  _coef = if ((RRPClientHunger  < 30 and RRPClientHunger  > 20) or (RRPClientThirst  < 30 and RRPClientThirst  > 20)) then {RRPClientBuffs_SprintCoef * 0.90} else {RRPClientBuffs_SprintCoef};
  _coef = if ((RRPClientHunger  < 20 and RRPClientHunger  > 5) or (RRPClientThirst  < 20 and RRPClientThirst  > 5)) then {RRPClientBuffs_SprintCoef * 0.75} else {RRPClientBuffs_SprintCoef};
  _coef = if ((RRPClientHunger  < 5) or (RRPClientHunger  < 5)) then {RRPClientBuffs_SprintCoef * 0.65} else {RRPClientBuffs_SprintCoef};

	if (RRPClientHunger < 20) then {player say3D "hunger"};
	if (RRPClientThirst < 20) then {player say3D "thirst"};

  if !((getAnimSpeedCoef player) isEqualTo _coef) then {
    player setAnimSpeedCoef _coef;
    player setFatigue 1;
  };
};

_fnc_FoodESubtract = {
	if (RRPClientHunger  < 10) then {player setFatigue 1};
  _speedCoef  = round(speed player * _RunRateHunger);
	_speedCoef  = if (_speedCoef < 1) then {1} else {_speedCoef};
  _hungerCoef = if (vehicle player isEqualto player) then {abs(_hungerCoefDefault * _speedCoef)} else {_hungerCoefDefault};
  RRPClientHunger  = RRPClientHunger  - _hungerCoef;
  if (RRPClientHunger  < 0) then {RRPClientHunger  = 0};
	_hungerCoef = _thirstCoefDefault;
};

_fnc_WaterSubtract = {
  if (RRPClientThirst  < 10) then {player setFatigue 1};
	_speedCoef  = round(speed player * _RunRateThirst);
	_speedCoef  = if (_speedCoef < 1) then {1} else {_speedCoef};
	_thirstCoef = if (vehicle player isEqualto player) then {abs(_thirstCoefDefault * _speedCoef)} else {_thirstCoefDefault};
  RRPClientThirst = RRPClientThirst  - _thirstCoef;
  if (RRPClientThirst  < 0) then {RRPClientThirst  = 0};
  _thirstCoef = _thirstCoefDefault;
};

_fnc_DiareaEffect = {
    _chance = floor random 100;
    if (_chance >= 95) then {
      // [] spawn RRPClient_funny_shit;
    };
    if (_chance >= 70) then {
      player say3D "WoundedGuyA_07";
    };

};

_fnc_DrugEffect = {

};


while {true} do
{
    if (player getVariable ['RRPVariablePartyMeatActive',false]) then {continue};
	uiSleep 2.5;
	[] call _fnc_WaterSubtract;
	uiSleep 2.5;
	[] call _fnc_FoodESubtract;
  [] call _fnc_WaterAndFooDEffect;

  if (RRPClientDiarrhea) then {
      [] call _fnc_DiareaEffect;
  };
  if (RRPClientNarcomania > 0) then {
      [] call _fnc_DrugEffect;
  };
};
