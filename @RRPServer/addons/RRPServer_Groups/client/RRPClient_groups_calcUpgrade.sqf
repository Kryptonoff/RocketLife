/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _ret = 6600;
private _prices = (getArray(getMissionConfig "CfgGroups" >> "upgradePrices"));
reverse _prices;
{
	if !(((RRPClientGroupInfo getOrDefault ["slots",8]) < _x select 0)) exitWith 
	{
		_ret = _x select 1;
	};
}forEach _prices;

_ret
