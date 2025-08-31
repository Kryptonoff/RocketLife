/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _clanID = _this select 0;
private _code = _this select 1;
private _hash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
private _members = _hash call RRPClient_groups_getMembers;
if !(_members isEqualTo []) then
{
  {
    if !(isNull _x) then
    {
      [[],_code] remoteExecCall ["spawn",owner _x];
    };
  }
  forEach _members;
};
