/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_index"];
_index = SessionIDs find _this;
if !(_index isEqualTo -1) then
{
	SessionIDs deleteAt _index;
	missionNamespace setVariable [format["SessionPlayerObject%1", _this], nil];
};