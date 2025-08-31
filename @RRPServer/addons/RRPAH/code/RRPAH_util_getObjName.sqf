/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (alive _this) then 
{
	_n = name _this;
	_this setVariable ['RRPName',_n];
	_n
}else{
	_n = _this getVariable ['RRPName',''];
	if (_n isEqualTo '') then 
	{
		if !(getPlayerUID _this isEqualTo '') then 
		{
			_n = name _this;
			_this setVariable['RRPName',_n];
		};
	};
	_n
};
