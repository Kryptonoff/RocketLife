/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_hash", "_members", "_uids", "_uid"];
_hash = _this;
_members = [];
if(count _hash isEqualTo 0) exitWith {_members};

_uids = (_hash get "members") apply {_x select 0};

{
 _uid = getPlayerUID _x;
 if(_uid in _uids)then
 {
   _members pushBack _x;
 };
}forEach allPlayers;
_members
