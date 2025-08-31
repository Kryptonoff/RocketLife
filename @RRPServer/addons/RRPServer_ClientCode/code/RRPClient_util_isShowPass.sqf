private ["_id","_ret"];
_id = life_ids findIf {(_x # 0) isEqualTo (getPlayerUID _this)};
_ret = if (_id > -1) then {true} else {false};

_ret
