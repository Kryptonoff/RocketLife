/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_clanID", "_hash", "_markers", "_members"];
_clanID = _this;
_hash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
_markers = _hash get "markers";
if!(count _hash isEqualTo 0)then
{
	_members = _hash call RRPClient_groups_getMembers;
	if(!(_members isEqualTo []))then
	{
		{
			if(!(isNull _x))then
			{
				[_x,"updateMarkers",[_markers]] call RRPServer_system_sendTo;
			};
		}
		forEach _members;
	};
};
true
