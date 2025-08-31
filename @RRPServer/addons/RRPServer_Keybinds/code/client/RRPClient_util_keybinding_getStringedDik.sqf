
private["_dikKey","_key"];
_dikKey = _this;
_key = "";
{
	if (str(_dikKey) isEqualTo (_x select 0)) exitWith
	{
		_key = _x select 1;
	};
}
forEach RRPClientStringedDiks;
_key