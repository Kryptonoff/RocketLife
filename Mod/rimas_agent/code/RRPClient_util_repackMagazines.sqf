/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_container","_magazineClassName","_ammoToChange"]; 
private _ammoPerMagazine = getNumber(configFile >> "CfgMagazines" >> _magazineClassName >> "count");
private _equippedAmmo = 0;
private _equippedMagazines = magazinesAmmo _container;
if (_ammoPerMagazine > 1) then
{
	{
		if ((_x select 0) isEqualTo _magazineClassName) then
		{
			_equippedAmmo = _equippedAmmo + (_x select 1);
		};
	}
	forEach _equippedMagazines;
	_container removeMagazines _magazineClassName;
	_ammoToRefund = _equippedAmmo + _ammoToChange;
	while {_ammoToRefund > 0} do
	{
		_ammoToRefundThisRound = _ammoToRefund min _ammoPerMagazine;
		_container addMagazine [_magazineClassName, _ammoToRefundThisRound];
		_ammoToRefund = _ammoToRefund - _ammoToRefundThisRound;
	};
};
