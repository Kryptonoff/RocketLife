/*

	Filename: 	client_anomaly_radiationProtect.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		https://empyrean.club

*/
#include "..\..\macros.hpp"
params ["_rProtectTerrain"];

if (LSNOTALIVE(player)) exitWith {0};
if (EQUAL(PUNIFORM,"admin_uniform")) exitWith {0};
//if (life_radx_used && {EQUAL(PUNIFORM,"Skyline_Character_U_CivilD_01_F")} && {EQUAL(PHEADGEAR,"Skyline_HeadGear_NBC_Hazmat_01_F")} && {EQUAL(PGOOGLES,"Skyline_Glasses_Masque_GP5_01_F")}) exitWith {0};
if (EQUAL(PUNIFORM,"Scientist_HazmatGreen")) then {_rProtectTerrain = _rProtectTerrain / 10};
if (PUNIFORM in life_anomalyUniform) then {_rProtectTerrain = _rProtectTerrain / 10};
if (EQUAL(PHEADGEAR,"Skyline_HeadGear_NBC_Hazmat_01_F")) then {_rProtectTerrain = _rProtectTerrain / 10};
if (PGOOGLES in life_anomalyGasMask) then {_rProtectTerrain = _rProtectTerrain / 10};
if (life_radx_used) then {_rProtectTerrain = _rProtectTerrain / 10};

//if !(EQUAL(PUNIFORM,"")) then {_rProtectTerrain = _rLevelTerrain / 2};
//if !(EQUAL(PHEADGEAR,"")) then {_rProtectTerrain = _rLevelTerrain / 2};
//if !(EQUAL(PGOOGLES,"")) then {_rProtectTerrain = _rLevelTerrain / 2};

_rProtectTerrain;
