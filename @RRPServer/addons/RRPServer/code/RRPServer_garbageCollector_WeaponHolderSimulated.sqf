/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_lifeTime", "_diedAt"];
_lifeTime = 5 * 60;
{
	_diedAt = _x getVariable ["LastCheck", -1];
	if (_diedAt isEqualTo -1) then 
	{
		_x setVariable ["LastCheck", time];
	}
	else 
	{
		if ((time - _diedAt) >= _lifeTime) then
		{
			deleteVehicle _x;
		};
	};
}
forEach (allMissionObjects "WeaponHolderSimulated");