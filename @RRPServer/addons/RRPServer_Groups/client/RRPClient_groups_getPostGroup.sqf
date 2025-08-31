/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND

  Возвращает (SCALAR) должность в организации.
    1 - лидер
    2 - замы
    3 - хуесос
*/

private _leaderUID = RRPClientGroupInfo get "leader";
private _deputys = RRPClientGroupInfo get "deputys";
private _return = call {
  if (_this isEqualTo _leaderUID) exitWith {1};
  if (_this in _deputys) exitWith {2};
  3
};
_return
