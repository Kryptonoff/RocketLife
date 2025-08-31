/*

	Filename: 	RRPClient_system_WeaponDisassembled.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private["_unit","_primaryBag","_secondaryBag","_containers"];
_unit = param [0,ObjNull,[ObjNull]];
_primaryBag = param [1,ObjNull,[ObjNull]];
_secondaryBag = param [2,ObjNull,[ObjNull]];

if (!isNull _secondaryBag) then
{
	_containers = nearestObjects[_unit,["GroundWeaponHolder"],5];
	{deleteVehicle _x;} foreach _containers;
};



