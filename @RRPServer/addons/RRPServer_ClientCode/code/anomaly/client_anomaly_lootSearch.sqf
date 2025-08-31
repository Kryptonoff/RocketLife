/*

    Filename: 	client_anomaly_lootSearch.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\..\macros.hpp"
params [
    "_pos",
	"_radius",
	["_filterList",
	    ["Land_u_Shop_01_V1_F","Land_d_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_d_Shop_02_V1_F","Land_i_Stone_Shed_V3_F","Land_i_Stone_Shed_V2_F","Land_i_Stone_Shed_V1_F","Land_d_Stone_Shed_V1_F","Land_u_House_Small_01_V1_F","Land_d_House_Small_01_V1_F","Land_u_House_Small_02_V1_F","Land_d_House_Small_02_V1_F","Land_u_House_Big_01_V1_F","Land_d_House_Big_01_V1_F","Land_u_House_Big_02_V1_F","Land_d_House_Big_02_V1_F","Land_i_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V3_F","Land_d_Stone_HouseBig_V1_F","Land_i_Addon_03_V1_F","Land_u_Addon_01_V1_F","Land_u_Addon_02_V1_F","Land_d_Addon_02_V1_F","Land_d_Stone_HouseSmall_V1_F","Land_Metal_Shed_F","Land_Slum_House01_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_LightHouse_F","Land_Chapel_V1_F","Land_Chapel_Small_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_cargo_house_slum_F","Land_Research_house_V1_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_MedicalTent_01_white_generic_inner_F"],
		[[]]
	]
];

private _return = (nearestObjects [
	_pos,
	_filterList,
	_radius
] select {
    isNil {_x getVariable "house_owner"} &&
	{(_x getVariable ["house_cooldown", serverTime]) <= serverTime} &&
    {!(isObjectHidden _x)} &&
	{_x inArea life_anomalyZone}
});


if (anomalyDebug) then {diag_log format["Anomaly:Loot house count %1",count _return]};

_return;
