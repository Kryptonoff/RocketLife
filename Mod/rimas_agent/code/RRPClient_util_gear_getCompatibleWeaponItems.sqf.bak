
private["_weaponClassName", "_weaponConfig", "_compatibleItems"];
_weaponClassName = _this;
_weaponConfig = configFile >> "CfgWeapons" >> _weaponClassName;
_compatibleItems = getArray (_weaponConfig >> "magazines");
{
	if (isClass (_weaponConfig >> "WeaponSlotsInfo" >> _x)) then
	{
		_compatibleItems append getArray (_weaponConfig >> "WeaponSlotsInfo" >> _x >> "compatibleItems");
	};
}
forEach ["CowsSlot", "PointerSlot", "MuzzleSlot", "UnderBarrelSlot"];
{
	if !(_x isEqualTo "this") then
	{
		_compatibleItems append getArray (_weaponConfig >> _x >> "magazines");
	};
}
forEach getArray (_weaponConfig >> "muzzles");
{
	_compatibleItems set [_forEachIndex, toLower _x];
}
forEach _compatibleItems;
_compatibleItems