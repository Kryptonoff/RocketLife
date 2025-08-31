/*
	Project: Rimas Role Play
	Author: ???
	License: CC BY-ND
*/

params ["_vehicle", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
if (([_vehicle] call RRPClient_WarZone_util_getZoneInside) isEqualTo [] && {!(_vehicle call RRPClient_util_isInStratis)}) then
{
	private _classname = typeOf _vehicle;
	if !(_classname in (getArray(missionConfigFile >> "LifeCfgSettings" >> "vehicleHandleDamageIgnorList")) OR {_classname isKindOf "Wheeled_APC_F"}) then
	{
		if (
			!(_hitPoint isEqualTo "") AND 
			{((_hitPoint isEqualTo "hithull") OR {(_hitPoint isEqualTo "hitbody")})} AND 
			{_damage >= 0.8}
		) then {
			_damage = 0.8;
		};
		if (!(_vehicle getVariable ["isDestroy", false])) then
		{
			if ([_vehicle] call RRPClient_system_CheckVehPartsFE) then
			{
				if (!(_vehicle getVariable ["isDestroy", false])) then
				{
					_vehicle setVariable ["isDestroy", true, true];
				};
			};
		};
	};
};

if ((_projectile isEqualTo "RRPAmmo_empCharge")) then
{
	if (_vehicle isKindOf "Air") then {_vehicle setFuel 0.05};
	_damage = damage _vehicle;
};
/* 
if (!isServer AND
		{!(isNull _instigator)} AND
		{_damage > 0} AND
		{!(_hitPoint isEqualTo "")} AND
		{((speed _vehicle) > 0 OR {(typeOf _vehicle) isKindOf "Helicopter"})}
	) then
{
	[format ["%1 damaget (%2:%3) with a %4 hitPoint: %5", (getPlayerUID _instigator),(typeOf _vehicle),(getPlayerUID player),_projectile,_hitPoint],"handleDamageVehicle"] remoteExecCall ["RRPServer_system_logIt",2];
};
 */
_damage
