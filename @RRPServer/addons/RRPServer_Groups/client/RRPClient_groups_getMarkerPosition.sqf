/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_position", "_radius", "_type", "_index"];
_position = _this select 0;
_radius = _this select 1;
_type = "";
_index = -1;
try
{
	{
		if(((_x select 2) distance2D _position) < _radius)then
		{
			throw ["Marker",_forEachIndex];
		};
	}
	forEach (RRPClientGroupInfo get "markers");
	if(count _position < 3)then
	{
		_position pushback 0;
	};
	{
		if(_position inPolygon (_x select 0))then
		{
			throw ["Polygon",_forEachIndex];
		};
	}
	forEach (RRPClientGroupInfo get "polys");
}
catch
{
	_type = _exception select 0;
	_index = _exception select 1;
};
[_type,_index]
