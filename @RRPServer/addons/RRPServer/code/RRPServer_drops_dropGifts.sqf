/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_giftList","_data"];
rppvariable_giftmap = [];
_giftList = ("getGiftsList" call RRPServer_DB_selectFull) call BIS_fnc_arrayShuffle;
"Loading gift list..." call RRPServer_util_debugConsole;
_data = call RRPServer_drops_posList;

"Total positions" + str(count _data) call RRPServer_util_debugConsole;
"In ignors list positions" + str(count (profileNamespace getVariable ["pnsvar_gifts_drop_ignore_pos",[]])) call RRPServer_util_debugConsole;

{_data deleteAt _x} forEach (profileNamespace getVariable ["pnsvar_gifts_drop_ignore_pos",[]]);
"Active positions" + str(count _data) call RRPServer_util_debugConsole;

private ["_indexPosition","_createdGift","_id","_pos"];
{
  _id = _x select 0;
  _indexPosition = round (random ((count _data) - 1));
  _pos = _data select _indexPosition;
  _createdGift = "RRP_Gift" createVehicle (ASLToAGL(_pos # 0));
  _createdGift setVectorDirAndUp (_pos # 1);
  _createdGift setPosASL (_pos # 0);
  _createdGift enableSimulationGlobal true;
  _createdGift setVariable ["rrpobj_gift_infolist",[_id,_indexPosition], true];
  
  rppvariable_giftmap pushBack _createdGift;
  _data deleteAt _indexPosition;
} forEach _giftList;

publicVariable "rppvariable_giftmap";

format ["Loaded %1 gifts", count rppvariable_giftmap] call RRPServer_util_debugConsole;
