/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

private _path = "\RRPHC_Mutants\";

life_mutants = [];
mutantsForms = ["Dog_01","Dog_02","Dog_03","Dog_04","Burer_Rimas","O_G_Soldier_LAT2_F","boar_old_testu","Chimera_Rimas","Flesh_Ex_Mutant_01","Flesh_Ex_Mutant_02","Controller_Ex_Mutant_01","BS_Ex_Mutant_01","BSI_Ex_Mutant_01","Snork_Ex_Mutant_01","Zombie_Ex_Mutant_01","Zombie_Ex_Mutant_02","Zombie_Ex_Mutant_03","Zombie_Ex_Mutant_04","Zombie_Ex_Mutant_05","Zombie_Ex_Mutant_06","Zombie_Ex_Mutant_07","Zombie_Ex_Mutant_08","Zombie_Ex_Mutant_09","Zombie_Ex_Mutant_10","Pseudo_Rimas"];
sr_mutants_types = ["Dog_02","Burer_Rimas","O_G_Soldier_LAT2_F","Pseudo_Rimas","boar_old_testu","Chimera_Rimas","Flesh_Ex_Mutant_01","Controller_Ex_Mutant_01","BS_Ex_Mutant_01","BSI_Ex_Mutant_01","Snork_Ex_Mutant_01","Zombie_Ex_Mutant_01"];
sr_mutants_catchAnims = ["KROVOSOS_catch_start_victim", "KROVOSOS_catch_loop_victim", "KROVOSOS_catch_end_suck_victim", "KROVOSOS_catch_end_victim", "plagued_armed_melee_noWeapon_catch_victim", "plagued_armed_melee_noWeapon_catch_victim_behind", "Psina_victim_in", "Psina_victim_out", "Psina_victim_out_killPes", "Psina_victim_loop"];

//-- HC
[

	// system
	["RRPHC_mut_AggresiveSound","code\"],
	["RRPHC_mut_cleaner","code\"],
	["RRPHC_mut_findNewPos","code\"],
	["RRPHC_mut_inHouse","code\"],
	["RRPHC_mut_initZombie","code\"],
	["RRPHC_mut_initBloodsucker","code\"],
	["RRPHC_mut_initBurer","code\"],
	["RRPHC_mut_initChimera","code\"],
	["RRPHC_mut_initController","code\"],
	["RRPHC_mut_initDog","code\"],
	["RRPHC_mut_initGiant","code\"],
	["RRPHC_mut_initSnork","code\"],
	["RRPHC_mut_player_hitAnims","code\"],
	["RRPHC_mut_playSound","code\"],
	["RRPHC_mut_spawnerGlobal","code\"],
	["RRPHC_system_objectClean","code\"],

	// bloodsucker
	["RRPHC_mut_bloodsucker_attack","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_attackCatch","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_chooseMove","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_handlers","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_hitProcess","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_idle","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_pathFind","code\Bloodsucker\"],
	["RRPHC_mut_bloodsucker_soundDeath","code\Bloodsucker\"],

	// burer
	["RRPHC_mut_burrer_attack","code\Burer\"],
	["RRPHC_mut_burrer_chooseMove","code\Burer\"],
	["RRPHC_mut_burrer_handlers","code\Burer\"],
	["RRPHC_mut_burrer_hitProcess","code\Burer\"],
	["RRPHC_mut_burrer_idle","code\Burer\"],
	["RRPHC_mut_burrer_pathFind","code\Burer\"],
	["RRPHC_mut_burrer_soundDeath","code\Burer\"],

	// chimera
	["RRPHC_mut_chimera_attack","code\Chimera\"],
	["RRPHC_mut_chimera_chooseMove","code\Chimera\"],
	["RRPHC_mut_chimera_death","code\Chimera\"],
	["RRPHC_mut_chimera_handlers","code\Chimera\"],
	["RRPHC_mut_chimera_hitProcess","code\Chimera\"],
	["RRPHC_mut_chimera_idle","code\Chimera\"],
	["RRPHC_mut_chimera_pathfind","code\Chimera\"],

	// controller
	["RRPHC_mut_controller_attack","code\Controller\"],
	["RRPHC_mut_controller_chooseMove","code\Controller\"],
	["RRPHC_mut_controller_handlers","code\Controller\"],
	["RRPHC_mut_controller_idle","code\Controller\"],
	["RRPHC_mut_controller_pathFind","code\Controller\"],
	["RRPHC_mut_controller_soundDeath","code\Controller\"],

	// dog
	["RRPHC_mut_dog_attack","code\Dog\"],
	["RRPHC_mut_dog_attackCatch","code\Dog\"],
	["RRPHC_mut_dog_handlers","code\Dog\"],
	["RRPHC_mut_dog_hitProcess","code\Dog\"],
	["RRPHC_mut_dog_idle_puppet","code\Dog\"],
	["RRPHC_mut_dog_idle","code\Dog\"],
	["RRPHC_mut_dog_pathFind","code\Dog\"],
	["RRPHC_mut_dog_soundDeath","code\Dog\"],

	// giant
	["RRPHC_mut_giant_attack","code\Giant\"],
	["RRPHC_mut_giant_chooseMove","code\Giant\"],
	["RRPHC_mut_giant_handlers","code\Giant\"],
	["RRPHC_mut_giant_hitProcess","code\Giant\"],
	["RRPHC_mut_giant_idle","code\Giant\"],
	["RRPHC_mut_giant_pathFind","code\Giant\"],
	["RRPHC_mut_giant_soundDeath","code\Giant\"],

	// snork
	["RRPHC_mut_snork_attack","code\Snork\"],
	["RRPHC_mut_snork_chooseMove","code\Snork\"],
	["RRPHC_mut_snork_handlers","code\Snork\"],
	["RRPHC_mut_snork_hitProcess","code\Snork\"],
	["RRPHC_mut_snork_idle","code\Snork\"],
	["RRPHC_mut_snork_pathFind","code\Snork\"],
	["RRPHC_mut_snork_soundDeath","code\Snork\"],

	// zombie
	["RRPHC_mut_zombie_attack","code\Zombie\"],
	["RRPHC_mut_zombie_attackCatch","code\Zombie\"],
	["RRPHC_mut_zombie_chooseMove","code\Zombie\"],
	["RRPHC_mut_zombie_handlers","code\Zombie\"],
	["RRPHC_mut_zombie_hitProcess","code\Zombie\"],
	["RRPHC_mut_zombie_idle","code\Zombie\"],
	["RRPHC_mut_zombie_pathFind","code\Zombie\"],
	["RRPHC_mut_zombie_soundDeath","code\Zombie\"]


]apply{
	_x params ["_function","_pathS"];
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + _pathS + "%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + _pathS + "%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

true
