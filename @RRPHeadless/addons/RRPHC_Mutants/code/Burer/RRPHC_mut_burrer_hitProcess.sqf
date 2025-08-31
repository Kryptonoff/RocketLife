
_unit = _this select 0;
_creature = _this select 1;


_controllerUnnarmed_HeadSoundsAndCheck = {
	_unit = _this select 0;
	_creature = _this select 1;
	_secondsToWait = 0;
	_soundCache = "Land_HelipadEmpty_F" createVehicle position _unit;
	_soundCache attachTo [_unit, [0, 0.5, 0]];
	while {(_secondsToWait < 15)} do {
		if ((alive _unit) AND {((alive _creature) AND (!(isNil {_unit getVariable "IsControlledBy"}) AND ((animationState _unit == "Controller_human_unnarmed_anim_loop"))))}) then {
			_secondsToWait = _secondsToWait + 1;
			sleep 0.65;
			if (headgear _unit == "") then {
				_rndSound = selectRandom ["head_beat_1", "head_beat_2"];
				[_soundCache, _rndSound, 30] call CBA_fnc_globalSay3d;
			} else {
				_helmProtection = (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") call BIS_fnc_GetCfgData;
				if ((_helmProtection >= 2)) then {
					_rndSound = selectRandom["head_beat_helm_1", "head_beat_helm_2"];
					[_soundCache, _rndSound, 30] call CBA_fnc_globalSay3d;
				} else {
					_rndSound = selectRandom["head_beat_1", "head_beat_2"];
					[_soundCache, _rndSound, 30] call CBA_fnc_globalSay3d;
				};
			};

			sleep 1;
		} else {
			_secondsToWait = 15;
			_unit forceWalk false;
			if (alive _unit) then {
				_unit setUnconscious true;
				sleep 1;
				_unit setUnconscious false;
				sleep 1;
				_unit setVariable["IsControlledBy", nil, true];
				titleCut["", "WHITE IN", 0.5];
				ppEffectDestroy PP_radial;
				ppEffectDestroy PP_chrom;
				ppEffectDestroy PP_wetD;
				ppEffectDestroy PP_film;
			};
		};
	};
	sleep 5;
	deleteVehicle _soundCache;
};


_ifInter = lineIntersectsSurfaces[eyePos _unit, eyePos _creature, _unit, _creature, true, 1, "GEOM", "FIRE"];
if ((isNil {_unit getVariable "IsControlledBy"}) AND {((_unit distance _creature) <= 100)} AND {(count _ifInter == 0)}) then {
	if (isPlayer _unit) then {
		if (player == _unit) then {
			[_unit, _creature] spawn RRPHC_mut_controller_camera;
			_unit setVariable["IsControlledBy", 1, true];
			playSound "controller_hit_first";
			sleep 1.95;
			playSound "controller_hit_last";
			playSound "player_under_contoll";
			playSound "controller_tube_prepare";
			_unit say2D selectRandom["player_pre_shot_1", "player_pre_shot_2"];
			if ((currentWeapon _unit == primaryWeapon _unit) AND (!(currentWeapon _unit == "") AND ((isNil {_unit getVariable "IsControlled_ToUnnarmed"})))) then {
				_unit forceWalk true;
				_rndChance = random 100;
				[_unit, "Controlled_idle_w"] remoteExec ["switchMove",-2];
				_unit action ["SwitchWeapon", _unit, _unit, 100];
				if (_rndChance >= 30) then {
					[_unit, "Controller_human_rifle_hit"] remoteExec ["playActionNow",-2];
					sleep 3.9;
					_unit selectWeapon primaryWeapon _unit;
					[_unit, "AmovPercMstpSrasWrflDnon"] remoteExec ["switchMove",-2];
					_ifInter = lineIntersectsSurfaces[eyePos _unit, eyePos _creature, _unit, _creature, true, 1, "GEOM", "FIRE"];
					_count = _unit ammo primaryWeapon _unit;
					if (((alive _creature) AND ((_count > 0)))) then {
					   if (count _ifInter == 0) then {
						_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
						[_unit,0.15] remoteExecCall ["RRPClient_mut_setDamage",_unit];
						playSound["combat_deafness", true];
						playSound "combat_deafness";
						_unit say2D selectRandom["player_after_shot_1", "player_after_shot_2"];
						_unit say2D "player_scared_breathe";
						titleCut["", "WHITE IN", 2];
						addCamShake[4, 20, 2];
						_unit setCustomAimCoef 20;
						sleep 5;
						_unit forceWalk false;
						sleep 5;
						_unit setCustomAimCoef 10;
						sleep 6;
						_unit setVariable["IsControlledBy", nil, true];
						titleCut["", "WHITE IN", 0.5];
						ppEffectDestroy PP_radial;
						ppEffectDestroy PP_chrom;
						ppEffectDestroy PP_wetD;
						ppEffectDestroy PP_film;
						_unit setCustomAimCoef 1;
						} else {
						_unit forceWalk false;
						_unit setVariable["IsControlledBy", nil, true];
						titleCut["", "WHITE IN", 0.5];
						ppEffectDestroy PP_radial;
						ppEffectDestroy PP_chrom;
						ppEffectDestroy PP_wetD;
						ppEffectDestroy PP_film;
						_unit setCustomAimCoef 1;
						[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
					   };
					} else {
						_unit forceWalk false;
						_unit setVariable["IsControlledBy", nil, true];
						_unit setVariable["IsControlled_ToUnnarmed", 0, true];
						titleCut["", "WHITE IN", 0.5];
						ppEffectDestroy PP_radial;
						ppEffectDestroy PP_chrom;
						ppEffectDestroy PP_wetD;
						ppEffectDestroy PP_film;
						_unit setCustomAimCoef 1;
						[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
					};
				} else {
					_unit say2D selectRandom["player_after_shot_1", "player_after_shot_2"];
					[_unit, "Controller_human_rifle_kill"] remoteExec ["playActionNow",-2];
					sleep 3.8;
					_unit selectWeapon primaryWeapon _unit;
					[_unit, "AmovPercMstpSrasWrflDnon"] remoteExec ["switchMove",-2];
					_ifInter = lineIntersectsSurfaces[eyePos _unit, eyePos _creature, _unit, _creature, true, 1, "GEOM", "FIRE"];
					_count = _unit ammo primaryWeapon _unit;
					if (((alive _creature) AND ((_count > 0)))) then {
					    if ((count _ifInter == 0)) then {
						_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
						sleep 0.1;
						_unit setVariable["IsControlledBy", nil, true];
						titleCut["", "WHITE IN", 0.5];
						ppEffectDestroy PP_radial;
						ppEffectDestroy PP_chrom;
						ppEffectDestroy PP_wetD;
						ppEffectDestroy PP_film;
						_unit setDamage 1;
						} else {
						_unit forceWalk false;
						_unit setVariable["IsControlledBy", nil, true];
						titleCut["", "WHITE IN", 0.5];
						ppEffectDestroy PP_radial;
						ppEffectDestroy PP_chrom;
						ppEffectDestroy PP_wetD;
						ppEffectDestroy PP_film;
						_unit setCustomAimCoef 1;
						[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
					   };
					} else {
						_unit forceWalk false;
						_unit setVariable["IsControlledBy", nil, true];
						_unit setVariable["IsControlled_ToUnnarmed", 0, true];
						titleCut["", "WHITE IN", 0.5];
						ppEffectDestroy PP_radial;
						ppEffectDestroy PP_chrom;
						ppEffectDestroy PP_wetD;
						ppEffectDestroy PP_film;
						_unit setCustomAimCoef 1;
						[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
					};
				};
			} else {
				if ((currentWeapon _unit == handgunWeapon _unit) AND (!(currentWeapon _unit == "") AND ((isNil {_unit getVariable "IsControlled_ToUnnarmed"})))) then {
					_unit forceWalk true;
					[_unit, "Controlled_idle_p"] remoteExec ["switchMove",-2];
					_unit action ["SwitchWeapon", _unit, _unit, 100];
					_rndChance = random 100;
					if (_rndChance >= 30) then {
						[_unit, "Controller_human_pistol_hit"] remoteExec ["playActionNow",-2];
						sleep 2.8;
						_unit say2D selectRandom["player_after_shot_1", "player_after_shot_2"];
						_unit say2D "player_scared_breathe";
						_unit selectWeapon handGunWeapon _unit;
						[_unit, "AmovPercMstpSrasWpstDnon"] remoteExec ["switchMove",-2];
						_ifInter = lineIntersectsSurfaces[eyePos _unit, eyePos _creature, _unit, _creature, true, 1, "GEOM", "FIRE"];
						_count = _unit ammo handgunWeapon _unit;
						if (((alive _creature) AND ((_count > 0)))) then {
						    if ((count _ifInter == 0)) then {
							_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
							_unit setHitPointDamage["HitLegs", 0.5];
							_unit say2D "player_scared_breathe";
							_unit setCustomAimCoef 20;
							_unit forceWalk false;
							sleep 15;
							_unit setVariable["IsControlledBy", nil, true];
							_unit setCustomAimCoef 1;
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							} else {
							_unit forceWalk false;
							_unit setVariable["IsControlledBy", nil, true];
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							_unit setCustomAimCoef 1;
							[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
					   		};
						} else {
							_unit forceWalk false;
							_unit setVariable["IsControlledBy", nil, true];
							_unit setVariable["IsControlled_ToUnnarmed", 0, true];
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							_unit setCustomAimCoef 1;
							[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
						};
					} else {
						_unit say2D selectRandom["player_after_shot_1", "player_after_shot_2"];
						[_unit, "Controller_human_pistol_kill"] remoteExec ["playActionNow",-2];
						sleep 4.15;
						_unit selectWeapon handGunWeapon _unit;
						[_unit, "AmovPercMstpSrasWpstDnon"] remoteExec ["switchMove",-2];
						_ifInter = lineIntersectsSurfaces[eyePos _unit, eyePos _creature, _unit, _creature, true, 1, "GEOM", "FIRE"];
						_count = _unit ammo handgunWeapon _unit;
						if (((alive _creature) AND ((_count > 0)))) then {
						     if ((count _ifInter == 0)) then {
							_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
							sleep 0.1;
							_unit setDamage 1;
							_unit setVariable["IsControlledBy", nil, true];
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							} else {
							_unit forceWalk false;
							_unit setVariable["IsControlledBy", nil, true];
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							_unit setCustomAimCoef 1;
							[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
					   		};
						} else {
							_unit forceWalk false;
							_unit setVariable["IsControlledBy", nil, true];
							_unit setVariable["IsControlled_ToUnnarmed", 0, true];
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							_unit setCustomAimCoef 1;
							[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
						};
					};
				} else {
					if ((currentWeapon _unit == "") or(currentWeapon _unit == secondaryWeapon _unit) or!(isNil {_unit getVariable "IsControlled_ToUnnarmed"})) then {
						[_unit, "Controlled_idle_u"] remoteExec ["switchMove",-2];
						_unit forceWalk true;
						[_unit, "Controller_human_unnarmed_gest"] remoteExec ["playActionNow",-2];
						_unit action ["SwitchWeapon", _unit, _unit, 100];
						sleep 3.9;
						_ifInter = lineIntersectsSurfaces[eyePos _unit, eyePos _creature, _unit, _creature, true, 1, "GEOM", "FIRE"];
						if ((count _ifInter == 0) AND ((alive _creature))) then {
							_unit action ["SwitchWeapon", _unit, _unit, 100];
							_blood = "BloodSpray_01_New_F"
							createVehicle[getPosATL _unit select 0, getPosATL _unit select 1, (getPosATL _unit select 2) - 2];
							[_unit, "Controller_human_unnarmed_anim_in"] remoteExec ["switchMove",-2];
							[_blood, "chimera_death_fall", 85] call CBA_fnc_globalSay3d;
							sleep 0.7;
							_blood attachTo[_unit, [0, 0.85, 0]];
							detach _blood;
							_normal = surfaceNormal getPosATL _blood;
							_blood setVectorUp _normal;
							if (headgear _unit == "") then {
								_rndSound = selectRandom["head_beat_1", "head_beat_2"];
								[_blood, _rndSound, 30] call CBA_fnc_globalSay3d;
							} else {
								_helmProtection = (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") call BIS_fnc_GetCfgData;
								if ((_helmProtection >= 2)) then {
									_rndSound = selectRandom["head_beat_helm_1", "head_beat_helm_2"];
									[_blood, _rndSound, 30] call CBA_fnc_globalSay3d;
								} else {
									_rndSound = selectRandom["head_beat_1", "head_beat_2"];
									[_blood, _rndSound, 30] call CBA_fnc_globalSay3d;
								};
							};
							sleep 0.6;
							[_unit, "Controller_human_unnarmed_anim_loop"] remoteExec ["switchMove",-2];
							[_unit, _creature] spawn _controllerUnnarmed_HeadSoundsAndCheck;
							if (headgear _unit == "") then {
								sleep 10;
							} else {
								_helmProtection = (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") call BIS_fnc_GetCfgData;
								if ((_helmProtection >= 2)) then {
									sleep 20;
								} else {
									sleep 10;
								};
							};
							if ((animationState _unit == "Controller_human_unnarmed_anim_loop")) then {
								_unit setDamage 1;
								[_unit, "Controller_human_unnarmed_anim_out"] remoteExec ["switchMove",-2];
								ppEffectDestroy PP_radial;
								ppEffectDestroy PP_chrom;
								ppEffectDestroy PP_wetD;
								ppEffectDestroy PP_film;
								sleep 0.7;
								_unit setVariable["IsControlledBy", nil, true];
								_unit setVariable["IsControlled_ToUnnarmed", nil, true];
								_soundCache = "Land_HelipadEmpty_F"
								createVehicle position _unit;
								_soundCache attachTo[_unit, [0, 0, 0], "head"];
								_rndSound = selectRandom["chimera_kill_victim_1", "chimera_kill_victim_2", "chimera_kill_victim_3", "chimera_kill_victim_4"];
								[_soundCache, _rndSound, 25] call CBA_fnc_globalSay3d;
								sleep 6;
								deleteVehicle _soundCache;
							};
						} else {
							[_unit,0.15] remoteExecCall ["RRPClient_mut_setDamage",_unit];
							[_unit, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove",-2];
							_unit forceWalk false;
							_unit setVariable["IsControlledBy", nil, true];
							titleCut["", "WHITE IN", 0.5];
							ppEffectDestroy PP_radial;
							ppEffectDestroy PP_chrom;
							ppEffectDestroy PP_wetD;
							ppEffectDestroy PP_film;
							_unit setCustomAimCoef 1;
							[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];
						};
					};

				};
			};
		};
	} else {
		sleep 1.95;
		if ((currentWeapon _unit == primaryWeapon _unit) AND (!(currentWeapon _unit == ""))) then {
			_unit forceWalk true;
			_rndChance = random 100;
			[_unit, "Controlled_idle_w"] remoteExec ["switchMove",-2];
			_unit action ["SwitchWeapon", _unit, _unit, 100];
			if (_rndChance >= 75) then {
				[_unit, "Controller_human_rifle_hit"] remoteExec ["playActionNow",-2];
				sleep 3.9;
				_unit selectWeapon primaryWeapon _unit;
				[_unit, "AmovPercMstpSrasWrflDnon"] remoteExec ["switchMove",-2];
				_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
				addCamShake[4, 20, 2];
				_unit setCustomAimCoef 20;
				sleep 5;
				_unit forceWalk false;
				sleep 5;
				_unit setCustomAimCoef 10;
				sleep 6;
				_unit setCustomAimCoef 1;
				_unit setVariable["IsControlledBy", nil, true];
			} else {
				[_unit, "Controller_human_rifle_kill"] remoteExec ["playActionNow",-2];
				sleep 3.8;
				_unit selectWeapon primaryWeapon _unit;
				[_unit, "AmovPercMstpSrasWrflDnon"] remoteExec ["switchMove",-2];
				_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
				sleep 0.1;
				_unit setVariable["IsControlledBy", nil, true];
				_unit setDamage 1;
			};
		};
		if ((currentWeapon _unit == handgunWeapon _unit) AND (!(currentWeapon _unit == ""))) then {
			_unit forceWalk true;
			[_unit, "Controlled_idle_p"] remoteExec ["switchMove",-2];
			_unit action ["SwitchWeapon", _unit, _unit, 100];
			_rndChance = random 100;
			if (_rndChance >= 75) then {
				[_unit, "Controller_human_pistol_hit"] remoteExec ["playActionNow",-2];
				sleep 2.8;
				_unit selectWeapon handGunWeapon _unit;
				[_unit, "AmovPercMstpSrasWpstDnon"] remoteExec ["switchMove",-2];
				_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
				_unit setHitPointDamage["HitLegs", 0.5];
				_unit setCustomAimCoef 20;
				_unit forceWalk false;
				sleep 15;
				_unit setVariable["IsControlledBy", nil, true];
				_unit setCustomAimCoef 1;
			} else {
				[_unit, "Controller_human_pistol_kill"] remoteExec ["playActionNow",-2];
				sleep 4.15;
				_unit selectWeapon handGunWeapon _unit;
				[_unit, "AmovPercMstpSrasWpstDnon"] remoteExec ["switchMove",-2];
				_unit forceWeaponFire[weaponState _unit select 1, weaponState _unit select 2];
				sleep 0.1;
				_unit setVariable["IsControlledBy", nil, true];
				_unit setDamage 1;
			};
		};
		if ((currentWeapon _unit == "")) then {
			[_unit, "Controlled_idle_u"] remoteExec ["switchMove",-2];
			_unit forceWalk true;
			[_unit, "Controller_human_unnarmed_gest"] remoteExec ["playActionNow",-2];
			sleep 3.9;
			_blood = "BloodSpray_01_New_F"
			createVehicle[0, 0, 0];
			[_unit, "Controller_human_unnarmed_anim_in"] remoteExec ["switchMove",-2];
			sleep 0.7;
			_blood attachTo[_unit, [0, 0.85, 0]];
			detach _blood;
			_normal = surfaceNormal getPosATL _blood;
			_blood setVectorUp _normal;
			sleep 0.6;
			[_unit, "Controller_human_unnarmed_anim_loop"] remoteExec ["switchMove",-2];
			sleep 10;
			_unit setDamage 1;
			_unit setVariable["IsControlledBy", nil, true];
			[_unit, "Controller_human_unnarmed_anim_out"] remoteExec ["switchMove",-2];
		};
	};
};