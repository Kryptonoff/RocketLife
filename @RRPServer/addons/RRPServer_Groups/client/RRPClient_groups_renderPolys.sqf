/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
private["_control"];
_control = _this select 0;
if!(RRPClientGroupInfo isEqualTo [])then
{
	{
		_control drawPolygon [_x select 0,_x select 1];
	}
	forEach (RRPClientGroupInfo get "polys");
};
