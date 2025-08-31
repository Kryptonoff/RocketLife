/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
params [
	["_class","",[""]],
	["_startPrice",0,[0]],
	["_blitzPrice",0,[0]],
	["_step",0,[0]],
	["_desc","",[""]],
	["_mod","real",[""]],
  ["_position",[],[[]]]
];
_startPrice  = (_startPrice call BIS_fnc_numberText);
_blitzPrice  = (_blitzPrice call BIS_fnc_numberText);
_step  = (_step call BIS_fnc_numberText);

if !(isNil "curVehicle") then {
    if !((typeOf curVehicle) isEqualTo _class) then {
      deleteVehicle curVehicle;
      curVehicle = nil;
    };
};
uiSleep 2;
private ["_text","_pos","_index","_title","_vehinfo","_maxSpeed","_hourseP","_armor","_displayName"];
if ((isnil "curVehicle") AND !(_class isEqualTo "") ) then {
  if (_position isEqualTo []) then {
      _pos = (getMarkerPos "auction_spawn");
      _pos set [2,((_pos select 2) + 2.5)];
  } else {
      _pos = _position;
      _pos set [2,((_pos select 2) + 2.5)];
  };
  curVehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
  curVehicle allowDamage false;
  curVehicle setVariable ["vehicle_info_owners",[(player call getNickName),(getPlayerUID player)],true];
  curVehicle setVariable ["dbInfo",[(getPlayerUID player),"АУКЦИОННАЯ ТЕХНИКА!"],true];
};

if (_mod isEqualTo "real") then {
  _index = " RUB";
  _title = "Торги за реал";
} else {
  _index = " $";
  _title = "Торги за виртуал (Алтийские)";
};

_vehinfo = [_class] call RRPClient_util_fetchVehInfo;
_displayName = _vehinfo select 3;
_maxSpeed = _vehinfo select 8;
_hourseP = _vehinfo select 11;
_armor = _vehinfo select 9;

_text = format["<t font = 'gtav' size = '2' color = #ffffff align = 'center' >%1</t>
<br/>%5<br/>%7<br/>
<t font = 'RobotoCondensedBold' align = 'center' size = '1.2' >Стартовая цена: %2%6<br/>Блиц цена: %3%6<br/>Шаг: %4%6</t>
<br/>%5<br/>Характеристики<br/>
<t font = 'RobotoCondensedBold' align = 'center' size = '1.2' >Максимальная скорость: %8<br/>Мощность: %9ЛС<br/>Броня: %10</t>
<br/>%5<br/>Прочее<br/>
<t font = 'RobotoCondensedLight' align = 'center' size = '1.2'  >%11</t>",
_displayName,_startPrice,_blitzPrice,_step,"________________________________",_index,_title,_maxSpeed,_hourseP,_armor,_desc];
{
  [1,_text] remoteExecCall ["RRPClient_system_broadcast",_x];
} forEach (nearestObjects [player, ["Man"], 150]);
