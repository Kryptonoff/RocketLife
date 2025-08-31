/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND

	Note: 
		Function can be throwed
		input number of owner
*/

_owner = _this;
if (_owner in [0,-2,2]) throw "Owner не определен, попробуйте еще раз";
_uidInvited = missionNameSpace getVariable [format['UID_BY_OWNER_%1',_owner],""];
_uidInvited call RRPClient_util_objectFromPlayerUid
